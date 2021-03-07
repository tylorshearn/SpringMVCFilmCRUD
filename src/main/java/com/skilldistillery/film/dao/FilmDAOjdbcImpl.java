package com.skilldistillery.film.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Component;

import com.skilldistillery.film.entities.Actor;
import com.skilldistillery.film.entities.Film;

@Component
public class FilmDAOjdbcImpl implements FilmDAO {


	private static final String URL = "jdbc:mysql://localhost:3306/sdvid?useSSL=false";
	private static String username = "student";
	private static String password = "student";

	static {
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (Exception e) {
			System.err.println(e);
		}
	}

	@Override
	public Film findFilmById(int filmId) {
		Film film = null;
		String sqltxt = "SELECT film.*, language.name, category.name FROM film JOIN language ON film.language_id = language.id "
				+ " LEFT OUTER JOIN film_category ON film.id = film_category.film_id "
				+ " LEFT OUTER JOIN category ON film_category.category_id = category.id "
				+ "WHERE film.id = ?";

		try (Connection conn = DriverManager.getConnection(URL, username, password);
				PreparedStatement prepStmt = conn.prepareStatement(sqltxt);) {
			prepStmt.setInt(1, filmId);
			ResultSet rs = prepStmt.executeQuery();
			if (rs.next()) {
				film = new Film(rs.getInt("film.id"), rs.getInt("film.language_id"), rs.getInt("film.rental_duration"),
						rs.getInt("film.length"), rs.getDouble("film.rental_rate"),
						rs.getDouble("film.replacement_cost"), rs.getString("film.title"),
						rs.getString("film.description"), rs.getString("film.rating"),
						rs.getString("film.special_features"), rs.getInt("film.release_year"),
						findActorsByFilmId(filmId), rs.getString("language.name"), rs.getString("category.name"));
			}
		} catch (SQLException e) {
			System.err.println(e);
		}
		return film;
	}

	@Override
	public Actor findActorById(int actorId) {
		Actor actor = null;
		String sqltxt = "SELECT * FROM actor WHERE id = ?";

		try (Connection conn = DriverManager.getConnection(URL, username, password);
				PreparedStatement prepStmt = conn.prepareStatement(sqltxt);) {
			prepStmt.setInt(1, actorId);
			ResultSet rs = prepStmt.executeQuery();
			if (rs.next()) {
				actor = new Actor(rs.getInt("id"), rs.getString("first_name"), rs.getString("last_name"));
			}
		} catch (SQLException e) {
			System.err.println(e);
		}
		return actor;
	}

	@Override
	public List<Actor> findActorsByFilmId(int filmId) {
		List<Actor> actorsList = new ArrayList<>();
		String sqltxt = "SELECT actor.id, actor.first_name, actor.last_name "
				+ " FROM actor JOIN film_actor ON actor.id = film_actor.actor_id " + " WHERE film_actor.film_id = ?";

		try (Connection conn = DriverManager.getConnection(URL, username, password);
				PreparedStatement prepStmt = conn.prepareStatement(sqltxt);) {
			prepStmt.setInt(1, filmId);
			ResultSet rs = prepStmt.executeQuery();
			while (rs.next()) {
				actorsList.add(findActorById(rs.getInt("id")));
			}
		} catch (SQLException e) {
			System.err.println(e);
		}
		return actorsList;
	}

	@Override
	public List<Film> findFilmByKeyword(String keyword) {
		List<Film> filmsList = new ArrayList<>();
		Film film = null;
		String sqltxt = "SELECT film.*, language.name " + "FROM film LEFT OUTER JOIN language ON film.language_id = language.id "
				+ "WHERE title LIKE ? OR description LIKE ?";

		try (Connection conn = DriverManager.getConnection(URL, username, password);
				PreparedStatement prepStmt = conn.prepareStatement(sqltxt);) {
			prepStmt.setString(1, "%" + keyword + "%");
			prepStmt.setString(2, "%" + keyword + "%");
			ResultSet rs = prepStmt.executeQuery();
			while (rs.next()) {
				int filmId = rs.getInt("id");
				film = findFilmById(filmId);
				filmsList.add(film);
			}
		} catch (SQLException e) {
			System.err.println(e);
		}
		return filmsList;
	}

	@Override
	public Film createFilm(Film film) {
		Film addFilm = null;

		String sqltxt = "INSERT INTO film (title, description, release_year, language_id, length, rental_rate, replacement_cost, rental_duration, rating, special_features)"
				+ "VALUES (?,?,?,?,?,?,?,?,?,?) ";

		Connection conn = null;

		try {
			conn = DriverManager.getConnection(URL, username, password);
			conn.setAutoCommit(false); // Start transaction

			PreparedStatement st = conn.prepareStatement(sqltxt, Statement.RETURN_GENERATED_KEYS);
			st.setString(1, film.getTitle());
			st.setString(2, film.getDescription());
			st.setInt(3, film.getReleaseYear());
			st.setInt(4, film.getLanguageId());
			st.setInt(5, film.getLength());
			st.setDouble(6, film.getRentalRate());
			st.setDouble(7, film.getReplacementCost());
			st.setInt(8, film.getRentalDuration());
			st.setString(9, film.getRating());
			st.setString(10, film.getSpecialFeatures());

			int uc = st.executeUpdate();
			conn.commit();

			System.out.println(uc + " film record created.");
			// Now get the auto-generated actor IDs:
			ResultSet keys = st.getGeneratedKeys();
			while (keys.next()) {
				film.setFilmId(keys.getInt(1));
				System.out.println("New film ID: " + film.getFilmId());
			}
			addFilm = film;
			st.close();
			conn.close();

		} catch (SQLException sqle) {
			sqle.printStackTrace();
			if (conn != null) {
				try {
					conn.rollback();
					conn.close();
				} catch (SQLException sqle2) {
					System.err.println("Error trying to rollback");
				}
			}
		}
		return addFilm;
	}

	@Override
	public boolean deleteFilm(Film film) {

		String sqltxt = "DELETE FROM film WHERE film.id = ?";

		Connection conn = null;

		try {
			conn = DriverManager.getConnection(URL, username, password);
			conn.setAutoCommit(false); // Start transaction

			PreparedStatement st = conn.prepareStatement(sqltxt);
			st.setInt(1, film.getFilmId());

			int uc = st.executeUpdate();
			conn.commit();

			System.out.println(uc + " record(s) affected.");

			st.close();
			conn.close();

		} catch (SQLException sqle) {
			sqle.printStackTrace();
			if (conn != null) {
				try {
					conn.rollback();
					conn.close();
				} catch (SQLException sqle2) {
					System.err.println("Error trying to rollback");
				}
			}
			return false;
		}
		return true;
	}

	@Override
	public Film updateFilm(Film film) {
		System.out.println("what was sent to sql query" + film);
		String sqltxt = "UPDATE film SET title=?, description=?, release_year=?, language_id=?,"
				+ " rental_duration=?, rental_rate=?, length=?, replacement_cost=?, rating=?, special_features=? "
				+ "WHERE film.id = ?";

		Connection conn = null;
		
		try {
			conn = DriverManager.getConnection(URL, username, password);
			conn.setAutoCommit(false); // Start transaction

			PreparedStatement st = conn.prepareStatement(sqltxt);
			st.setString(1, film.getTitle());
			st.setString(2, film.getDescription());
			st.setInt(3, film.getReleaseYear());
			st.setInt(4, film.getLanguageId());
			st.setInt(5, film.getRentalDuration());
			st.setDouble(6, film.getRentalRate());
			st.setInt(7, film.getLength());
			st.setDouble(8, film.getReplacementCost());
			st.setString(9, film.getRating());
			st.setString(10, film.getSpecialFeatures());
			st.setInt(11, film.getFilmId());

			int uc = st.executeUpdate();
			conn.commit();
			film = findFilmById(film.getFilmId());
			System.out.println("after sql query" + film);
			System.out.println(uc + " film record updated.");
			return film;

		} catch (SQLException sqle) {
			sqle.printStackTrace();
			if (conn != null) {
				try {
					conn.rollback();
					conn.close();
				} catch (SQLException sqle2) {
					System.err.println("Error trying to rollback");
				}
			}
			return null;
		}
	}

}

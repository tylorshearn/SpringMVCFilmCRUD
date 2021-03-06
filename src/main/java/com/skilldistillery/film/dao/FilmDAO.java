package com.skilldistillery.film.dao;

import com.skilldistillery.film.entities.Film;

public interface FilmDAO {
	public Film findFilmById(int filmId);
}

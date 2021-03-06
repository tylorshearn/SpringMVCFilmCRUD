package com.skilldistillery.film.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.film.dao.FilmDAO;

@Controller
public class FilmController {

	@Autowired
	private FilmDAO filmDAO;
	
	@RequestMapping(path= {"/", "home.do"})
	public String home() {
		// Add list of all films to model
		return "index";
	}
	
	@RequestMapping(path="/searchByFilmIdForm.do")
	public String form1() {
		// Add list of all films to model
		return "searchByFilmIdForm";
	}
	
	@RequestMapping(path="/createFilmForm.do")
	public String form2() {
		// Add list of all films to model
		return "createFilmForm";
	}
	
	@RequestMapping(path="/searchByKeyPatForm.do")
	public String form3() {
		// Add list of all films to model
		return "searchByKeyPatForm";
	}
	
	@RequestMapping(path= "getFilmByID.do", method = RequestMethod.GET)
	public String getFilmByID(int filmId) {
		ModelAndView mv = new ModelAndView();
		mv.addObject("film", filmDAO.findFilmById(filmId));
		
	
		return "result";
	}
}

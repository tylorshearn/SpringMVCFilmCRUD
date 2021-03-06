package com.skilldistillery.film.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.skilldistillery.film.dao.FilmDAO;
import com.skilldistillery.film.entities.Film;

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
		return "searchByFilmIdForm";
	}
	
	@RequestMapping(path="/createFilmForm.do")
	public String form2() {
		return "createFilmForm";
	}
	
	@RequestMapping(path="/searchByKeyPatForm.do")
	public String form3() {
		return "searchByKeyPatForm";
	}
	
	@RequestMapping(path= "getFilmByID.do", method = RequestMethod.GET)
	public ModelAndView getFilmByID(int filmId) {
		ModelAndView mv = new ModelAndView();
		mv.addObject("film", filmDAO.findFilmById(filmId));
		mv.setViewName("filmResult");
		return mv;
	}
	
	@RequestMapping(path= "getFilmByKeyword.do", method = RequestMethod.GET)
	public ModelAndView getFilmsByKeyword(String keyword) {
		ModelAndView mv = new ModelAndView();
		mv.addObject("films", filmDAO.findFilmByKeyword(keyword));
		mv.setViewName("filmListResult");
		return mv;
	}
	
	@RequestMapping(path= "addFilm.do", method = RequestMethod.POST)
	public String addFilm(Film film, RedirectAttributes redir) {
		redir.addFlashAttribute("films", filmDAO.createFilm(film));
		return "redirect:filmAdd.do";
	}
	
	@RequestMapping("filmAdd.do")
	public ModelAndView addFilm() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("filmResult");
		return mv;
	}
}

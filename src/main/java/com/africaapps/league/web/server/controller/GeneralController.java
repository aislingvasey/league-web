package com.africaapps.league.web.server.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class GeneralController {
	
	@RequestMapping(value="/", method = RequestMethod.GET)
	public String printRoot(ModelMap model) {
		return "welcome";
	}
}

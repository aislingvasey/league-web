package com.africaapps.league.web.server.welcome;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class WelcomeController {
 
	@RequestMapping(value="/welcome", method = RequestMethod.GET)
	public String printWelcome(ModelMap model) {
		model.addAttribute("message", "Hello Herbs!");
		return "hello";
	}
	
	@RequestMapping(value="/bye", method = RequestMethod.GET)
	public String printBye(ModelMap model) {
		model.addAttribute("message", "Bye Herbs!");
		return "hello";
	}
	
	@RequestMapping(value="/", method = RequestMethod.GET)
	public String printRoot(ModelMap model) {
		model.addAttribute("message", "You hit the root!");
		return "hello";
	}
}

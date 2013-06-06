package com.africaapps.league.web.server.user;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.africaapps.league.exception.LeagueException;
import com.africaapps.league.model.game.User;
import com.africaapps.league.service.user.UserService;

@Controller
@RequestMapping(value = "/user")
public class UserController {

	@Autowired
	private UserService userService;

	private static Logger logger = LoggerFactory.getLogger(UserController.class);

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String checkUser(@RequestParam(required = false, value = "username") String username,
			@RequestParam(required = false, value = "password") String password, 
			ModelMap model) {
		try {
			if (username != null && !username.trim().equals("")) {
				User user = userService.getUser(username, password);
				if (user != null) {
					// TODO getUserTeams(user);
				} else {		
					model.addAttribute("username", username);
					return "register";
				}
			} else {
				model.addAttribute("message", "No username specified");
				logger.error("No username");
			}
		} catch (LeagueException e) {
			logger.error("Error getting user: ", e);
			model.addAttribute("message", "Sorry unable to retrieve your user " + username);
		}
		return "welcome";
	}
	
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String registerUser(@RequestParam(required = false, value = "username") String username, ModelMap model) {
		try {
			if (username != null && !username.trim().equals("")) {
				User user = new User();
				user.setUsername(username);
				userService.saveUser(user);
				model.addAttribute("newUser", true);
				return "redirect:/pages/teams.jsp";
			} else {
				model.addAttribute("message", "Enter your username!");
				return "register";
			}
		} catch (LeagueException e) {
			logger.error("Error saving user: ", e);
			model.addAttribute("message", "Unable to save the user " + username);
			return "register";
		}
	}
}

package com.africaapps.league.web.server.controller.user;

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
import com.africaapps.league.web.server.controller.BaseLeagueController;

@Controller
@RequestMapping(value = "/user")
public class UserController extends BaseLeagueController {

	@Autowired
	private UserService userService;

	private static Logger logger = LoggerFactory.getLogger(UserController.class);

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String checkUser(@RequestParam(required = false, value=USERNAME_PARAM) String username,
			                    @RequestParam(required = false, value="password") String password, 
			                    ModelMap model) {
		try {
			if (username != null && !username.trim().equals("")) {
				User user = userService.getUser(username, password);
				if (user != null) {
					model.addAttribute(USER_ID_PARAM, user.getId().toString());
					return "redirect:/team/list?"+USER_ID_PARAM+"="+user.getId();
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
	public String registerUser(@RequestParam(required=false, value=USERNAME_PARAM) String username, ModelMap model) {
		try {
			if (username != null && !username.trim().equals("")) {
				User user = new User();
				user.setUsername(username);
				userService.saveUser(user);
				model.addAttribute(USER_ID_PARAM, user.getId().toString());
				model.addAttribute("newUser", true);
				return "redirect:/team/list?"+NEW_USER_PARAM+"=true&"+USER_ID_PARAM+"="+user.getId();
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
	
	@RequestMapping(value="/startRegister")
	public String startRegister(@RequestParam(required=false, value=USERNAME_PARAM) String username, ModelMap model) {
		if (username != null) {
			model.addAttribute(USERNAME_PARAM, username);
		}
		return "register";
	}
}

package com.africaapps.league.web.server.user;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.africaapps.league.exception.LeagueException;
import com.africaapps.league.model.game.User;
import com.africaapps.league.model.game.UserTeam;
import com.africaapps.league.service.game.team.UserTeamService;
import com.africaapps.league.service.user.UserService;
import com.africaapps.league.web.server.spring.BaseSpringServlet;

public class UserServlet extends BaseSpringServlet {

	private static final long serialVersionUID = 1L;

	private static final String LOGIN_PATH = "/login";
	private static final String USERNAME_PARAM = "username";
	private static final String PWD_PARAM = "password";

	@Autowired
	private UserService userService;
	@Autowired
	private UserTeamService userTeamService;

	private static Logger logger = LoggerFactory.getLogger(UserServlet.class);

	@Override
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
	}

	@Override
	protected void setAttributes(ServletConfig config) {
		super.setAttributes(config);
	}

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String path = request.getPathInfo();
		logger.info("Received request for path:" + path);
		if (path != null && !path.trim().equals("")) {
			if (path.indexOf(LOGIN_PATH) > -1) {
				loginUser(request, response);
			}
		} else {
			logger.error("No path specified for request: " + request);
			// TODO redirect back to welcome page
		}
	}

	private void loginUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String username = getUsername(request);
			String password = request.getParameter(PWD_PARAM);
			User user = userService.getUser(username, password);
			if (user != null) {
				displayTeams(user, request, response);
			} else {
				// TODO redirect back to welcome page with message
			}
		} catch (LeagueException e) {
			logger.error("Error getting user: ", e);
			// TODO redirect back to welcome page with message
		}
	}

	private String getUsername(HttpServletRequest request) throws ServletException, IOException {
		// TODO check where we are from - mxit header for username
		return request.getParameter(USERNAME_PARAM);
	}

	private void displayTeams(User user, HttpServletRequest request, HttpServletResponse response) throws LeagueException,
			ServletException, IOException {
		List<UserTeam> teams = userTeamService.getTeams(user.getId());
		logger.info("Got teams: " + teams.size() + " for user: " + user.getUsername());
		if (teams.size() > 0) {
			// TODO display teams page

		} else {
			// TODO create yr team page
		}
	}
}

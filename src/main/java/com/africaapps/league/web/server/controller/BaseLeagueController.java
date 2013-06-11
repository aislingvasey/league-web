package com.africaapps.league.web.server.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.africaapps.league.exception.LeagueException;
import com.africaapps.league.model.game.User;
import com.africaapps.league.service.user.UserService;

public class BaseLeagueController {

	protected static final String NUMERIC_REG_EXP = "[0-9]+";
	
	protected static final String NEW_USER_PARAM = "newuser";
	protected static final String USER_ID_PARAM = "userid";
	protected static final String USERNAME_PARAM = "username";
	protected static final String TEAM_NAME_PARAM = "teamname";
	protected static final String TEAM_ID_PARAM = "teamid";
	protected static final String LEAGUE_ID_PARAM = "leagueid";
	
	protected static final String TEAMS_PAGE_MAPPING = "teams";
	protected static final String PLAYERS_PAGE_MAPPING = "players";
	protected static final String REGISTER = "register";
	protected static final String LEAGUE_PAGE_MAPPING = "league";
	protected static final String TEAMS_SEARCH_PAGE_MAPPING = "searchTeams";
	protected static final String TEAM_PLAYERS_PAGE_MAPPING = "teamPlayers";
	
	@Autowired
	private UserService userService;
	
	private static Logger logger = LoggerFactory.getLogger(BaseLeagueController.class);
	
	protected User getUser(HttpServletRequest request, String userId, String username) {
		Long uId = null;
		if (isValidId(userId)) {
			uId = Long.valueOf(userId);
		} else {
			uId = getUserId(request);
		}
		if (uId != null) {
			try {
				User user = userService.getUser(uId);
				logger.debug("Got user for id: " + uId + " - " + user);
				return user;
			} catch (LeagueException e) {
				logger.error("Error getting user by id:", e);
				return null;
			}
		} else if (username != null) {
			try {
				User user = userService.getUser(username, null);
				logger.debug("Got user for username: " + username + " - " + user);
				return user;
			} catch (LeagueException e) {
				logger.error("Error getting user by username:", e);
				return null;
			}
		} else {
			logger.error("No userid or username found");
			return null;
		}
	}
	
	protected String getUsername(HttpServletRequest request) {		
		if (request.getParameter("username") != null) {
			return request.getParameter("username");
		} else {
			//TODO check for mxit header
			logger.info("Checking for username header");
			return null;
		}
	}
	
	protected Long getUserId(HttpServletRequest request) {
		if (request.getParameter(USER_ID_PARAM) != null) {
			if (isValidId(request.getParameter(USER_ID_PARAM))) {
				return Long.valueOf(request.getParameter(USER_ID_PARAM));
			} else {
				logger.error("Invalid numeric id parameter: "+request.getParameter(USER_ID_PARAM));
				return null;
			}
		} else {
			logger.debug("Trying to get username");
			String username = getUsername(request);
			if (username != null) {
				try {
					return userService.getUserId(username);
				} catch (LeagueException e) {
					return null;
				}
			} else {
				logger.error("Unknown username: "+username);
				return null;
			}
		}
	}
	
	protected boolean isValidId(String value) {
		if (value != null && value.matches(NUMERIC_REG_EXP)) {
			return true;
		} else {
			return false;
		}
	}
	
	protected boolean isValid(String value) {
		if (value != null && !value.trim().equals("")) {
			return true;
		} else {
			return false;
		}
	}
}

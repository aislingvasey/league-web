package com.africaapps.league.web.server.controller;

import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.ModelMap;

import com.africaapps.league.exception.LeagueException;
import com.africaapps.league.model.game.User;
import com.africaapps.league.service.user.UserService;

public class BaseLeagueController {

	protected static final String MXIT_USER_ID_HEADER = "X-Mxit-USERID-R";
	protected static final String MXIT_NICK_NAME_HEADER = "X-Mxit-Nick";
	
	protected static final int DEFAULT_PAGE_SIZE = 15;

	protected static final String NUMERIC_REG_EXP = "[0-9]+";

	protected static final String NEW_USER_PARAM = "newuser";
	protected static final String USER_ID_PARAM = "userid";
	protected static final String USERNAME_PARAM = "username";
	protected static final String TEAM_NAME_PARAM = "teamname";
	protected static final String TEAM_ID_PARAM = "teamid";
	protected static final String LEAGUE_ID_PARAM = "leagueid";
	protected static final String PLAYER_ID_PARAM = "playerid";
	protected static final String POOL_PLAYER_ID_PARAM = "poolplayerid";
	protected static final String MATCH_ID_PARAM = "matchid";
	protected static final String MESSAGE_PARAM = "message";
	protected static final String PAGE_PARAM = "page";
	protected static final String PAGE_SIZE_PARAM = "size";

	protected static final String DEFAULT_MAPPING = "welcome";
	protected static final String TEAMS_PAGE_MAPPING = "teams";
	protected static final String NEW_TEAM_PAGE_MAPPING = "teamNew";
	protected static final String PLAYERS_PAGE_MAPPING = "players";
	protected static final String REGISTER = "register";
	protected static final String LEAGUE_PAGE_MAPPING = "league";
	protected static final String TEAMS_SEARCH_PAGE_MAPPING = "searchTeams";
	protected static final String SEARCH_PLAYERS_PAGE_MAPPING = "searchPlayers";
	protected static final String TEAM_PLAYERS_PAGE_MAPPING = "teamPlayers";
	protected static final String POINTS_PRICE_SEARCH_PAGE_MAPPING = "pointPriceSearchPlayers";
	protected static final String CHANGE_TEAM_FORMAT_MAPPING = "format";
	protected static final String PLAYER_MATCHES_PAGE_MAPPING = "playerMatches";
	protected static final String PLAYER_MATCH_STATS_PAGE_MAPPING = "playerMatchStats";
	protected static final String TEAM_HISTORY_PAGE_MAPPING = "teamHistory";
	protected static final String USER_TEAM_SCORE_HISTORY_PAGE_MAPPING = "userTeamHistory";
	protected static final String USER_TEAM_PLAYING_WEEK_PAGE_MAPPING = "userTeamPlayingWeeks";
	protected static final String USER_TEAM_SCORE_PLAYERS_HISTORY_PAGE_MAPPING = "userTeamPlayersHistory";
	protected static final String POOL_PLAYERS_PAGE_MAPPING = "poolPlayers";
	protected static final String TRADE_PLAYER_MAPPING = "tradePlayer";

	@Autowired
	private UserService userService;

	private static Logger logger = LoggerFactory.getLogger(BaseLeagueController.class);

	protected User getUser(HttpServletRequest request, String userId, String username) {
		logger.debug("Trying to identify user for request userId: " + userId + " username: " + username);
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

	protected Long getUserId(HttpServletRequest request) {
		if (request.getParameter(USER_ID_PARAM) != null) {
			if (isValidId(request.getParameter(USER_ID_PARAM))) {
				return Long.valueOf(request.getParameter(USER_ID_PARAM));
			} else {
				logger.error("Invalid numeric id parameter: " + request.getParameter(USER_ID_PARAM));
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
				logger.error("Unknown username: " + username);
				return null;
			}
		}
	}

	protected String getUsername(HttpServletRequest request) {
		if (request.getParameter("username") != null) {
			return request.getParameter("username");
		} else {
			return getMxitUser(request);
		}
	}
	
	protected String getMxitUser(HttpServletRequest request) {
		printHeaders(request);
		logger.info("Checking for MXIT userid header");
		String mxitHeaderUserId = request.getHeader(MXIT_USER_ID_HEADER);
		logger.info("Got MXIT header: " + mxitHeaderUserId);
		return mxitHeaderUserId;
	}
	
	protected String getMxitNickName(HttpServletRequest request) {
		String nickname = request.getHeader(MXIT_NICK_NAME_HEADER);
		logger.info("Got MXIT nickname: " + nickname);
		return nickname;
	}

	private void printHeaders(HttpServletRequest request) {
		if (logger.isDebugEnabled()) {
			if (request != null) {
				Enumeration<String> names = request.getHeaderNames();
				if (names != null) {
					String name = "";
					while (names.hasMoreElements()) {
						name = names.nextElement();
						logger.debug("Header: " + name + " = " + request.getHeader(name));
					}
				}
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

	protected boolean isValidInteger(String value) {
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

	protected void updateAttributes(ModelMap model, String userId, String teamId, String poolPlayerId, String matchId) {
		model.remove(USER_ID_PARAM);
		if (userId != null) {
			model.addAttribute(USER_ID_PARAM, userId);
		}

		model.remove(TEAM_ID_PARAM);
		if (teamId != null) {
			model.addAttribute(TEAM_ID_PARAM, teamId);
		}

		model.remove(POOL_PLAYER_ID_PARAM);
		if (poolPlayerId != null) {
			model.addAttribute(POOL_PLAYER_ID_PARAM, poolPlayerId);
		}

		model.remove(MATCH_ID_PARAM);
		if (matchId != null) {
			model.addAttribute(MATCH_ID_PARAM, matchId);
		}
	}

	protected void removeAndAdd(ModelMap model, String name, Object value) {
		model.remove(name);
		model.addAttribute(name, value);
	}
}

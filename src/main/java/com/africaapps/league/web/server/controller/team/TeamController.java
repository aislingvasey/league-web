package com.africaapps.league.web.server.controller.team;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.africaapps.league.exception.LeagueException;
import com.africaapps.league.model.game.TeamFormat;
import com.africaapps.league.model.game.User;
import com.africaapps.league.model.game.UserLeague;
import com.africaapps.league.model.game.UserTeam;
import com.africaapps.league.service.game.team.UserTeamService;
import com.africaapps.league.web.server.controller.BaseLeagueController;

@Controller
@RequestMapping(value = "/team")
public class TeamController extends BaseLeagueController {

	@Autowired
	private UserTeamService userTeamService;

	private static Logger logger = LoggerFactory.getLogger(TeamController.class);

	@RequestMapping(value = "/list")
	public String getUserTeams(HttpServletRequest request,
			@RequestParam(required = false, value = NEW_USER_PARAM) String newUser,
			@RequestParam(required = false, value = USER_ID_PARAM) String userId,
			@RequestParam(required = false, value = USERNAME_PARAM) String username, ModelMap model) {
		logger.info("Getting teams for user: " + userId + " newUser:" + newUser + " username: " + username);
		User user = getUser(request, userId, username);
		if (user != null) {
			model.addAttribute(USER_ID_PARAM, user.getId().toString());
			logger.debug("Found correcponding user: " + user);
		} else {
			logger.error("Unknown user!");
			if (username != null) {
				model.addAttribute("username", username);
			}
			return "redirect:/user/startRegister";
		}

		if (newUser == null || !newUser.equalsIgnoreCase("true")) {
			try {
				List<UserTeam> teams = userTeamService.getTeams(user.getId());
				logger.info("Got teams: " + teams.size());
				model.addAttribute("teams", teams);
			} catch (LeagueException e) {
				model.addAttribute("message", "Unable to load your teams");
				return "teams";
			}
		} else {
			model.addAttribute("newUser", "true");
		}
		return TEAMS_PAGE_MAPPING;
	}

	@RequestMapping(value = "/create")
	public String startCreateTeam(HttpServletRequest request,
			@RequestParam(required = false, value = TEAM_NAME_PARAM) String teamName,
			@RequestParam(required = false, value = USER_ID_PARAM) String userId,
			@RequestParam(required = false, value = USERNAME_PARAM) String username, ModelMap model) {
		User user = getUser(request, userId, username);
		
			try {
				if (user != null) {
					if (isValid(teamName)) {
						UserTeam userTeam = userTeamService.getTeam(user.getId(), teamName);
						if (userTeam == null) {
							userTeam = new UserTeam();
							userTeam.setName(teamName);
							userTeam.setCurrentScore(0);
							userTeam.setAvailableMoney(getInitTeamMoney());
							userTeam.setCurrentFormat(getDefaultTeamFormat());
							userTeam.setValidTeam(false);
							userTeam.setUserLeague(getDefaultUserLeague());
							userTeam.setUser(user);
							userTeamService.saveTeam(userTeam);
							logger.info("Created team: " + userTeam);
						} else {
							logger.info("Got existing team: " + userTeam);
						}
						List<UserTeam> teams = new ArrayList<>();
						teams.add(userTeam);
						model.addAttribute("teams", teams);
					} else {
						model.addAttribute("message", "Enter a team name");
						return "teams";
					}
				} else {
					logger.error("Unknown user!");
					return REGISTER;
				}
			} catch (LeagueException e) {
				logger.error("Error creating team: ", e);
				model.addAttribute("message", "Unable to create your team!");
			}
		return TEAMS_PAGE_MAPPING;
	}

	protected Long getInitTeamMoney() {
		// TODO
		return Long.valueOf("25000000"); // 25 million
	}

	protected UserLeague getDefaultUserLeague() throws LeagueException {
		return userTeamService.getDefaultUserLeague();
	}

	protected TeamFormat getDefaultTeamFormat() throws LeagueException {
		return userTeamService.getDefaultTeamFormat();
	}
}

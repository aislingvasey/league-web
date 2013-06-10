package com.africaapps.league.web.server.controller.league;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.africaapps.league.dto.UserLeagueSummary;
import com.africaapps.league.exception.LeagueException;
import com.africaapps.league.model.game.User;
import com.africaapps.league.service.game.league.UserLeagueService;
import com.africaapps.league.web.server.controller.BaseLeagueController;

@Controller
@RequestMapping("/league")
public class LeagueController extends BaseLeagueController {
	
	@Autowired
	private UserLeagueService userLeagueService; 

	private static Logger logger = LoggerFactory.getLogger(LeagueController.class);
	
	@RequestMapping(value = "/view")
	public String getUserTeams(HttpServletRequest request,
			@RequestParam(required = false, value = LEAGUE_ID_PARAM) String leagueId,
			@RequestParam(required = false, value = USER_ID_PARAM) String userId,
			ModelMap model) {
		logger.info("Viewing league: "+leagueId+" userid:" + userId);
		User user = getUser(request, userId, null);
		if (user != null) {
			model.addAttribute(USER_ID_PARAM, user.getId().toString());
			logger.debug("Found correcponding user: " + user);
		}

		if (isValidId(leagueId) && user != null) {
			try {
				UserLeagueSummary userLeagueSummary = userLeagueService.getUserLeagueSummary(Long.valueOf(leagueId), user.getId());
				model.addAttribute("league", userLeagueSummary);
			} catch (LeagueException e) {
				model.addAttribute("message", "Unable to load your teams");
			}
		} else if (leagueId == null) {
			model.addAttribute("message", "Unknown league");
		} else if (user == null) {
			model.addAttribute("message", "Unknown user");
		}
		return LEAGUE_PAGE_MAPPING;
	}
	
}

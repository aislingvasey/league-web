package com.africaapps.league.web.server.controller.pool;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.africaapps.league.dto.PoolPlayersResults;
import com.africaapps.league.exception.LeagueException;
import com.africaapps.league.model.game.User;
import com.africaapps.league.service.pool.PoolService;
import com.africaapps.league.web.server.controller.BaseLeagueController;

@Controller
@RequestMapping(value = "/pool")
public class PoolController extends BaseLeagueController {
	
	@Autowired
	private PoolService poolService;

	private static Logger logger = LoggerFactory.getLogger(PoolController.class);
	
	@RequestMapping(value = "")
	public String catchAll(
			HttpServletRequest request,
			@RequestParam(required = false, value = USER_ID_PARAM) String userId,
			@RequestParam(required = false, value = TEAM_ID_PARAM) String userTeamId, 
			@RequestParam(required = false, value = MESSAGE_PARAM) String message,
			@RequestParam(required = false, value = PAGE_PARAM) String page,
			@RequestParam(required = false, value = PAGE_SIZE_PARAM) String pageSize,
			ModelMap model) {
		logger.info("Catch all: "+userId+" "+userTeamId+" "+page+" "+pageSize);
		return "/pool/view";
	}
	
	@RequestMapping(value = "/view")
	public String viewPoolPlayers(
			HttpServletRequest request,
			@RequestParam(required = false, value = USER_ID_PARAM) String userId,
			@RequestParam(required = false, value = TEAM_ID_PARAM) String userTeamId, 
			@RequestParam(required = false, value = MESSAGE_PARAM) String message,
			@RequestParam(required = false, value = PAGE_PARAM) String page,
			@RequestParam(required = false, value = PAGE_SIZE_PARAM) String pageSize,
			ModelMap model) {
		logger.info("Viewing pool players for userId: " + userId + " userTeamId: " + userTeamId);
		User user = getUser(request, userId, null);
		int pageInt = 0;
		if (isValidInteger(page)) {
			pageInt = Integer.valueOf(page);
		}
		int pageSizeInt = DEFAULT_PAGE_SIZE;
		if (isValidInteger(pageSize)) {
			pageSizeInt = Integer.valueOf(pageSize);
		}
		try {
			updateAttributes(model, userId, userTeamId, null, null);	
			if (user != null) {
				if (isValidId(userTeamId)) {									
					PoolPlayersResults results = poolService.getPoolPlayers(Long.valueOf(userTeamId), pageInt, pageSizeInt);
					model.addAttribute("results", results);
					logger.info("Got players: "+results.getPoolPlayers().size());
					return POOL_PLAYERS_PAGE_MAPPING;				
				} else {
					model.addAttribute("message", "No user team specified");
					return POOL_PLAYERS_PAGE_MAPPING;			
				}
			} else {
				//Check for any of the user's identification and if nothing, go back to the default mapping
				removeAndAdd(model, MESSAGE_PARAM, "No user identification found :( ");
				return DEFAULT_MAPPING;
			}
		} catch (LeagueException e) {
			logger.error("Error getting pool players: ", e);
			model.addAttribute("message", "Unable to get pool players");
		}
		return "redirect:/team/list";
	}
}

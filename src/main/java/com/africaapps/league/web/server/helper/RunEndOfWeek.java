package com.africaapps.league.web.server.helper;

import java.util.Calendar;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.africaapps.league.exception.LeagueException;
import com.africaapps.league.model.league.League;
import com.africaapps.league.service.game.playingweek.PlayingWeekService;
import com.africaapps.league.service.league.LeagueService;

public class RunEndOfWeek {
	
	private static Logger LOG = LoggerFactory.getLogger(RunEndOfWeek.class);

	public static void main(String[] args) {
		new RunEndOfWeek();
	}

	public RunEndOfWeek() {
		SpringBeanFactory.createApplicationContext(ProcessFeed.SPRING_CONFIG_LOCATIONS);
		LeagueService leagueService = (LeagueService) SpringBeanFactory.getBean("LeagueService");
		PlayingWeekService playingWeekService = (PlayingWeekService) SpringBeanFactory.getBean("PlayingWeekService");
		try {
			League league = leagueService.getLeague("ABSA Premier Soccer League");
			Calendar now = Calendar.getInstance();
			playingWeekService.completeCurrentPlayingWeek(league, now.get(Calendar.DAY_OF_WEEK));
		} catch (LeagueException e) {
			LOG.error("Error running EndOfWeek: ", e);
		} finally {
			SpringBeanFactory.closeApplicationContext();
			System.exit(0);
		}
	}
	
}

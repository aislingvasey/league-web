package com.africaapps.league.web.server.controller.team;

import java.util.Comparator;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.africaapps.league.dto.UserPlayerSummary;
import com.africaapps.league.model.league.BlockType;

public class SubstituteComparator implements Comparator<UserPlayerSummary> {

	private static Logger logger = LoggerFactory.getLogger(SubstituteComparator.class);

	@Override
	public int compare(UserPlayerSummary o1, UserPlayerSummary o2) {
		logger.debug("Blocks: " + o1.getBlock() + " " + o2.getBlock());
		if (o1.getBlock().equals(o2.getBlock())) {
			String n1 = o1.getFirstName() + " " + o1.getLastName();
			String n2 = o2.getFirstName() + " " + o2.getFirstName();
			return n1.compareTo(n2);
		}		
		if (o1.getBlock().equalsIgnoreCase(BlockType.DEFENDER.name())) {
			return -1;
		} else if (o2.getBlock().equalsIgnoreCase(BlockType.DEFENDER.name())) {
			return 1;
		}
		if (o1.getBlock().equalsIgnoreCase(BlockType.MIDFIELDER.name())) {
			return -1;
		} else if (o2.getBlock().equalsIgnoreCase(BlockType.MIDFIELDER.name())) {
			return 1;
		}
		if (o1.getBlock().equalsIgnoreCase(BlockType.STRIKER.name())) {
			return -1;
		} else if (o2.getBlock().equalsIgnoreCase(BlockType.STRIKER.name())) {
			return 1;
		}
		if (o1.getBlock().equalsIgnoreCase(BlockType.GOALKEEPER.name())) {
			return -1;
		} else if (o2.getBlock().equalsIgnoreCase(BlockType.GOALKEEPER.name())) {
			return 1;
		}
		logger.debug("default");
		String n1 = o1.getFirstName() + " " + o1.getLastName();
		String n2 = o2.getFirstName() + " " + o2.getFirstName();
		return n1.compareTo(n2);
	}
}

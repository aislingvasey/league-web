package com.africaapps.league.web.server.controller.team;

import java.util.Comparator;

import com.africaapps.league.dto.UserPlayerSummary;

public class NameComparator implements Comparator<UserPlayerSummary> {
	@Override
	public int compare(UserPlayerSummary o1, UserPlayerSummary o2) {
		String n1 = o1.getFirstName() + " " + o1.getLastName();
		String n2 = o2.getFirstName() + " " + o2.getFirstName();
		return n1.compareTo(n2);
	}
}

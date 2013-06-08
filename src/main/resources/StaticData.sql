-- League Type
INSERT INTO league_type(id, description, name, league_type_status) 
    VALUES((select nextval('league_type_seq')), 'European Football', 'Football', 'ACTIVE');
-- League
INSERT INTO league(id, description, name, league_type_id) 
    VALUES((select nextval('league_seq')), 'South Africa''s ABSA Premier League', 'ABSA Premier League', (select id from league_type where name = 'Football'));
-- League Seasons
INSERT INTO league_season(id, end_date, name, start_date, status, league_id) 
    VALUES((select nextval('league_season_seq')), '2013-1-31 0:0:00.0', '', '2012-7-15 0:00:10.0', 'CURRENT', (select id from league where name = 'ABSA Premier League'));
INSERT INTO league_season(id, end_date, name, start_date, status, league_id) 
    VALUES((select nextval('league_season_seq')), '2014-7-31 0:0:00.0', '', '2013-7-15 0:00:10.0', 'FUTURE', (select id from league where name = 'ABSA Premier League'));

-----------------------------------------------------------------------------------------------------------------------------

-- User Details
INSERT INTO game_user_details(id, cell_number, email_address, first_name, last_name, password, username) 
    VALUES((select nextval('user_seq')), null, 'admin@league.co.za', 'Admin', 'Admin', 'fixme', 'admin');

-- User League

INSERT INTO game_user_league(id, default_league, description, name, status, type, owner_id, league_id) 
    VALUES((select nextval('user_league_seq')), true, 'General league for all teams', 'General League', 'INPROGRESS', 'PUBLIC', (select id from game_user_details where username='admin'), (select id from league where name = 'ABSA Premier League'));


-- Team Formats
-- 4-4-2 4 defenders, 4 midfielders and two forwards
INSERT INTO game_team_format(id, name, description, default_format, defender_count, midfielder_count, striker_count) 
    VALUES((select nextval('team_format_seq')), '4-4-2', 'Default soccer team format', true, 4, 4, 2);
INSERT INTO game_team_format(id, name, description, default_format, defender_count, midfielder_count, striker_count) 
    VALUES((select nextval('team_format_seq')), '3-4-3', 'Soccer team format', false, 3, 4, 3);  
INSERT INTO game_team_format(id, name, description, default_format, defender_count, midfielder_count, striker_count) 
    VALUES((select nextval('team_format_seq')), '4-3-3', 'Soccer team format', false, 4, 3, 3);
INSERT INTO game_team_format(id, name, description, default_format, defender_count, midfielder_count, striker_count) 
    VALUES((select nextval('team_format_seq')), '4-5-1', 'Soccer team format', false, 4, 5, 1);    
    

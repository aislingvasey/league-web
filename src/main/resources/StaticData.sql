-- League Type
INSERT INTO league_type(id, description, name, league_type_status) 
    VALUES((select nextval('league_type_seq')), 'Soccer', 'Soccer', 'ACTIVE');
-- League
INSERT INTO league(id, description, name, league_type_id) 
    VALUES((select nextval('league_seq')), 'South Africa''s ABSA Premier League', 'ABSA Premier Soccer League', (select id from league_type where name = 'Soccer'));
-- League Seasons
INSERT INTO league_season(id, end_date, name, start_date, status, league_id) 
    VALUES((select nextval('league_season_seq')), '2013-1-31 0:0:00.0', '', '2012-7-15 0:00:10.0', 'CURRENT', (select id from league where name = 'ABSA Premier Soccer League'));
INSERT INTO league_season(id, end_date, name, start_date, status, league_id) 
    VALUES((select nextval('league_season_seq')), '2014-7-31 0:0:00.0', '', '2013-7-15 0:00:10.0', 'FUTURE', (select id from league where name = 'ABSA Premier Soccer League'));
    
-----------------------------------------------------------------------------------------------------------------------------

-- Pool
INSERT INTO game_pool(id, league_season_id) 
    VALUES((select nextval('pool_seq')), (select id from league_season where status = 'CURRENT' and league_id = (select id from league where name = 'ABSA Premier Soccer League')));    
    
-- User Details
INSERT INTO game_user_details(id, cell_number, email_address, first_name, last_name, password, username) 
    VALUES((select nextval('user_seq')), null, 'admin@league.co.za', 'Admin', 'Admin', 'fixme', 'admin');

-- User League
INSERT INTO game_user_league(id, default_league, description, name, status, type, owner_id, league_id, pool_id) 
    VALUES((select nextval('user_league_seq')), true, 'General league for all teams', 'General League', 'INPROGRESS', 'PUBLIC', (select id from game_user_details where username='admin'), (select id from league where name = 'ABSA Premier Soccer League'), (select id from league_season where status = 'CURRENT' and league_id = (select id from league where name = 'ABSA Premier Soccer League')));

-- Events
INSERT INTO event(id, description, event_id, points, league_type_id, block_type)
  VALUES((select nextval('event_seq')), 'Goal', 5, 50, (select id from league_type where name = 'Soccer'), 'GOALKEEPER');
INSERT INTO event(id, description, event_id, points, league_type_id, block_type)
  VALUES((select nextval('event_seq')), 'Goal', 5, 40, (select id from league_type where name = 'Soccer'), 'DEFENDER');  
INSERT INTO event(id, description, event_id, points, league_type_id, block_type)
  VALUES((select nextval('event_seq')), 'Goal', 5, 25, (select id from league_type where name = 'Soccer'), 'MIDFIELDER');  
INSERT INTO event(id, description, event_id, points, league_type_id, block_type)
  VALUES((select nextval('event_seq')), 'Goal', 5, 25, (select id from league_type where name = 'Soccer'), 'STRIKER');   
INSERT INTO event(id, description, event_id, points, league_type_id, block_type)
  VALUES((select nextval('event_seq')), 'Goal', 5, 25, (select id from league_type where name = 'Soccer'), 'SUBSTITUTE');   
INSERT INTO event(id, description, event_id, points, league_type_id)
  VALUES((select nextval('event_seq')), 'Goal', 5, 25, (select id from league_type where name = 'Soccer'));   
  
INSERT INTO event(id, description, event_id, points, league_type_id)
  VALUES((select nextval('event_seq')), 'Goal on penalty', 6, 25, (select id from league_type where name = 'Soccer'));
INSERT INTO event(id, description, event_id, points, league_type_id)
  VALUES((select nextval('event_seq')), 'Own goal', 7, -25, (select id from league_type where name = 'Soccer'));
INSERT INTO event(id, description, event_id, points, league_type_id)
  VALUES((select nextval('event_seq')), 'Penalty', 8, -20, (select id from league_type where name = 'Soccer'));
INSERT INTO event(id, description, event_id, points, league_type_id)
  VALUES((select nextval('event_seq')), 'Chance', 9, 5, (select id from league_type where name = 'Soccer'));
INSERT INTO event(id, description, event_id, points, league_type_id)
  VALUES((select nextval('event_seq')), 'Shot not on target', 10, 0, (select id from league_type where name = 'Soccer'));
INSERT INTO event(id, description, event_id, points, league_type_id)
  VALUES((select nextval('event_seq')), 'Shot on target', 11, 5, (select id from league_type where name = 'Soccer'));
INSERT INTO event(id, description, event_id, points, league_type_id)
  VALUES((select nextval('event_seq')), 'Offside', 12, -5, (select id from league_type where name = 'Soccer'));
INSERT INTO event(id, description, event_id, points, league_type_id)
  VALUES((select nextval('event_seq')), 'Corner', 13, 0, (select id from league_type where name = 'Soccer'));
INSERT INTO event(id, description, event_id, points, league_type_id)
  VALUES((select nextval('event_seq')), 'Cross', 14, 0, (select id from league_type where name = 'Soccer'));
INSERT INTO event(id, description, event_id, points, league_type_id)
  VALUES((select nextval('event_seq')), 'Successful cross', 10, 5, (select id from league_type where name = 'Soccer'));
INSERT INTO event(id, description, event_id, points, league_type_id)
  VALUES((select nextval('event_seq')), 'Foul made', 16, -2, (select id from league_type where name = 'Soccer'));
INSERT INTO event(id, description, event_id, points, league_type_id)
  VALUES((select nextval('event_seq')), 'Yellow card', 17, -15, (select id from league_type where name = 'Soccer'));
INSERT INTO event(id, description, event_id, points, league_type_id)
  VALUES((select nextval('event_seq')), 'Red card', 18, -25, (select id from league_type where name = 'Soccer'));
INSERT INTO event(id, description, event_id, points, league_type_id)
  VALUES((select nextval('event_seq')), 'Catch', 19, 0, (select id from league_type where name = 'Soccer'));
INSERT INTO event(id, description, event_id, points, league_type_id)
  VALUES((select nextval('event_seq')), 'Punch', 20, 0, (select id from league_type where name = 'Soccer'));
INSERT INTO event(id, description, event_id, points, league_type_id)
  VALUES((select nextval('event_seq')), 'Player in', 21, 5, (select id from league_type where name = 'Soccer'));
INSERT INTO event(id, description, event_id, points, league_type_id)
  VALUES((select nextval('event_seq')), 'Player out', 22, 0, (select id from league_type where name = 'Soccer'));    
    
-- Team Formats
-- 4-4-2 = 4 defenders, 4 midfielders and two forwards
INSERT INTO game_team_format(id, name, description, default_format, defender_count, midfielder_count, striker_count) 
    VALUES((select nextval('team_format_seq')), '4-4-2', 'Default soccer team format', true, 4, 4, 2);
INSERT INTO game_team_format(id, name, description, default_format, defender_count, midfielder_count, striker_count) 
    VALUES((select nextval('team_format_seq')), '3-4-3', 'Soccer team format', false, 3, 4, 3);  
INSERT INTO game_team_format(id, name, description, default_format, defender_count, midfielder_count, striker_count) 
    VALUES((select nextval('team_format_seq')), '4-3-3', 'Soccer team format', false, 4, 3, 3);
INSERT INTO game_team_format(id, name, description, default_format, defender_count, midfielder_count, striker_count) 
    VALUES((select nextval('team_format_seq')), '4-5-1', 'Soccer team format', false, 4, 5, 1);    
INSERT INTO game_team_format(id, name, description, default_format, defender_count, midfielder_count, striker_count) 
    VALUES((select nextval('team_format_seq')), '3-5-2', 'Soccer team format', false, 3, 5, 2);    

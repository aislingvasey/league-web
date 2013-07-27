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
    
-- Team Formats
INSERT INTO game_team_format(id, name, description, default_format, defender_count, midfielder_count, striker_count, league_type_id) 
    VALUES((select nextval('team_format_seq')), '4-4-2', 'Default soccer team format', true, 4, 4, 2, (select id from league_type where name = 'Soccer'));
INSERT INTO game_team_format(id, name, description, default_format, defender_count, midfielder_count, striker_count, league_type_id) 
    VALUES((select nextval('team_format_seq')), '3-4-3', 'Soccer team format', false, 3, 4, 3, (select id from league_type where name = 'Soccer'));  
INSERT INTO game_team_format(id, name, description, default_format, defender_count, midfielder_count, striker_count, league_type_id) 
    VALUES((select nextval('team_format_seq')), '4-3-3', 'Soccer team format', false, 4, 3, 3, (select id from league_type where name = 'Soccer'));
INSERT INTO game_team_format(id, name, description, default_format, defender_count, midfielder_count, striker_count, league_type_id) 
    VALUES((select nextval('team_format_seq')), '4-5-1', 'Soccer team format', false, 4, 5, 1, (select id from league_type where name = 'Soccer'));    
INSERT INTO game_team_format(id, name, description, default_format, defender_count, midfielder_count, striker_count, league_type_id) 
    VALUES((select nextval('team_format_seq')), '3-5-2', 'Soccer team format', false, 3, 5, 2, (select id from league_type where name = 'Soccer'));    
    
-- League Data
INSERT INTO league_data(id, init_team_money, last_feed_datetime, no_trade_hours, goalkeepers_count, substitutes_count, squad_size, user_points_playingweek, team_format_id, league_id) 
    VALUES((select nextval('league_data_seq')), 5000000, null, 1, 1, 4, 15, 50, (select id from game_team_format where name='4-4-2' and league_type_id = (select id from league_type where name = 'Soccer')) , (select id from league where name = 'ABSA Premier Soccer League'));
    
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
  VALUES((select nextval('event_seq')), 'Penalty', 8, 20, (select id from league_type where name = 'Soccer'));
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
  VALUES((select nextval('event_seq')), 'Successful cross', 15, 5, (select id from league_type where name = 'Soccer'));
INSERT INTO event(id, description, event_id, points, league_type_id)
  VALUES((select nextval('event_seq')), 'Foul made', 16, -2, (select id from league_type where name = 'Soccer'));
INSERT INTO event(id, description, event_id, points, league_type_id)
  VALUES((select nextval('event_seq')), 'Yellow card', 17, -15, (select id from league_type where name = 'Soccer'));
INSERT INTO event(id, description, event_id, points, league_type_id)
  VALUES((select nextval('event_seq')), 'Red card', 18, -25, (select id from league_type where name = 'Soccer'));
INSERT INTO event(id, description, event_id, points, league_type_id)
  VALUES((select nextval('event_seq')), 'Catch', 19, 2, (select id from league_type where name = 'Soccer'));
INSERT INTO event(id, description, event_id, points, league_type_id)
  VALUES((select nextval('event_seq')), 'Punch', 20, 2, (select id from league_type where name = 'Soccer'));
INSERT INTO event(id, description, event_id, points, league_type_id)
  VALUES((select nextval('event_seq')), 'Player in', 21, 5, (select id from league_type where name = 'Soccer'));
INSERT INTO event(id, description, event_id, points, league_type_id)
  VALUES((select nextval('event_seq')), 'Player out', 22, 0, (select id from league_type where name = 'Soccer'));    
-- Custom events
INSERT INTO event(id, description, event_id, points, league_type_id)
  VALUES((select nextval('event_seq')), 'Match Squad', -1, 10, (select id from league_type where name = 'Soccer'));    
INSERT INTO event(id, description, event_id, points, league_type_id, block_type)
  VALUES((select nextval('event_seq')), 'Goal Conceeded', -2, -10, (select id from league_type where name = 'Soccer'), 'GOALKEEPER');
INSERT INTO event(id, description, event_id, points, league_type_id, block_type)
  VALUES((select nextval('event_seq')), 'Goal Conceeded', -2, -5, (select id from league_type where name = 'Soccer'), 'DEFENDER');  
INSERT INTO event(id, description, event_id, points, league_type_id)
  VALUES((select nextval('event_seq')), 'Team Clean Sheet', -3, 5, (select id from league_type where name = 'Soccer')); 
      
-- Fixtures
INSERT INTO fixture(id, description, start_datetime, end_datetime, league_season_id) 
    VALUES((select nextval('fixture_seq')), null, '2012-08-10 15:00:00.0', '2012-08-10 17:00:00.0', (select id from league_season where status = 'CURRENT' and league_id = (select id from league where name = 'ABSA Premier Soccer League')));  
  
-- Playing Weeks
-- Saturday to Friday
INSERT INTO game_playing_week(id, start_date_time, end_date_time, league_season_id, playing_week_order)
 VALUES ((select nextval('pool_seq')), '2012-08-04 00:00:00.0', '2012-08-10 23:59:59.999', (select id from league_season where status = 'CURRENT' and league_id = (select id from league where name = 'ABSA Premier Soccer League')), 1);
INSERT INTO game_playing_week(id, start_date_time, end_date_time, league_season_id, playing_week_order)
 VALUES ((select nextval('pool_seq')), '2012-08-11 00:00:00.0', '2012-08-17 23:59:59.999', (select id from league_season where status = 'CURRENT' and league_id = (select id from league where name = 'ABSA Premier Soccer League')), 2);
INSERT INTO game_playing_week(id, start_date_time, end_date_time, league_season_id, playing_week_order)
 VALUES ((select nextval('pool_seq')), '2012-08-18 00:00:00.0', '2012-08-24 23:59:59.999', (select id from league_season where status = 'CURRENT' and league_id = (select id from league where name = 'ABSA Premier Soccer League')), 3);
INSERT INTO game_playing_week(id, start_date_time, end_date_time, league_season_id, playing_week_order)
 VALUES ((select nextval('pool_seq')), '2012-08-25 00:00:00.0', '2012-08-31 23:59:59.999', (select id from league_season where status = 'CURRENT' and league_id = (select id from league where name = 'ABSA Premier Soccer League')), 4);
INSERT INTO game_playing_week(id, start_date_time, end_date_time, league_season_id, playing_week_order)
 VALUES ((select nextval('pool_seq')), '2012-09-01 00:00:00.0', '2012-09-07 23:59:59.999', (select id from league_season where status = 'CURRENT' and league_id = (select id from league where name = 'ABSA Premier Soccer League')), 5);
INSERT INTO game_playing_week(id, start_date_time, end_date_time, league_season_id, playing_week_order)
 VALUES ((select nextval('pool_seq')), '2012-09-08 00:00:00.0', '2012-09-14 23:59:59.999', (select id from league_season where status = 'CURRENT' and league_id = (select id from league where name = 'ABSA Premier Soccer League')), 6);
INSERT INTO game_playing_week(id, start_date_time, end_date_time, league_season_id, playing_week_order)
 VALUES ((select nextval('pool_seq')), '2012-09-15 00:00:00.0', '2012-09-21 23:59:59.999', (select id from league_season where status = 'CURRENT' and league_id = (select id from league where name = 'ABSA Premier Soccer League')), 7);
INSERT INTO game_playing_week(id, start_date_time, end_date_time, league_season_id, playing_week_order)
 VALUES ((select nextval('pool_seq')), '2012-09-22 00:00:00.0', '2012-09-28 23:59:59.999', (select id from league_season where status = 'CURRENT' and league_id = (select id from league where name = 'ABSA Premier Soccer League')), 8);
INSERT INTO game_playing_week(id, start_date_time, end_date_time, league_season_id, playing_week_order)
 VALUES ((select nextval('pool_seq')), '2012-09-29 00:00:00.0', '2012-10-05 23:59:59.999', (select id from league_season where status = 'CURRENT' and league_id = (select id from league where name = 'ABSA Premier Soccer League')), 9);
INSERT INTO game_playing_week(id, start_date_time, end_date_time, league_season_id, playing_week_order)
 VALUES ((select nextval('pool_seq')), '2012-10-06 00:00:00.0', '2012-10-12 23:59:59.999', (select id from league_season where status = 'CURRENT' and league_id = (select id from league where name = 'ABSA Premier Soccer League')), 10);
INSERT INTO game_playing_week(id, start_date_time, end_date_time, league_season_id, playing_week_order)
 VALUES ((select nextval('pool_seq')), '2012-10-13 00:00:00.0', '2012-10-19 23:59:59.999', (select id from league_season where status = 'CURRENT' and league_id = (select id from league where name = 'ABSA Premier Soccer League')), 11);
INSERT INTO game_playing_week(id, start_date_time, end_date_time, league_season_id, playing_week_order)
 VALUES ((select nextval('pool_seq')), '2012-10-20 00:00:00.0', '2012-10-26 23:59:59.999', (select id from league_season where status = 'CURRENT' and league_id = (select id from league where name = 'ABSA Premier Soccer League')), 12);
INSERT INTO game_playing_week(id, start_date_time, end_date_time, league_season_id, playing_week_order)
 VALUES ((select nextval('pool_seq')), '2012-10-27 00:00:00.0', '2012-11-02 23:59:59.999', (select id from league_season where status = 'CURRENT' and league_id = (select id from league where name = 'ABSA Premier Soccer League')), 13);
INSERT INTO game_playing_week(id, start_date_time, end_date_time, league_season_id, playing_week_order)
 VALUES ((select nextval('pool_seq')), '2012-11-03 00:00:00.0', '2012-11-09 23:59:59.999', (select id from league_season where status = 'CURRENT' and league_id = (select id from league where name = 'ABSA Premier Soccer League')), 14);
INSERT INTO game_playing_week(id, start_date_time, end_date_time, league_season_id, playing_week_order)
 VALUES ((select nextval('pool_seq')), '2012-11-10 00:00:00.0', '2012-11-16 23:59:59.999', (select id from league_season where status = 'CURRENT' and league_id = (select id from league where name = 'ABSA Premier Soccer League')), 15);
INSERT INTO game_playing_week(id, start_date_time, end_date_time, league_season_id, playing_week_order)
 VALUES ((select nextval('pool_seq')), '2012-11-17 00:00:00.0', '2012-11-23 23:59:59.999', (select id from league_season where status = 'CURRENT' and league_id = (select id from league where name = 'ABSA Premier Soccer League')), 16);
INSERT INTO game_playing_week(id, start_date_time, end_date_time, league_season_id, playing_week_order)
 VALUES ((select nextval('pool_seq')), '2012-11-24 00:00:00.0', '2012-11-30 23:59:59.999', (select id from league_season where status = 'CURRENT' and league_id = (select id from league where name = 'ABSA Premier Soccer League')), 17);
INSERT INTO game_playing_week(id, start_date_time, end_date_time, league_season_id, playing_week_order)
 VALUES ((select nextval('pool_seq')), '2012-12-01 00:00:00.0', '2012-12-07 23:59:59.999', (select id from league_season where status = 'CURRENT' and league_id = (select id from league where name = 'ABSA Premier Soccer League')), 18);
INSERT INTO game_playing_week(id, start_date_time, end_date_time, league_season_id, playing_week_order)
 VALUES ((select nextval('pool_seq')), '2012-12-08 00:00:00.0', '2012-12-14 23:59:59.999', (select id from league_season where status = 'CURRENT' and league_id = (select id from league where name = 'ABSA Premier Soccer League')), 19);
INSERT INTO game_playing_week(id, start_date_time, end_date_time, league_season_id, playing_week_order)
 VALUES ((select nextval('pool_seq')), '2012-12-15 00:00:00.0', '2012-12-21 23:59:59.999', (select id from league_season where status = 'CURRENT' and league_id = (select id from league where name = 'ABSA Premier Soccer League')), 20);
INSERT INTO game_playing_week(id, start_date_time, end_date_time, league_season_id, playing_week_order)
 VALUES ((select nextval('pool_seq')), '2012-12-22 00:00:00.0', '2012-12-28 23:59:59.999', (select id from league_season where status = 'CURRENT' and league_id = (select id from league where name = 'ABSA Premier Soccer League')), 21);
INSERT INTO game_playing_week(id, start_date_time, end_date_time, league_season_id, playing_week_order)
 VALUES ((select nextval('pool_seq')), '2012-12-29 00:00:00.0', '2013-01-04 23:59:59.999', (select id from league_season where status = 'CURRENT' and league_id = (select id from league where name = 'ABSA Premier Soccer League')), 22);
INSERT INTO game_playing_week(id, start_date_time, end_date_time, league_season_id, playing_week_order)
 VALUES ((select nextval('pool_seq')), '2013-01-05 00:00:00.0', '2013-01-11 23:59:59.999', (select id from league_season where status = 'CURRENT' and league_id = (select id from league where name = 'ABSA Premier Soccer League')), 23);
INSERT INTO game_playing_week(id, start_date_time, end_date_time, league_season_id, playing_week_order)
 VALUES ((select nextval('pool_seq')), '2013-01-12 00:00:00.0', '2013-01-18 23:59:59.999', (select id from league_season where status = 'CURRENT' and league_id = (select id from league where name = 'ABSA Premier Soccer League')), 24);
INSERT INTO game_playing_week(id, start_date_time, end_date_time, league_season_id, playing_week_order)
 VALUES ((select nextval('pool_seq')), '2013-01-19 00:00:00.0', '2013-01-25 23:59:59.999', (select id from league_season where status = 'CURRENT' and league_id = (select id from league where name = 'ABSA Premier Soccer League')), 25);
INSERT INTO game_playing_week(id, start_date_time, end_date_time, league_season_id, playing_week_order)
 VALUES ((select nextval('pool_seq')), '2013-01-26 00:00:00.0', '2013-02-01 23:59:59.999', (select id from league_season where status = 'CURRENT' and league_id = (select id from league where name = 'ABSA Premier Soccer League')), 26);
INSERT INTO game_playing_week(id, start_date_time, end_date_time, league_season_id, playing_week_order)
 VALUES ((select nextval('pool_seq')), '2013-02-02 00:00:00.0', '2013-02-08 23:59:59.999', (select id from league_season where status = 'CURRENT' and league_id = (select id from league where name = 'ABSA Premier Soccer League')), 27);
INSERT INTO game_playing_week(id, start_date_time, end_date_time, league_season_id, playing_week_order)
 VALUES ((select nextval('pool_seq')), '2013-02-09 00:00:00.0', '2013-02-15 23:59:59.999', (select id from league_season where status = 'CURRENT' and league_id = (select id from league where name = 'ABSA Premier Soccer League')), 28);
INSERT INTO game_playing_week(id, start_date_time, end_date_time, league_season_id, playing_week_order)
 VALUES ((select nextval('pool_seq')), '2013-02-16 00:00:00.0', '2013-02-22 23:59:59.999', (select id from league_season where status = 'CURRENT' and league_id = (select id from league where name = 'ABSA Premier Soccer League')), 29);
INSERT INTO game_playing_week(id, start_date_time, end_date_time, league_season_id, playing_week_order)
 VALUES ((select nextval('pool_seq')), '2013-02-23 00:00:00.0', '2013-03-01 23:59:59.999', (select id from league_season where status = 'CURRENT' and league_id = (select id from league where name = 'ABSA Premier Soccer League')), 30);
INSERT INTO game_playing_week(id, start_date_time, end_date_time, league_season_id, playing_week_order)
 VALUES ((select nextval('pool_seq')), '2013-03-02 00:00:00.0', '2013-03-08 23:59:59.999', (select id from league_season where status = 'CURRENT' and league_id = (select id from league where name = 'ABSA Premier Soccer League')), 31);
INSERT INTO game_playing_week(id, start_date_time, end_date_time, league_season_id, playing_week_order)
 VALUES ((select nextval('pool_seq')), '2013-03-09 00:00:00.0', '2013-03-15 23:59:59.999', (select id from league_season where status = 'CURRENT' and league_id = (select id from league where name = 'ABSA Premier Soccer League')), 32);
INSERT INTO game_playing_week(id, start_date_time, end_date_time, league_season_id, playing_week_order)
 VALUES ((select nextval('pool_seq')), '2013-03-16 00:00:00.0', '2013-03-22 23:59:59.999', (select id from league_season where status = 'CURRENT' and league_id = (select id from league where name = 'ABSA Premier Soccer League')), 33);
INSERT INTO game_playing_week(id, start_date_time, end_date_time, league_season_id, playing_week_order)
 VALUES ((select nextval('pool_seq')), '2013-03-23 00:00:00.0', '2013-03-29 23:59:59.999', (select id from league_season where status = 'CURRENT' and league_id = (select id from league where name = 'ABSA Premier Soccer League')), 34);
INSERT INTO game_playing_week(id, start_date_time, end_date_time, league_season_id, playing_week_order)
 VALUES ((select nextval('pool_seq')), '2013-03-30 00:00:00.0', '2013-04-05 23:59:59.999', (select id from league_season where status = 'CURRENT' and league_id = (select id from league where name = 'ABSA Premier Soccer League')), 35);
INSERT INTO game_playing_week(id, start_date_time, end_date_time, league_season_id, playing_week_order)
 VALUES ((select nextval('pool_seq')), '2013-04-06 00:00:00.0', '2013-04-12 23:59:59.999', (select id from league_season where status = 'CURRENT' and league_id = (select id from league where name = 'ABSA Premier Soccer League')), 36);
INSERT INTO game_playing_week(id, start_date_time, end_date_time, league_season_id, playing_week_order)
 VALUES ((select nextval('pool_seq')), '2013-04-13 00:00:00.0', '2013-04-19 23:59:59.999', (select id from league_season where status = 'CURRENT' and league_id = (select id from league where name = 'ABSA Premier Soccer League')), 37);
INSERT INTO game_playing_week(id, start_date_time, end_date_time, league_season_id, playing_week_order)
 VALUES ((select nextval('pool_seq')), '2013-04-20 00:00:00.0', '2013-04-26 23:59:59.999', (select id from league_season where status = 'CURRENT' and league_id = (select id from league where name = 'ABSA Premier Soccer League')), 38);
INSERT INTO game_playing_week(id, start_date_time, end_date_time, league_season_id, playing_week_order)
 VALUES ((select nextval('pool_seq')), '2013-04-27 00:00:00.0', '2013-05-03 23:59:59.999', (select id from league_season where status = 'CURRENT' and league_id = (select id from league where name = 'ABSA Premier Soccer League')), 39);
INSERT INTO game_playing_week(id, start_date_time, end_date_time, league_season_id, playing_week_order)
 VALUES ((select nextval('pool_seq')), '2013-05-04 00:00:00.0', '2013-05-10 23:59:59.999', (select id from league_season where status = 'CURRENT' and league_id = (select id from league where name = 'ABSA Premier Soccer League')), 40);
INSERT INTO game_playing_week(id, start_date_time, end_date_time, league_season_id, playing_week_order)
 VALUES ((select nextval('pool_seq')), '2013-05-11 00:00:00.0', '2013-05-17 23:59:59.999', (select id from league_season where status = 'CURRENT' and league_id = (select id from league where name = 'ABSA Premier Soccer League')), 41);
INSERT INTO game_playing_week(id, start_date_time, end_date_time, league_season_id, playing_week_order)
 VALUES ((select nextval('pool_seq')), '2013-05-18 00:00:00.0', '2013-05-24 23:59:59.999', (select id from league_season where status = 'CURRENT' and league_id = (select id from league where name = 'ABSA Premier Soccer League')), 42);
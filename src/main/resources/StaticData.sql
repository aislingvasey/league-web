-- League Type
INSERT INTO league_type(id, description, name, league_type_status) 
    VALUES((select nextval('league_type_seq')), 'Soccer', 'Soccer', 'ACTIVE');
-- League
INSERT INTO league(id, description, name, league_type_id) 
    VALUES((select nextval('league_seq')), 'South Africa''s ABSA Premier League', 'ABSA Premier Soccer League', (select id from league_type where name = 'Soccer'));
-- League Seasons
INSERT INTO league_season(id, end_date, name, start_date, status, league_id) 
    VALUES((select nextval('league_season_seq')), '2013-1-31 0:0:00.0', '', '2012-7-15 0:00:10.0', 'COMPLETE', (select id from league where name = 'ABSA Premier Soccer League'));
INSERT INTO league_season(id, end_date, name, start_date, status, league_id) 
    VALUES((select nextval('league_season_seq')), '2014-7-31 0:0:00.0', '', '2013-8-01 0:00:10.0', 'CURRENT', (select id from league where name = 'ABSA Premier Soccer League'));
    
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
    VALUES((select nextval('league_data_seq')), 10000000, null, 1, 1, 4, 15, 100, (select id from game_team_format where name='4-4-2' and league_type_id = (select id from league_type where name = 'Soccer')) , (select id from league where name = 'ABSA Premier Soccer League'));
    
-- Pool
INSERT INTO game_pool(id, league_season_id) 
    VALUES((select nextval('pool_seq')), (select id from league_season where status = 'CURRENT' and league_id = (select id from league where name = 'ABSA Premier Soccer League')));    
    
-- User Details
INSERT INTO game_user_details(id, cell_number, email_address, first_name, last_name, password, username) 
    VALUES((select nextval('user_seq')), null, 'admin@league.co.za', 'Admin', 'Admin', 'fixme', 'admin');

-- User League
INSERT INTO game_user_league(id, default_league, description, name, status, type, owner_id, league_id, pool_id) 
    VALUES(
(select nextval('user_league_seq')), true, 'General league for all teams', 'General League', 'INPROGRESS', 'PUBLIC', 
(select id from game_user_details where username='admin'), 
(select id from league where name = 'ABSA Premier Soccer League'), 
(select id from game_pool where league_season_id = (select id from league_season where status = 'CURRENT' and league_id = (select id from league where name = 'ABSA Premier Soccer League'))));

-- Statistics
INSERT INTO statistic(id, name, block_type, external_id, points, league_type_id) 
    VALUES((select nextval('stat_seq')), 'Balls Played', 'GOALKEEPER', 19, 0.5, (select id from league_type where name = 'Soccer'));
INSERT INTO statistic(id, name, block_type, external_id, points, league_type_id) 
    VALUES((select nextval('stat_seq')), 'Balls Played', 'DEFENDER', 19, 0.5, (select id from league_type where name = 'Soccer'));
INSERT INTO statistic(id, name, block_type, external_id, points, league_type_id) 
    VALUES((select nextval('stat_seq')), 'Balls Played', 'MIDFIELDER', 19, 0.5, (select id from league_type where name = 'Soccer'));
INSERT INTO statistic(id, name, block_type, external_id, points, league_type_id) 
    VALUES((select nextval('stat_seq')), 'Balls Played', 'STRIKER', 19, 0.5, (select id from league_type where name = 'Soccer'));  
  
INSERT INTO statistic(id, name, block_type, external_id, points, league_type_id) 
    VALUES((select nextval('stat_seq')), 'Balls Earned', 'GOALKEEPER', 34, 1, (select id from league_type where name = 'Soccer'));
INSERT INTO statistic(id, name, block_type, external_id, points, league_type_id) 
    VALUES((select nextval('stat_seq')), 'Balls Earned', 'DEFENDER', 34, 3, (select id from league_type where name = 'Soccer'));
INSERT INTO statistic(id, name, block_type, external_id, points, league_type_id) 
    VALUES((select nextval('stat_seq')), 'Balls Earned', 'MIDFIELDER', 34, 1, (select id from league_type where name = 'Soccer'));
INSERT INTO statistic(id, name, block_type, external_id, points, league_type_id) 
    VALUES((select nextval('stat_seq')), 'Balls Earned', 'STRIKER', 34, 2, (select id from league_type where name = 'Soccer'));  

INSERT INTO statistic(id, name, block_type, external_id, points, league_type_id) 
    VALUES((select nextval('stat_seq')), 'Balls Lost', 'GOALKEEPER', 35, -1.5, (select id from league_type where name = 'Soccer'));
INSERT INTO statistic(id, name, block_type, external_id, points, league_type_id) 
    VALUES((select nextval('stat_seq')), 'Balls Lost', 'DEFENDER', 35, -2, (select id from league_type where name = 'Soccer'));
INSERT INTO statistic(id, name, block_type, external_id, points, league_type_id) 
    VALUES((select nextval('stat_seq')), 'Balls Lost', 'MIDFIELDER', 35, -3, (select id from league_type where name = 'Soccer'));
INSERT INTO statistic(id, name, block_type, external_id, points, league_type_id) 
    VALUES((select nextval('stat_seq')), 'Balls Lost', 'STRIKER', 35, -1, (select id from league_type where name = 'Soccer'));      
    
INSERT INTO statistic(id, name, block_type, external_id, points, league_type_id) 
    VALUES((select nextval('stat_seq')), 'Passes', 'GOALKEEPER', 42, 4, (select id from league_type where name = 'Soccer'));
INSERT INTO statistic(id, name, block_type, external_id, points, league_type_id) 
    VALUES((select nextval('stat_seq')), 'Passes', 'DEFENDER', 42, 1, (select id from league_type where name = 'Soccer'));
INSERT INTO statistic(id, name, block_type, external_id, points, league_type_id) 
    VALUES((select nextval('stat_seq')), 'Passes', 'MIDFIELDER', 42, 0.5, (select id from league_type where name = 'Soccer'));
INSERT INTO statistic(id, name, block_type, external_id, points, league_type_id) 
    VALUES((select nextval('stat_seq')), 'Passes', 'STRIKER', 42, 1.5, (select id from league_type where name = 'Soccer'));      
    
INSERT INTO statistic(id, name, block_type, external_id, points, league_type_id) 
    VALUES((select nextval('stat_seq')), 'Assists', 'GOALKEEPER', 179, 70, (select id from league_type where name = 'Soccer'));
INSERT INTO statistic(id, name, block_type, external_id, points, league_type_id) 
    VALUES((select nextval('stat_seq')), 'Assists', 'DEFENDER', 179, 40, (select id from league_type where name = 'Soccer'));
INSERT INTO statistic(id, name, block_type, external_id, points, league_type_id) 
    VALUES((select nextval('stat_seq')), 'Assists', 'MIDFIELDER', 179, 40, (select id from league_type where name = 'Soccer'));
INSERT INTO statistic(id, name, block_type, external_id, points, league_type_id) 
    VALUES((select nextval('stat_seq')), 'Assists', 'STRIKER', 179, 50, (select id from league_type where name = 'Soccer'));      
    
INSERT INTO statistic(id, name, block_type, external_id, points, league_type_id) 
    VALUES((select nextval('stat_seq')), 'Tackles', 'GOALKEEPER',26, 10, (select id from league_type where name = 'Soccer'));
INSERT INTO statistic(id, name, block_type, external_id, points, league_type_id) 
    VALUES((select nextval('stat_seq')), 'Tackles', 'DEFENDER', 26, 20, (select id from league_type where name = 'Soccer'));
INSERT INTO statistic(id, name, block_type, external_id, points, league_type_id) 
    VALUES((select nextval('stat_seq')), 'Tackles', 'MIDFIELDER', 26, 10, (select id from league_type where name = 'Soccer'));
INSERT INTO statistic(id, name, block_type, external_id, points, league_type_id) 
    VALUES((select nextval('stat_seq')), 'Tackles', 'STRIKER', 26, 5, (select id from league_type where name = 'Soccer'));
    
INSERT INTO statistic(id, name, block_type, external_id, points, league_type_id) 
    VALUES((select nextval('stat_seq')), 'Fouls conceded', 'GOALKEEPER', 39, -4, (select id from league_type where name = 'Soccer'));
INSERT INTO statistic(id, name, block_type, external_id, points, league_type_id) 
    VALUES((select nextval('stat_seq')), 'Fouls conceded', 'DEFENDER', 39, -3.5, (select id from league_type where name = 'Soccer'));
INSERT INTO statistic(id, name, block_type, external_id, points, league_type_id) 
    VALUES((select nextval('stat_seq')), 'Fouls conceded', 'MIDFIELDER', 39, -4, (select id from league_type where name = 'Soccer'));
INSERT INTO statistic(id, name, block_type, external_id, points, league_type_id) 
    VALUES((select nextval('stat_seq')), 'Fouls conceded', 'STRIKER', 39, -3, (select id from league_type where name = 'Soccer'));
    
INSERT INTO statistic(id, name, block_type, external_id, points, league_type_id) 
    VALUES((select nextval('stat_seq')), 'Fouls received', 'GOALKEEPER', 40, 5, (select id from league_type where name = 'Soccer'));
INSERT INTO statistic(id, name, block_type, external_id, points, league_type_id) 
    VALUES((select nextval('stat_seq')), 'Fouls received', 'DEFENDER', 40, 1.5, (select id from league_type where name = 'Soccer'));
INSERT INTO statistic(id, name, block_type, external_id, points, league_type_id) 
    VALUES((select nextval('stat_seq')), 'Fouls received', 'MIDFIELDER', 40, 1.5, (select id from league_type where name = 'Soccer'));
INSERT INTO statistic(id, name, block_type, external_id, points, league_type_id) 
    VALUES((select nextval('stat_seq')), 'Fouls received', 'STRIKER', 40, 3, (select id from league_type where name = 'Soccer'));
    
 
INSERT INTO statistic(id, name, block_type, external_id, points, league_type_id) 
    VALUES((select nextval('stat_seq')), 'Offside', 'GOALKEEPER', 41, -2, (select id from league_type where name = 'Soccer'));
INSERT INTO statistic(id, name, block_type, external_id, points, league_type_id) 
    VALUES((select nextval('stat_seq')), 'Offside', 'DEFENDER', 41, -10, (select id from league_type where name = 'Soccer'));
INSERT INTO statistic(id, name, block_type, external_id, points, league_type_id) 
    VALUES((select nextval('stat_seq')), 'Offside', 'MIDFIELDER', 41, -10, (select id from league_type where name = 'Soccer'));
INSERT INTO statistic(id, name, block_type, external_id, points, league_type_id) 
    VALUES((select nextval('stat_seq')), 'Offside', 'STRIKER', 41, -10, (select id from league_type where name = 'Soccer'));
    
INSERT INTO statistic(id, name, block_type, external_id, points, league_type_id) 
    VALUES((select nextval('stat_seq')), 'Yellow Card', 'GOALKEEPER', 12, -30, (select id from league_type where name = 'Soccer'));
INSERT INTO statistic(id, name, block_type, external_id, points, league_type_id) 
    VALUES((select nextval('stat_seq')), 'Yellow Card', 'DEFENDER', 12, -30, (select id from league_type where name = 'Soccer'));
INSERT INTO statistic(id, name, block_type, external_id, points, league_type_id) 
    VALUES((select nextval('stat_seq')), 'Yellow Card', 'MIDFIELDER', 12, -30, (select id from league_type where name = 'Soccer'));
INSERT INTO statistic(id, name, block_type, external_id, points, league_type_id) 
    VALUES((select nextval('stat_seq')), 'Yellow Card', 'STRIKER', 12, -30, (select id from league_type where name = 'Soccer'));
    
INSERT INTO statistic(id, name, block_type, external_id, points, league_type_id) 
    VALUES((select nextval('stat_seq')), 'Red Card', 'GOALKEEPER', 13, -60, (select id from league_type where name = 'Soccer'));
INSERT INTO statistic(id, name, block_type, external_id, points, league_type_id) 
    VALUES((select nextval('stat_seq')), 'Red Card', 'DEFENDER', 13, -50, (select id from league_type where name = 'Soccer'));
INSERT INTO statistic(id, name, block_type, external_id, points, league_type_id) 
    VALUES((select nextval('stat_seq')), 'Red Card', 'MIDFIELDER', 13, -50, (select id from league_type where name = 'Soccer'));
INSERT INTO statistic(id, name, block_type, external_id, points, league_type_id) 
    VALUES((select nextval('stat_seq')), 'Red Card', 'STRIKER', 13, -50, (select id from league_type where name = 'Soccer'));
    
INSERT INTO statistic(id, name, block_type, external_id, points, league_type_id) 
    VALUES((select nextval('stat_seq')), 'Centers', 'GOALKEEPER', 149, 10, (select id from league_type where name = 'Soccer'));
INSERT INTO statistic(id, name, block_type, external_id, points, league_type_id) 
    VALUES((select nextval('stat_seq')), 'Centers', 'DEFENDER', 149, 5, (select id from league_type where name = 'Soccer'));
INSERT INTO statistic(id, name, block_type, external_id, points, league_type_id) 
    VALUES((select nextval('stat_seq')), 'Centers', 'MIDFIELDER', 149, 10, (select id from league_type where name = 'Soccer'));
INSERT INTO statistic(id, name, block_type, external_id, points, league_type_id) 
    VALUES((select nextval('stat_seq')), 'Centers', 'STRIKER', 149, 10, (select id from league_type where name = 'Soccer'));

    
INSERT INTO statistic(id, name, block_type, external_id, points, league_type_id) 
    VALUES((select nextval('stat_seq')), 'Corners', 'GOALKEEPER', 54, 3, (select id from league_type where name = 'Soccer'));
INSERT INTO statistic(id, name, block_type, external_id, points, league_type_id) 
    VALUES((select nextval('stat_seq')), 'Corners', 'DEFENDER', 54, 2, (select id from league_type where name = 'Soccer'));
INSERT INTO statistic(id, name, block_type, external_id, points, league_type_id) 
    VALUES((select nextval('stat_seq')), 'Corners', 'MIDFIELDER', 54, 5, (select id from league_type where name = 'Soccer'));
INSERT INTO statistic(id, name, block_type, external_id, points, league_type_id) 
    VALUES((select nextval('stat_seq')), 'Corners', 'STRIKER', 54, 5, (select id from league_type where name = 'Soccer'));

INSERT INTO statistic(id, name, block_type, external_id, points, league_type_id) 
    VALUES((select nextval('stat_seq')), 'Direct free kick', 'GOALKEEPER', 707, 20, (select id from league_type where name = 'Soccer'));
INSERT INTO statistic(id, name, block_type, external_id, points, league_type_id) 
    VALUES((select nextval('stat_seq')), 'Direct free kick', 'DEFENDER', 707, 20, (select id from league_type where name = 'Soccer'));
INSERT INTO statistic(id, name, block_type, external_id, points, league_type_id) 
    VALUES((select nextval('stat_seq')), 'Direct free kick', 'MIDFIELDER', 707, 20, (select id from league_type where name = 'Soccer'));
INSERT INTO statistic(id, name, block_type, external_id, points, league_type_id) 
    VALUES((select nextval('stat_seq')), 'Direct free kick', 'STRIKER', 707, 20, (select id from league_type where name = 'Soccer'));
    
INSERT INTO statistic(id, name, block_type, external_id, points, league_type_id) 
    VALUES((select nextval('stat_seq')), 'Obtained penalty', 'GOALKEEPER', 100, 30, (select id from league_type where name = 'Soccer'));
INSERT INTO statistic(id, name, block_type, external_id, points, league_type_id) 
    VALUES((select nextval('stat_seq')), 'Obtained penalty', 'DEFENDER', 100, 30, (select id from league_type where name = 'Soccer'));
INSERT INTO statistic(id, name, block_type, external_id, points, league_type_id) 
    VALUES((select nextval('stat_seq')), 'Obtained penalty', 'MIDFIELDER', 100, 30, (select id from league_type where name = 'Soccer'));
INSERT INTO statistic(id, name, block_type, external_id, points, league_type_id) 
    VALUES((select nextval('stat_seq')), 'Obtained penalty', 'STRIKER', 100, 30, (select id from league_type where name = 'Soccer'));
 
    
INSERT INTO statistic(id, name, block_type, external_id, points, league_type_id) 
    VALUES((select nextval('stat_seq')), 'Indirect free kick', 'GOALKEEPER', 708, 10, (select id from league_type where name = 'Soccer'));
INSERT INTO statistic(id, name, block_type, external_id, points, league_type_id) 
    VALUES((select nextval('stat_seq')), 'Indirect free kick', 'DEFENDER', 708, 10, (select id from league_type where name = 'Soccer'));
INSERT INTO statistic(id, name, block_type, external_id, points, league_type_id) 
    VALUES((select nextval('stat_seq')), 'Indirect free kick', 'MIDFIELDER', 708, 10, (select id from league_type where name = 'Soccer'));
INSERT INTO statistic(id, name, block_type, external_id, points, league_type_id) 
    VALUES((select nextval('stat_seq')), 'Indirect free kick', 'STRIKER', 708, 10, (select id from league_type where name = 'Soccer'));
    
INSERT INTO statistic(id, name, block_type, external_id, points, league_type_id) 
    VALUES((select nextval('stat_seq')), 'Goal', 'GOALKEEPER', 11, 100, (select id from league_type where name = 'Soccer'));
INSERT INTO statistic(id, name, block_type, external_id, points, league_type_id) 
    VALUES((select nextval('stat_seq')), 'Goal', 'DEFENDER', 11, 40, (select id from league_type where name = 'Soccer'));
INSERT INTO statistic(id, name, block_type, external_id, points, league_type_id) 
    VALUES((select nextval('stat_seq')), 'Goal', 'MIDFIELDER', 11, 50, (select id from league_type where name = 'Soccer'));
INSERT INTO statistic(id, name, block_type, external_id, points, league_type_id) 
    VALUES((select nextval('stat_seq')), 'Goal', 'STRIKER', 11, 70, (select id from league_type where name = 'Soccer'));
    
INSERT INTO statistic(id, name, block_type, external_id, points, league_type_id) 
    VALUES((select nextval('stat_seq')), 'Penalty Goal', 'GOALKEEPER', 98, 50, (select id from league_type where name = 'Soccer'));
INSERT INTO statistic(id, name, block_type, external_id, points, league_type_id) 
    VALUES((select nextval('stat_seq')), 'Penalty Goal', 'DEFENDER', 98, 20, (select id from league_type where name = 'Soccer'));
INSERT INTO statistic(id, name, block_type, external_id, points, league_type_id) 
    VALUES((select nextval('stat_seq')), 'Penalty Goal', 'MIDFIELDER', 98, 20, (select id from league_type where name = 'Soccer'));
INSERT INTO statistic(id, name, block_type, external_id, points, league_type_id) 
    VALUES((select nextval('stat_seq')), 'Penalty Goal', 'STRIKER', 98, 20, (select id from league_type where name = 'Soccer'));
 
INSERT INTO statistic(id, name, block_type, external_id, points, league_type_id) 
    VALUES((select nextval('stat_seq')), 'Own Goal', 'GOALKEEPER', 96, -20, (select id from league_type where name = 'Soccer'));
INSERT INTO statistic(id, name, block_type, external_id, points, league_type_id) 
    VALUES((select nextval('stat_seq')), 'Own Goal', 'DEFENDER', 96, -20, (select id from league_type where name = 'Soccer'));
INSERT INTO statistic(id, name, block_type, external_id, points, league_type_id) 
    VALUES((select nextval('stat_seq')), 'Own Goal', 'MIDFIELDER', 96, -20, (select id from league_type where name = 'Soccer'));
INSERT INTO statistic(id, name, block_type, external_id, points, league_type_id) 
    VALUES((select nextval('stat_seq')), 'Own Goal', 'STRIKER', 96, -20, (select id from league_type where name = 'Soccer'));
    
INSERT INTO statistic(id, name, block_type, external_id, points, league_type_id) 
    VALUES((select nextval('stat_seq')), 'Shots off target', 'GOALKEEPER', 117, 10, (select id from league_type where name = 'Soccer'));
INSERT INTO statistic(id, name, block_type, external_id, points, league_type_id) 
    VALUES((select nextval('stat_seq')), 'Shots off target', 'DEFENDER', 117, 20, (select id from league_type where name = 'Soccer'));
INSERT INTO statistic(id, name, block_type, external_id, points, league_type_id) 
    VALUES((select nextval('stat_seq')), 'Shots off target', 'MIDFIELDER', 117, 20, (select id from league_type where name = 'Soccer'));
INSERT INTO statistic(id, name, block_type, external_id, points, league_type_id) 
    VALUES((select nextval('stat_seq')), 'Shots off target', 'STRIKER', 117, 25, (select id from league_type where name = 'Soccer'));
  
INSERT INTO statistic(id, name, block_type, external_id, points, league_type_id) 
    VALUES((select nextval('stat_seq')), 'Shots on target', 'GOALKEEPER', 20, 30, (select id from league_type where name = 'Soccer'));
INSERT INTO statistic(id, name, block_type, external_id, points, league_type_id) 
    VALUES((select nextval('stat_seq')), 'Shots on target', 'DEFENDER', 20, 20, (select id from league_type where name = 'Soccer'));
INSERT INTO statistic(id, name, block_type, external_id, points, league_type_id) 
    VALUES((select nextval('stat_seq')), 'Shots on target', 'MIDFIELDER', 20, 20, (select id from league_type where name = 'Soccer'));
INSERT INTO statistic(id, name, block_type, external_id, points, league_type_id) 
    VALUES((select nextval('stat_seq')), 'Shots on target', 'STRIKER', 20, 30, (select id from league_type where name = 'Soccer'));
 
INSERT INTO statistic(id, name, block_type, external_id, points, league_type_id) 
    VALUES((select nextval('stat_seq')), 'Stop', 'GOALKEEPER', 172, 30, (select id from league_type where name = 'Soccer'));
INSERT INTO statistic(id, name, block_type, external_id, points, league_type_id) 
    VALUES((select nextval('stat_seq')), 'Diversions', 'GOALKEEPER', 174, 20, (select id from league_type where name = 'Soccer'));
INSERT INTO statistic(id, name, block_type, external_id, points, league_type_id) 
    VALUES((select nextval('stat_seq')), 'Goal Against', 'GOALKEEPER', -1, -35, (select id from league_type where name = 'Soccer'));

INSERT INTO statistic(id, name, block_type, external_id, points, league_type_id) 
    VALUES((select nextval('stat_seq')), 'Match Win', 'GOALKEEPER', -2, 20, (select id from league_type where name = 'Soccer'));
INSERT INTO statistic(id, name, block_type, external_id, points, league_type_id) 
    VALUES((select nextval('stat_seq')), 'Match Win', 'DEFENDER', -2, 20, (select id from league_type where name = 'Soccer'));
INSERT INTO statistic(id, name, block_type, external_id, points, league_type_id) 
    VALUES((select nextval('stat_seq')), 'Match Win', 'MIDFIELDER', -2, 20, (select id from league_type where name = 'Soccer'));
INSERT INTO statistic(id, name, block_type, external_id, points, league_type_id) 
    VALUES((select nextval('stat_seq')), 'Match Win', 'STRIKER', -2, 20, (select id from league_type where name = 'Soccer'));
    
INSERT INTO statistic(id, name, block_type, external_id, points, league_type_id) 
    VALUES((select nextval('stat_seq')), 'Match Draw', 'GOALKEEPER', -3, 10, (select id from league_type where name = 'Soccer'));
INSERT INTO statistic(id, name, block_type, external_id, points, league_type_id) 
    VALUES((select nextval('stat_seq')), 'Match Draw', 'DEFENDER', -3, 10, (select id from league_type where name = 'Soccer'));
INSERT INTO statistic(id, name, block_type, external_id, points, league_type_id) 
    VALUES((select nextval('stat_seq')), 'Match Draw', 'MIDFIELDER', -3, 10, (select id from league_type where name = 'Soccer'));
INSERT INTO statistic(id, name, block_type, external_id, points, league_type_id) 
    VALUES((select nextval('stat_seq')), 'Match Draw', 'STRIKER', -3, 10, (select id from league_type where name = 'Soccer'));
    
INSERT INTO statistic(id, name, block_type, external_id, points, league_type_id) 
    VALUES((select nextval('stat_seq')), 'Match Lost', 'GOALKEEPER', -4, -20, (select id from league_type where name = 'Soccer'));
INSERT INTO statistic(id, name, block_type, external_id, points, league_type_id) 
    VALUES((select nextval('stat_seq')), 'Match Lost', 'DEFENDER', -4, -20, (select id from league_type where name = 'Soccer'));
INSERT INTO statistic(id, name, block_type, external_id, points, league_type_id) 
    VALUES((select nextval('stat_seq')), 'Match Lost', 'MIDFIELDER', -4, -20, (select id from league_type where name = 'Soccer'));
INSERT INTO statistic(id, name, block_type, external_id, points, league_type_id) 
    VALUES((select nextval('stat_seq')), 'Match Lost', 'STRIKER', -4, -20, (select id from league_type where name = 'Soccer'));
    
    
    
-- Fixtures
INSERT INTO fixture(id, description, start_datetime, end_datetime, league_season_id) 
    VALUES((select nextval('fixture_seq')), null, '2012-08-10 15:00:00.0', '2012-08-10 17:00:00.0', (select id from league_season where status = 'CURRENT' and league_id = (select id from league where name = 'ABSA Premier Soccer League')));  
  
-- Playing Weeks
-- Saturday to Friday
INSERT INTO game_playing_week(id, start_date_time, end_date_time, league_season_id, playing_week_order)
 VALUES ((select nextval('pool_seq')), '2013-07-31 00:00:00.0', '2013-08-02 23:59:59.999', (select id from league_season where status = 'CURRENT' and league_id = (select id from league where name = 'ABSA Premier Soccer League')), 1);
INSERT INTO game_playing_week(id, start_date_time, end_date_time, league_season_id, playing_week_order)
 VALUES ((select nextval('pool_seq')), '2013-08-03 00:00:00.0', '2013-08-09 23:59:59.999', (select id from league_season where status = 'CURRENT' and league_id = (select id from league where name = 'ABSA Premier Soccer League')), 2);
INSERT INTO game_playing_week(id, start_date_time, end_date_time, league_season_id, playing_week_order)
 VALUES ((select nextval('pool_seq')), '2013-08-10 00:00:00.0', '2013-08-16 23:59:59.999', (select id from league_season where status = 'CURRENT' and league_id = (select id from league where name = 'ABSA Premier Soccer League')), 3);
INSERT INTO game_playing_week(id, start_date_time, end_date_time, league_season_id, playing_week_order)
 VALUES ((select nextval('pool_seq')), '2013-08-17 00:00:00.0', '2013-08-23 23:59:59.999', (select id from league_season where status = 'CURRENT' and league_id = (select id from league where name = 'ABSA Premier Soccer League')), 4);
INSERT INTO game_playing_week(id, start_date_time, end_date_time, league_season_id, playing_week_order)
 VALUES ((select nextval('pool_seq')), '2013-08-24 00:00:00.0', '2013-08-30 23:59:59.999', (select id from league_season where status = 'CURRENT' and league_id = (select id from league where name = 'ABSA Premier Soccer League')), 5);
 
INSERT INTO game_playing_week(id, start_date_time, end_date_time, league_season_id, playing_week_order)
 VALUES ((select nextval('pool_seq')), '2013-08-31 00:00:00.0', '2013-09-06 23:59:59.999', (select id from league_season where status = 'CURRENT' and league_id = (select id from league where name = 'ABSA Premier Soccer League')), 6);
INSERT INTO game_playing_week(id, start_date_time, end_date_time, league_season_id, playing_week_order)
 VALUES ((select nextval('pool_seq')), '2013-09-07 00:00:00.0', '2013-09-13 23:59:59.999', (select id from league_season where status = 'CURRENT' and league_id = (select id from league where name = 'ABSA Premier Soccer League')), 7); 
INSERT INTO game_playing_week(id, start_date_time, end_date_time, league_season_id, playing_week_order)
 VALUES ((select nextval('pool_seq')), '2013-09-14 00:00:00.0', '2013-09-20 23:59:59.999', (select id from league_season where status = 'CURRENT' and league_id = (select id from league where name = 'ABSA Premier Soccer League')), 8);
INSERT INTO game_playing_week(id, start_date_time, end_date_time, league_season_id, playing_week_order)
 VALUES ((select nextval('pool_seq')), '2013-09-21 00:00:00.0', '2013-09-27 23:59:59.999', (select id from league_season where status = 'CURRENT' and league_id = (select id from league where name = 'ABSA Premier Soccer League')), 9);
INSERT INTO game_playing_week(id, start_date_time, end_date_time, league_season_id, playing_week_order)
 VALUES ((select nextval('pool_seq')), '2013-09-28 00:00:00.0', '2013-10-04 23:59:59.999', (select id from league_season where status = 'CURRENT' and league_id = (select id from league where name = 'ABSA Premier Soccer League')), 10);
INSERT INTO game_playing_week(id, start_date_time, end_date_time, league_season_id, playing_week_order)
 VALUES ((select nextval('pool_seq')), '2013-10-05 00:00:00.0', '2013-10-11 23:59:59.999', (select id from league_season where status = 'CURRENT' and league_id = (select id from league where name = 'ABSA Premier Soccer League')), 11);
INSERT INTO game_playing_week(id, start_date_time, end_date_time, league_season_id, playing_week_order)
 VALUES ((select nextval('pool_seq')), '2013-10-12 00:00:00.0', '2013-10-18 23:59:59.999', (select id from league_season where status = 'CURRENT' and league_id = (select id from league where name = 'ABSA Premier Soccer League')), 12); 
INSERT INTO game_playing_week(id, start_date_time, end_date_time, league_season_id, playing_week_order)
 VALUES ((select nextval('pool_seq')), '2013-10-19 00:00:00.0', '2013-10-25 23:59:59.999', (select id from league_season where status = 'CURRENT' and league_id = (select id from league where name = 'ABSA Premier Soccer League')), 13);
INSERT INTO game_playing_week(id, start_date_time, end_date_time, league_season_id, playing_week_order)
 VALUES ((select nextval('pool_seq')), '2013-10-26 00:00:00.0', '2013-11-01 23:59:59.999', (select id from league_season where status = 'CURRENT' and league_id = (select id from league where name = 'ABSA Premier Soccer League')), 14);
INSERT INTO game_playing_week(id, start_date_time, end_date_time, league_season_id, playing_week_order)
 VALUES ((select nextval('pool_seq')), '2013-11-02 00:00:00.0', '2013-11-08 23:59:59.999', (select id from league_season where status = 'CURRENT' and league_id = (select id from league where name = 'ABSA Premier Soccer League')), 15); 
INSERT INTO game_playing_week(id, start_date_time, end_date_time, league_season_id, playing_week_order)
 VALUES ((select nextval('pool_seq')), '2013-11-09 00:00:00.0', '2013-11-15 23:59:59.999', (select id from league_season where status = 'CURRENT' and league_id = (select id from league where name = 'ABSA Premier Soccer League')), 16);
INSERT INTO game_playing_week(id, start_date_time, end_date_time, league_season_id, playing_week_order)
 VALUES ((select nextval('pool_seq')), '2013-11-16 00:00:00.0', '2013-11-22 23:59:59.999', (select id from league_season where status = 'CURRENT' and league_id = (select id from league where name = 'ABSA Premier Soccer League')), 17);
INSERT INTO game_playing_week(id, start_date_time, end_date_time, league_season_id, playing_week_order)
 VALUES ((select nextval('pool_seq')), '2013-11-23 00:00:00.0', '2013-11-29 23:59:59.999', (select id from league_season where status = 'CURRENT' and league_id = (select id from league where name = 'ABSA Premier Soccer League')), 18);
INSERT INTO game_playing_week(id, start_date_time, end_date_time, league_season_id, playing_week_order)
 VALUES ((select nextval('pool_seq')), '2013-11-30 00:00:00.0', '2013-12-06 23:59:59.999', (select id from league_season where status = 'CURRENT' and league_id = (select id from league where name = 'ABSA Premier Soccer League')), 19);
INSERT INTO game_playing_week(id, start_date_time, end_date_time, league_season_id, playing_week_order)
 VALUES ((select nextval('pool_seq')), '2013-12-07 00:00:00.0', '2013-12-13 23:59:59.999', (select id from league_season where status = 'CURRENT' and league_id = (select id from league where name = 'ABSA Premier Soccer League')), 20);
 INSERT INTO game_playing_week(id, start_date_time, end_date_time, league_season_id, playing_week_order)
 VALUES ((select nextval('pool_seq')), '2013-12-14 00:00:00.0', '2013-12-20 23:59:59.999', (select id from league_season where status = 'CURRENT' and league_id = (select id from league where name = 'ABSA Premier Soccer League')), 21);
INSERT INTO game_playing_week(id, start_date_time, end_date_time, league_season_id, playing_week_order)
 VALUES ((select nextval('pool_seq')), '2013-12-21 00:00:00.0', '2013-12-27 23:59:59.999', (select id from league_season where status = 'CURRENT' and league_id = (select id from league where name = 'ABSA Premier Soccer League')), 22); 
INSERT INTO game_playing_week(id, start_date_time, end_date_time, league_season_id, playing_week_order)
 VALUES ((select nextval('pool_seq')), '2013-12-28 00:00:00.0', '2014-01-03 23:59:59.999', (select id from league_season where status = 'CURRENT' and league_id = (select id from league where name = 'ABSA Premier Soccer League')), 23);
INSERT INTO game_playing_week(id, start_date_time, end_date_time, league_season_id, playing_week_order)
 VALUES ((select nextval('pool_seq')), '2014-01-04 00:00:00.0', '2014-01-10 23:59:59.999', (select id from league_season where status = 'CURRENT' and league_id = (select id from league where name = 'ABSA Premier Soccer League')), 24);
INSERT INTO game_playing_week(id, start_date_time, end_date_time, league_season_id, playing_week_order)
 VALUES ((select nextval('pool_seq')), '2014-01-11 00:00:00.0', '2014-01-17 23:59:59.999', (select id from league_season where status = 'CURRENT' and league_id = (select id from league where name = 'ABSA Premier Soccer League')), 25);
INSERT INTO game_playing_week(id, start_date_time, end_date_time, league_season_id, playing_week_order)
 VALUES ((select nextval('pool_seq')), '2014-01-18 00:00:00.0', '2014-01-24 23:59:59.999', (select id from league_season where status = 'CURRENT' and league_id = (select id from league where name = 'ABSA Premier Soccer League')), 26);
INSERT INTO game_playing_week(id, start_date_time, end_date_time, league_season_id, playing_week_order)
 VALUES ((select nextval('pool_seq')), '2014-01-25 00:00:00.0', '2014-01-31 23:59:59.999', (select id from league_season where status = 'CURRENT' and league_id = (select id from league where name = 'ABSA Premier Soccer League')), 27);
INSERT INTO game_playing_week(id, start_date_time, end_date_time, league_season_id, playing_week_order)
 VALUES ((select nextval('pool_seq')), '2014-02-01 00:00:00.0', '2014-02-07 23:59:59.999', (select id from league_season where status = 'CURRENT' and league_id = (select id from league where name = 'ABSA Premier Soccer League')), 28);
INSERT INTO game_playing_week(id, start_date_time, end_date_time, league_season_id, playing_week_order)
 VALUES ((select nextval('pool_seq')), '2014-02-08 00:00:00.0', '2014-02-14 23:59:59.999', (select id from league_season where status = 'CURRENT' and league_id = (select id from league where name = 'ABSA Premier Soccer League')), 29);
INSERT INTO game_playing_week(id, start_date_time, end_date_time, league_season_id, playing_week_order)
 VALUES ((select nextval('pool_seq')), '2014-02-15 00:00:00.0', '2014-02-21 23:59:59.999', (select id from league_season where status = 'CURRENT' and league_id = (select id from league where name = 'ABSA Premier Soccer League')), 30);
INSERT INTO game_playing_week(id, start_date_time, end_date_time, league_season_id, playing_week_order)
 VALUES ((select nextval('pool_seq')), '2014-02-22 00:00:00.0', '2014-02-28 23:59:59.999', (select id from league_season where status = 'CURRENT' and league_id = (select id from league where name = 'ABSA Premier Soccer League')), 31);
INSERT INTO game_playing_week(id, start_date_time, end_date_time, league_season_id, playing_week_order)
 VALUES ((select nextval('pool_seq')), '2014-03-01 00:00:00.0', '2014-03-07 23:59:59.999', (select id from league_season where status = 'CURRENT' and league_id = (select id from league where name = 'ABSA Premier Soccer League')), 32);
 INSERT INTO game_playing_week(id, start_date_time, end_date_time, league_season_id, playing_week_order)
 VALUES ((select nextval('pool_seq')), '2014-03-08 00:00:00.0', '2014-03-14 23:59:59.999', (select id from league_season where status = 'CURRENT' and league_id = (select id from league where name = 'ABSA Premier Soccer League')), 33);
INSERT INTO game_playing_week(id, start_date_time, end_date_time, league_season_id, playing_week_order)
 VALUES ((select nextval('pool_seq')), '2014-03-15 00:00:00.0', '2014-03-21 23:59:59.999', (select id from league_season where status = 'CURRENT' and league_id = (select id from league where name = 'ABSA Premier Soccer League')), 34);
INSERT INTO game_playing_week(id, start_date_time, end_date_time, league_season_id, playing_week_order)
 VALUES ((select nextval('pool_seq')), '2014-03-22 00:00:00.0', '2014-03-28 23:59:59.999', (select id from league_season where status = 'CURRENT' and league_id = (select id from league where name = 'ABSA Premier Soccer League')), 35);
INSERT INTO game_playing_week(id, start_date_time, end_date_time, league_season_id, playing_week_order)
 VALUES ((select nextval('pool_seq')), '2014-03-29 00:00:00.0', '2014-04-04 23:59:59.999', (select id from league_season where status = 'CURRENT' and league_id = (select id from league where name = 'ABSA Premier Soccer League')), 36);
INSERT INTO game_playing_week(id, start_date_time, end_date_time, league_season_id, playing_week_order)
 VALUES ((select nextval('pool_seq')), '2014-04-5 00:00:00.0', '2014-04-11 23:59:59.999', (select id from league_season where status = 'CURRENT' and league_id = (select id from league where name = 'ABSA Premier Soccer League')), 37);
INSERT INTO game_playing_week(id, start_date_time, end_date_time, league_season_id, playing_week_order)
 VALUES ((select nextval('pool_seq')), '2014-04-12 00:00:00.0', '2014-04-18 23:59:59.999', (select id from league_season where status = 'CURRENT' and league_id = (select id from league where name = 'ABSA Premier Soccer League')), 38);
INSERT INTO game_playing_week(id, start_date_time, end_date_time, league_season_id, playing_week_order)
 VALUES ((select nextval('pool_seq')), '2014-04-19 00:00:00.0', '2014-04-25 23:59:59.999', (select id from league_season where status = 'CURRENT' and league_id = (select id from league where name = 'ABSA Premier Soccer League')), 39);
INSERT INTO game_playing_week(id, start_date_time, end_date_time, league_season_id, playing_week_order)
 VALUES ((select nextval('pool_seq')), '2014-04-26 00:00:00.0', '2014-05-02 23:59:59.999', (select id from league_season where status = 'CURRENT' and league_id = (select id from league where name = 'ABSA Premier Soccer League')), 40);
INSERT INTO game_playing_week(id, start_date_time, end_date_time, league_season_id, playing_week_order)
 VALUES ((select nextval('pool_seq')), '2014-05-03 00:00:00.0', '2014-05-09 23:59:59.999', (select id from league_season where status = 'CURRENT' and league_id = (select id from league where name = 'ABSA Premier Soccer League')), 41);
INSERT INTO game_playing_week(id, start_date_time, end_date_time, league_season_id, playing_week_order)
 VALUES ((select nextval('pool_seq')), '2014-05-10 00:00:00.0', '2014-05-16 23:59:59.999', (select id from league_season where status = 'CURRENT' and league_id = (select id from league where name = 'ABSA Premier Soccer League')), 42);
INSERT INTO game_playing_week(id, start_date_time, end_date_time, league_season_id, playing_week_order)
 VALUES ((select nextval('pool_seq')), '2014-05-17 00:00:00.0', '2014-05-23 23:59:59.999', (select id from league_season where status = 'CURRENT' and league_id = (select id from league where name = 'ABSA Premier Soccer League')), 43);
INSERT INTO game_playing_week(id, start_date_time, end_date_time, league_season_id, playing_week_order)
 VALUES ((select nextval('pool_seq')), '2014-05-24 00:00:00.0', '2014-05-30 23:59:59.999', (select id from league_season where status = 'CURRENT' and league_id = (select id from league where name = 'ABSA Premier Soccer League')), 44); 
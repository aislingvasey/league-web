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
    VALUES((select nextval('league_data_seq')), 5000000, null, 1, 1, 4, 15, 50, (select id from game_team_format where name='4-4-2' and league_type_id = (select id from league_type where name = 'Soccer')) , (select id from league where name = 'ABSA Premier Soccer League'));
    
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
 


 
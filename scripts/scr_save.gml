if file_exists("wobl.sav") {
    file_delete("wobl.sav");
}
if global.reset = false {
    ini_open("wobl.sav");
    
    ini_write_real("numbers", "highscore", global.highscore);
    ini_write_real("numbers", "coins", global.coins);
    ini_write_real("numbers", "level", global.level);
    ini_write_real("numbers", "xpGot", global.xpGot);
    ini_write_real("numbers", "xpNeeded", global.xpNeeded);
    ini_write_real("numbers", "ballNumber", global.ballNumber);
    
    ini_write_real("technical", "noads", global.noads);
    ini_write_real("technical", "tuts0", global.firstTime);
    ini_write_real("technical", "tuts1", global.shopSwiped);
    ini_write_real("technical", "tuts2", global.settingsSwiped);
    
    ini_write_real("technical", "dailyReward", global.dailyReward);
    ini_write_real("technical", "year", date_get_year(date_current_datetime()));
    ini_write_real("technical", "month", date_get_month(date_current_datetime()));
    ini_write_real("technical", "day", date_get_day(date_current_datetime()));
    
    ini_write_real("balls", "ballType", global.ballType);
    
    for (j = 1; j <= global.premBallNumber; j++) {
        ini_write_real("premBalls", "ball" + string(j), global.premBalls[j,2]);
    }
    
    for (i = 1; i <= global.ballNumber; i++) {
        ini_write_real("balls", "ballSprite" + string(i), global.balls[i,1]);
        ini_write_real("balls", "ball" + string(i), global.balls[i,2]);
    }
    
    ini_close();
}

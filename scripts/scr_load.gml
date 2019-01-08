if file_exists("wobl.sav") {
    ini_open("wobl.sav");
    
    global.highscore = ini_read_real("numbers", "highscore", 0);
    global.coins = ini_read_real("numbers", "coins", 0);
    global.level = ini_read_real("numbers", "level", 0);
    global.xpGot = ini_read_real("numbers", "xpGot", 0);
    global.xpNeeded = ini_read_real("numbers", "xpNeeded", 50);
    global.ballNumber = ini_read_real("numbers", "ballNumber", 34);
    
    global.noads = ini_read_real("technical", "noads", false);
    global.firstTime = ini_read_real("technical", "tuts0", true);
    global.shopSwiped = ini_read_real("technical", "tuts1", false);
    global.settingsSwiped = ini_read_real("technical", "tuts2", false);
    
    global.dailyReward = ini_read_real("technical", "dailyReward", true);
    global.year = ini_read_real("technical", "year", 0);
    global.month = ini_read_real("technical", "month", 0);
    global.day = ini_read_real("technical", "day", 0);
    
    global.ballType = ini_read_real("balls", "ballType", spr_ball1);
    
    for (j = 1; j <= global.premBallNumber; j++) {
        global.premBalls[j, 2] = ini_read_real("premBalls", "ball" + string(j), false);
    }
    
    for (i = 1; i <= global.ballNumber; i++)  {
        global.balls[i, 2] = ini_read_real("balls", "ball" + string(i), false);
        global.balls[i, 1] = ini_read_real("balls", "ballSprite" + string(i), global.balls[i, 1]);
        if global.balls[i, 1] = 0 {
            tempNum = irandom_range(1, global.premBallNumber);
            tempCount = 0;
            while global.premBalls[tempNum, 1] = true {
                tempNum += 1;
                tempCount += 1;
                if tempNum > global.premBallNumber {
                    tempNum = 1;
                }
                if tempCount > global.premBallNumber {
                    break;
                }
            }
            global.balls = global.premBalls[tempNum, 1];
            global.premBalls[tempNum, 2] = true;
        }
    }
    ini_close();
}

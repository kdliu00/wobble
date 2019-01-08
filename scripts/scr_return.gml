if menuSwap = false {
    if abs(global.swipeSpeed) > 10 {
        if oX = centerColumn {
            if global.swipeSpeed < 0 {
                oX = rightColumn;
            } else {
                oX = leftColumn;
            }
        } else if oX = leftColumn {
            if global.swipeSpeed < 0 {
                oX = centerColumn;
            }
        } else if oX = rightColumn {
            if global.swipeSpeed > 0 {
                oX = centerColumn;
            }
        }
    } else {
        if oX = centerColumn {
            if x >= rightBound - 150 {
                oX = rightColumn;
            } else if x <= leftBound + 150 {
                oX = leftColumn;
            }
        } else if oX = rightColumn {
            if x <= rightBound + 150 {
                oX = centerColumn;
            }
        } else if oX = leftColumn {
            if x >= leftBound - 150 {
                oX = centerColumn;
            }
        }
    }
    menuSwap = true;
}

if set = false {
    deltaX = abs(x - oX);
    velocityI = sqrt(2 * global.acc * deltaX);
    returnSpeed = velocityI;
    set = true;
}

if abs(oX - x) > 2 {
    if x > oX {
        if x - returnSpeed > oX {
            x -= returnSpeed;
        } else {
            x = oX;
        }
        if returnSpeed - global.acc > 0 {
            returnSpeed -= global.acc;
        } else {
            returnSpeed = 0
        }
    } else {
        if x + returnSpeed < oX {
            x += returnSpeed;
        } else {
            x = oX;
        }
        if returnSpeed - global.acc > 0 {
            returnSpeed -= global.acc;
        } else {
            returnSpeed = 0
        }
    }
} else {
    x = oX;
    returning = false;
    set = false;
    menuSwap = false;
}

#include <timerunit.h>

/**
 * Function: TimerUnit
 * Argument: inr-Time Interval
 * return: none
 * use: used to set the time elapsed to zero after 'inr' seconds
 **/
TimerUnit::TimerUnit(int inr)
    : interval(inr) 
{
    std::time(&previousTime);
    presentTime = previousTime;
    delta = 0;
}

/**
 * Function: TimerUnit
 * Argument: none
 * return: none
 * use: used to set the time elapsed to zero after 5 seconds
 **/
TimerUnit::TimerUnit(void)
{
    interval = 5;
    std::time(&previousTime);
    presentTime = previousTime;
    delta = 0;
}

/**
 * Function: checkTime
 * Argument: none
 * return: true-time elapsed has set to zero
           false-some time has passed after last try to connect to network
 * use: used to check the time elapsed after the last try to connect to network
 **/
const bool TimerUnit::checkTime()
{
    std::time(&presentTime);
    delta = std::difftime(presentTime, previousTime);
    if(delta >= interval)
    {
        delta = 0;
        previousTime = presentTime;
        return true;
    }
    else
        return false;
}

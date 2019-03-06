#!/usr/bin/env python3

'''
RESOURCE MONITOR
created by: Nick Gerace

Provides CPU usage and network
usage monitoring with a one
second refresh rate.
'''

import psutil
import time
import datetime
import sys

# Declare gloabl colors
cblue = '\033[38;5;33m'
clime = '\033[38;5;70m'
corange = '\033[38;5;229m'
creset = '\033[38;5;250m'


# Determine unit of time
def checktime(time, index):

    # First, assign time
    if index == 1:
        time = time / 60.0
    elif index == 2:
        time = time / 60.0 / 60.0
    elif index == 3:
        time = time / 60.0 / 60.0
    elif index > 3:
        print('Error: index out of range')
        sys.exit(0)
    else:
        pass

    # Second, assign index if the time is greater
    if index == 0 and time >= 60.0:
        index = 1
        time = time / 60.0
    elif index == 1 and time >= 60.0:
        index = 2
        time = time / 60.0
    elif index == 2 and time >= 60.0:
        index = 3

    # Note: no need to perform time comparison 
    elif index == 3:
        time = time / 24.0
    elif index == 3 and time > 99.0:
        print('Limit reached! (99 hours)')
        sys.exit(0)
    else:
        pass

    # Return tuple
    return time, index


# Format time output
def form_time(num):
    if num < 10.0:
        num = '0' + format(num, '.6f')
    else:
        num = format(num, '.6f')
    return num


# Format cpu output
def form_cpu(num):
    if num < 10.0:
        num = '0' + str(num)
    elif num >= 100.0:
        num = '99.9'
    else:
        num = str(num)
    return num


# Format network output
def form_net(num):
    if num < 10.0:
        num = '...' + str(int(num))
    elif num < 100.0:
        num = '..' + str(int(num))
    elif num < 1000.0:
        num = '.' + str(int(num))
    elif num >= 10000.0:
        num = '9999.9'
    else:
        num = str(int(num))
    return num


# Build row with strings
def build(a, b, c, d):
    final = '[ ' + a + ' | ' + b + ' | ' + c + ' | ' + d + ' ]'
    return final


# Returns the time as a string
def gettime():
    curr = datetime.datetime.now()
    return curr.strftime('%Y/%m/%d %I:%M:%S %p')


# Main
def main():

    # Determine interface
    io = 'en0'

    # Declare units and their counter
    units = ['sec', 'min', 'hrs', 'day']
    i = 0
    j = 0
    munit = units[i]

    # Check time
    begintime = '[ Start: ' + gettime() + ' ]'
    print(begintime)
    print('-' * len(begintime))

    # Prepare for loop
    start = time.time()
    total = 0.0

    # Loop
    try:
        while True:

            # Find current stats
            n1 = psutil.net_io_counters(pernic=True)
            mcpu = psutil.cpu_percent(interval=1)
            n2 = psutil.net_io_counters(pernic=True)
            msent = (n2[io].bytes_sent - n1[io].bytes_sent) / 1024.0
            mrecv = (n2[io].bytes_recv - n1[io].bytes_recv) / 1024.0
            curr = time.time()

            # Format for printing
            mcpu = form_cpu(mcpu)
            msent = form_net(msent)
            mrecv = form_net(mrecv)

            # Get current time, keep total for loop
            # Also, check units for time
            total = curr - start
            total, j = checktime(total, i)
            if j != i:
                i += 1
                munit = units[i]
            mtime = form_time(total)

            # Get print statements ready
            mcpu = 'CPU: ' + cblue + mcpu + creset + ' / 100.0'
            msent = 'Sent: ' + clime + msent + creset + ' KB'
            mrecv = 'Recv: ' + clime + mrecv + creset + ' KB'
            mtime = 'Time: ' + corange + mtime + creset + ' ' + munit

            # Print row
            print(build(mcpu, msent, mrecv, mtime))

    # Exit via CTRL+C
    except KeyboardInterrupt:
        endtime = '[ End: ' + gettime() + ' ]'
        print('-' * len(endtime))
        print(endtime)
        exit(0)


# Main
if __name__ == '__main__':
    main()


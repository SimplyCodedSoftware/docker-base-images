#!/bin/bash

#supervisor shouldn't run as pid 1 https://www.reddit.com/r/docker/comments/4ya371/best_way_to_run_multiple_processes_best_init/?st=j03sy52m&sh=c96751f0
supervisord -n
#!/bin/sh
ps -ef |grep openfire/ |grep -v grep|awk '{print $2}'|xargs kill -9
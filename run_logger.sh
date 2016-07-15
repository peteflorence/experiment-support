#!/usr/bin/env bash


TEST=$4_speed$1_noise$3
TIME=$(date +%Y%m%d_%H%M%S)
TESTDIR=race/$TEST/$TIME
mkdir -p $TESTDIR
cd $TESTDIR

rosrun trajectory_selector experiment_logger


trap "trap - SIGTERM && kill -- -$$" SIGINT SIGTERM EXIT
wait

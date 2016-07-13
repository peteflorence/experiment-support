#!/usr/bin/env bash

rosrun trajectory_selector experiment_logger

TEST="mpc_speed10_noise0_1"

TIME="$(date +%Y%m%d_%H%M%S)"
mkdir -p $TEST/"${TIME}"
mv *.txt $TEST/"${TIME}"



trap "trap - SIGTERM && kill -- -$$" SIGINT SIGTERM EXIT
wait

#!/usr/bin/env bash



pushd .

sleep 2

echo taking off

cd
cd fla-gtsc/fla_root/fsw/scripts/
./sim_takeoff.sh

sleep 7

echo publishing goal

rostopic pub -1 /move_base_simple/goal geometry_msgs/PoseStamped "header:
  seq: 0
  stamp:
    secs: 0
    nsecs: 0
  frame_id: ''
pose:
  position:
    x: 250.0
    y: 0.0
    z: 0.0
  orientation:
    x: 0.0
    y: 0.0
    z: 0.0
    w: 0.0" 

sleep 1
./sim_go.sh

popd


trap "trap - SIGTERM && kill -- -$$" SIGINT SIGTERM EXIT
wait

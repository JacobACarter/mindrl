#!/bin/bash

export MS_WORKER_NUM=$1
export MS_SCHED_HOST=127.0.0.1
export MS_SCHED_PORT=8088
# Launch 1 scheduler.
export MS_ROLE=MS_SCHED
python train.py "--worker_num" ${MS_WORKER_NUM} --device_target CPU --enable_distribute True > scheduler.txt 2>&1 &
sched_pid=${!}
echo "Scheduler $sched_pid start success!"

# Launch $MS_WORKER_NUM workers, inxluding acotor and learner.
export MS_ROLE=MS_WORKER
for((i=0;i<${MS_WORKER_NUM};i++));
do
    python train.py "--worker_num" ${MS_WORKER_NUM} --device_target CPU --enable_distribute True > worker_$i.txt 2>&1 &
    echo "Worker ${i} start success with pid ${!}"
done

exit 0

##eg: usage
#$ppo bash scripts/run_multi_env.sh 3

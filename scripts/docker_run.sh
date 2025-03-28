# echo "stop and rm docker" 
# docker stop malloc_reproduce > /dev/null
# docker rm -v -f malloc_reproduce > /dev/null


MONITOR_HOME_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )/../.." && pwd )"

display=""
if [ -z ${DISPLAY} ];then
    display=":1"
else
    display="${DISPLAY}"
fi

local_host="$(hostname)"
user="${USER}"
uid="$(id -u)"
group="$(id -g -n)"
gid="$(id -g)"

docker run -it -d \
--gpus all \
--name malloc_java \
--privileged=true \
--restart=always \
-e DISPLAY=$display \
-e DOCKER_USER="${user}" \
-e USER="${user}" \
-e DOCKER_USER_ID="${uid}" \
-e DOCKER_GRP="${group}" \
-e DOCKER_GRP_ID="${gid}" \
-e NVIDIA_DRIVER_CAPABILITIES=compute,utility \
-e NVIDIA_VISIBLE_DEVICES=all \
-p 49764:22 \
-p 66666:6666 \
-v /home/malloc/Documents/project/mystation:/share/mystation
linux22:gpuReproduce

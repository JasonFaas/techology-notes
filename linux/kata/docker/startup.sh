docker build -t ubuntu-systemd .
docker run --privileged -it \
  --cgroupns=host \
  --tmpfs /tmp --tmpfs /run --tmpfs /run/lock \
  -v /sys/fs/cgroup:/sys/fs/cgroup \
  ubuntu-systemd



sudo modprobe openvswitch
docker run -it --rm --privileged -v "${PWD}:/lab" -w /lab my-mininet bash

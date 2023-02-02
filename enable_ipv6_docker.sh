BRIDGE_NAME=br-$(docker network ls -f name=oxidized-https_default -q)
CONTAINER_ADDR=$(docker container inspect --format '{{ $network := index .NetworkSettings.Networks "oxidized-https_default" }}{{ $network.GlobalIPv6Address }}' oxidized-https_https-portal_1)
sudo ip6tables -t nat -A POSTROUTING -s fd00::/64 ! -o $BRIDGE_NAME -j MASQUERADE
sudo ip6tables -t nat -A PREROUTING -p tcp ! -i $BRIDGE_NAME --dport 80 -m addrtype --dst-type LOCAL -j DNAT --to-destination "[$CONTAINER_ADDR]:80"
sudo ip6tables -t nat -A PREROUTING -p tcp ! -i $BRIDGE_NAME --dport 443 -m addrtype --dst-type LOCAL -j DNAT --to-destination "[$CONTAINER_ADDR]:443"

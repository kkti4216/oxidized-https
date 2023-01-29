BRIDGE_NAME=br-$(docker network ls -f name=oxidized_default -q)
CONTAINER_ADDR=$(docker container inspect --format '{{ .NetworkSettings.Networks.oxidized_default.GlobalIPv6Address }}' oxidized_https-portal_1)
sudo ip6tables -t nat -D POSTROUTING -s fd00::/64 ! -o $BRIDGE_NAME -j MASQUERADE
sudo ip6tables -t nat -D PREROUTING -p tcp ! -i br-$(docker network ls -f name=oxidized_default -q) --dport 80 -m addrtype --dst-type LOCAL -j DNAT --to-destination "[$CONTAINER_ADDR]:80"
sudo ip6tables -t nat -D PREROUTING -p tcp ! -i br-$(docker network ls -f name=oxidized_default -q) --dport 443 -m addrtype --dst-type LOCAL -j DNAT --to-destination "[$CONTAINER_ADDR]:443"

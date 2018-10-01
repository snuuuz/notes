# From https://gist.github.com/a3rosol/ba74e00caf6cc842de3a8f558db43337
# See https://www.snbforums.com/threads/rt-ac87u-get-live-traffic-stats.40451/#post-338787

check () {
OUT=$(bwdpi stat -m traffic_wan -u realtime | awk 'END{print}' | awk -F= '{print $2}' | awk -F/ '{print $1}')
IN=$(bwdpi stat -m traffic_wan -u realtime | awk 'END{print}' | awk -F= '{print $2}' | awk -F/ '{print $2}')

TIME=3 #the stats from bwdpi get updated every 3 seconds. doesn't make sense to poll faster, so this will be our polling interval

#wait $TIME before running the same check, this way we can confirm how much the data has changed in two periods.
sleep $TIME
OUT2=$(bwdpi stat -m traffic_wan -u realtime | awk 'END{print}' | awk -F= '{print $2}' | awk -F/ '{print $1}')
IN2=$(bwdpi stat -m traffic_wan -u realtime | awk 'END{print}' | awk -F= '{print $2}' | awk -F/ '{print $2}')
DELTAOUT=$(( $OUT2 - $OUT))
DELTAIN=$(( $IN2 - $IN))
#Value is in octets so will need to be divided by 8 to get bytes, this is then divided by 1024 (kb) and 1024 again to give megabytes.
INPUTBW=$(((($DELTAIN)/$TIME)*8/1024/1024))
OUTPUTBW=$(((($DELTAOUT)/$TIME)*8/1024/1024))

msg="Inbound: $INPUTBW"mbps", Outbound: $OUTPUTBW"mbps""
echo $msg
}

while true; do
        check
done

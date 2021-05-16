#!/usr/bin/env bash

eth_in_usd=$(https GET "https://min-api.cryptocompare.com/data/price?fsym=ETH&tsyms=USD" | jq '.USD')
eth_in_brl=$(https GET "https://min-api.cryptocompare.com/data/price?fsym=ETH&tsyms=BRL" | jq '.BRL')

workers=$(https GET https://flexpool.io/api/v1/miner/0xB9c434215c09E8c4D6b621E6488D55E1d20CE446/workers/)

worker_name=$(echo "$workers" | jq '.result | .[0] | .name')
worker_online=$(echo "$workers" | jq '.result | .[0] | .online')
worker_rhashrate=$(echo "$workers" | jq '.result | .[0] | .reported_hashrate')
worker_effhashrate=$(echo "$workers" | jq '.result | .[0] | .effective_hashrate')
worker_lastseen=$(echo "$workers" | jq '.result | .[0] | .last_seen')
worker_lastseen=$(date -d "@$worker_lastseen")

balance_eth=$(bc <<< "scale=6; $(https GET https://flexpool.io/api/v1/miner/0xB9c434215c09E8c4D6b621E6488D55E1d20CE446/balance/ | jq '.result') / 1000000000000000000" | awk '{printf "%f", $0}')
daily_eth=$(bc <<< "scale=6; $(https GET https://flexpool.io/api/v1/miner/0xB9c434215c09E8c4D6b621E6488D55E1d20CE446/estimatedDailyRevenue/ | jq '.result') / 1000000000000000000" | awk '{printf "%f", $0}')
monthly_eth=$(bc <<< "scale=6; $daily_eth * 30" | awk '{printf "%f", $0}')

balance_usd=$(bc <<< "scale=2; $balance_eth * $eth_in_usd" | awk '{printf "%.2f", $0}')
daily_usd=$(bc <<< "scale=2; $daily_eth * $eth_in_usd" | awk '{printf "%.2f", $0}')
monthly_usd=$(bc <<< "scale=2; $monthly_eth * $eth_in_usd" | awk '{printf "%.2f", $0}')

balance_brl=$(bc <<< "scale=2; $balance_eth * $eth_in_brl" | awk '{printf "%.2f", $0}')
daily_brl=$(bc <<< "scale=2; $daily_eth * $eth_in_brl" | awk '{printf "%.2f", $0}')
monthly_brl=$(bc <<< "scale=2; $monthly_eth * $eth_in_brl" | awk '{printf "%.2f", $0}')


echo "1 ETH = $eth_in_usd USD / $eth_in_brl BRL"
echo ""
echo "Balance: $balance_eth ETH | $balance_usd USD | $balance_brl BRL"
echo "Daily: $daily_eth ETH | $daily_usd USD | $daily_brl BRL"
echo "Monthly: $monthly_eth ETH | $monthly_usd USD | $monthly_brl BRL"
echo ""
echo ""
echo "Workers:"
echo "$worker_name"
echo "  Online: $worker_online"
echo "      Rep_hashrate: $worker_rhashrate"
echo "      Eff_hashrate: $worker_effhashrate"
echo "  Last_seen: $worker_lastseen"

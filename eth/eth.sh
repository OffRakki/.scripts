#!/usr/bin/env bash

## new api
#balance real = value=$(https "https://api.flexpool.io/v2/miner/balance?coin=eth&address=0x37Cba5798f68684907CB917AFB9dcEbE73187137&countervalue=brl" | jq ".result.balanceCountervalue") && echo $value reais
#hashrates = https "https://api.flexpool.io/v2/miner/workers?coin=eth&address=0x37Cba5798f68684907CB917AFB9dcEbE73187137" | jq 'G.result[].name, .result[].isOnline,.result[].averageEffectiveHashrate, .result[].reportedHashrate, .result[].validShares'
#payments = https "https://api.flexpool.io/v2/miner/payments?coin=eth&address=0x37Cba5798f68684907CB917AFB9dcEbE73187137&countervalue=USD&page=0"

eth_in_usd=$(https "https://min-api.cryptocompare.com/data/price?fsym=ETH&tsyms=USD" | jq '.USD')
eth_in_brl=$(https "https://min-api.cryptocompare.com/data/price?fsym=ETH&tsyms=BRL" | jq '.BRL')

workers=$(https "https://api.flexpool.io/v2/miner/workers?coin=eth&address=0x37Cba5798f68684907CB917AFB9dcEbE73187137" | jq '{ name: .result[].name, online: .result[].isOnline, average_effective_hashrate: .result[].averageEffectiveHashrate, reported_hashrate: .result[].reportedHashrate, valid_hashrates: .result[].validShares }')

balance_eth=$(bc <<< "scale=6; $(https 'https://api.flexpool.io/v2/miner/balance?coin=eth&address=0x37Cba5798f68684907CB917AFB9dcEbE73187137&countervalue=BRL' | jq '.result.balance') / 1000000000000000000" | awk '{printf "%f", $0}')
#daily_eth=$(bc <<< "scale=6; $(https GET https://flexpool.io/api/v1/miner/0xB9c434215c09E8c4D6b621E6488D55E1d20CE446/estimatedDailyRevenue/ | jq '.result') / 1000000000000000000" | awk '{printf "%f", $0}')
#monthly_eth=$(bc <<< "scale=6; $daily_eth * 30" | awk '{printf "%f", $0}')

balance_usd=$(bc <<< "scale=2; $balance_eth * $eth_in_usd" | awk '{printf "%.2f", $0}')
#daily_usd=$(bc <<< "scale=2; $daily_eth * $eth_in_usd" | awk '{printf "%.2f", $0}')
#monthly_usd=$(bc <<< "scale=2; $monthly_eth * $eth_in_usd" | awk '{printf "%.2f", $0}')

balance_brl=$(bc <<< "scale=2; $balance_eth * $eth_in_brl" | awk '{printf "%.2f", $0}')
#daily_brl=$(bc <<< "scale=2; $daily_eth * $eth_in_brl" | awk '{printf "%.2f", $0}')
#monthly_brl=$(bc <<< "scale=2; $monthly_eth * $eth_in_brl" | awk '{printf "%.2f", $0}')


echo "1 ETH = $eth_in_usd USD / $eth_in_brl BRL"
echo ""
echo "Balance: $balance_eth ETH | $balance_usd USD | $balance_brl BRL"
#echo "Daily: $daily_eth ETH | $daily_usd USD | $daily_brl BRL"
#echo "Monthly: $monthly_eth ETH | $monthly_usd USD | $monthly_brl BRL"
echo ""
echo "Workers:"
echo "$workers"

import json
import requests
import time


# message to telegram
def send_to_telegram(message):

    apiToken = '5848672878:AAFwlb8YWP6koPDcqFh7NLwK9Hg0_e1oH9o'
    chatID = '5725627235'
    apiURL = f'https://api.telegram.org/bot{apiToken}/sendMessage'

    try:
        response = requests.post(apiURL, json={'chat_id': chatID, 'text': message})
        print(response.text)
    except Exception as e:
        print(e)


API = "https://e531-163-152-3-165.jp.ngrok.io/getArbitrage"
setting = 3
while True:
    message =""
    requestData = requests.get(API).json()
    """
{
    "percentage":"8.3%",
    "high": {
        "pairAddress":"liweutagwetaweraf / USDT/BNB",
        "baseToken":"BNBx",
        "chainId":"bsc",
        "dexId":"uniswap / binance",
        "priceUsd":"1234",
        "liquidity":"19240125",
        "ccxt_ticker":"BNB"
    },
    
    "low": {
        "pairAddress":"liweutagwetaweraf / USDT/BNB:230301",
        "baseToken":"BNBx / BNB",
        "chainId":"ethereum / binance",
        "dexId":"pancakeswap / binance",
        "priceUsd":"1234",
        "ccxt_ticker":"BNB"
    }
}
    percentage/
    high :baseToken Price USD dexID chain ID/
    low: baseToken Price USD dexID chain ID
    """
    
    for i in range(len(requestData)): 
       if(requestData[i]["percentage"] > setting):
            rank = i + 1
            percentage = requestData[i]["percentage"]
            pairAddress_h = requestData[i]["high"]["pairAddress"]
            baseToken_h = requestData[i]["high"]["baseToken"]
            PriceUSD_h = requestData[i]["high"]["priceUsd"]
            dexID_h = requestData[i]["high"]["dexId"]
            chainID_h = requestData[i]["high"]["chainId"]
            pairAddress_l = requestData[i]["low"]["pairAddress"]
            baseToken_l =requestData[i]["low"]["baseToken"]
            PriceUSD_l =requestData[i]["low"]["priceUsd"]
            dexID_l =requestData[i]["low"]["dexId"]
            chainID_l =requestData[i]["low"]["chainId"]
            message += f'rank:{rank}|Gap:{percentage}|high:{pairAddress_h},baseToken:{baseToken_h},PriceUSD:{PriceUSD_h},dexId:{dexID_h}|low:{pairAddress_h},baseToken:{baseToken_l},PriceUsd:{PriceUSD_l},dex Id:{dexID_l}\n\n'
    
    send_to_telegram(message)
    time.sleep(60)
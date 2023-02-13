import json
import requests
import time
# message to telegram
def send_to_telegram(message):
    apiToken = '6011641124:AAHvBD45VFq09AyfIM0PFAJspyU8mIechs0'
    chatID = '6011641124'
    apiURL = f'https://api.telegram.org/bot{apiToken}/sendMessage'
    try:
        response = requests.post(apiURL, json={'chat_id': chatID, 'text': message})
        print(response.text)
    except Exception as e:
        print(e)
API = "https://79ea-163-152-3-164.jp.ngrok.io/getArbitrage"
setting = 3
while True:
    message = "성공"
    requestData = requests.get(API)
    with open(requestData, 'r') as f:
        json_data = json.load(f)
    
    for i in range(len(f)):
       if(f[i]["percentage"] > setting):
            percentage = f[i]["percentage"]
            baseToken_h = f[i]["high"]["baseToken"]
            PriceUSD_h = f[i]["high"]["priceUsd"]
            dexID_h = f[i]["high"]["dexId"]
            chainID_h = f[i]["high"]["chainId"]
            baseToken_l =f[i]["low"]["baseToken"]
            PriceUSD_l =f[i]["low"]["priceUsd"]
            dexID_l =f[i]["low"]["dexId"]
            chainID_l =f[i]["low"]["chainId"]
            message += 'f{percentage}/ high :{baseToken_h} {PriceUSD_h} {dexID_h} {chainID_h}/ low: {baseToken_l} {PriceUSD_l} {dexID_l} {chainID_l}\n'
    send_to_telegram(message)
    time.sleep(60)
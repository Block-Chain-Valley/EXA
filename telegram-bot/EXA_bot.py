import requests
import telegram
import json
import schedule
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



while True:
    message = "성공"
    #with open('./data.json', 'r') as f:
    #    json_data = json.load(f)
    #for i in range(len(f)):
    #   if(f[i] > setting):
    #        message += f[i]
    #        message += "\n"
    send_to_telegram(message)
    time.sleep(60)
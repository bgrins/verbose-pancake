import sys
import os
from pprint import pprint
from selenium import webdriver

dirlist = os.listdir(os.environ['LAMBDA_TASK_ROOT'])
pprint(dirlist)
print(os.environ['PATH'])

driver = webdriver.Firefox(
  firefox_binary="./firefox/firefox"
)
driver.get("https://www.python.org")
print(driver.title)
print(driver.current_url)
driver.close()

def handler(event, context):
    return 'Hello from AWS Lambda using Python' + sys.version + '!'

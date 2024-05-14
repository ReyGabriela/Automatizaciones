from selenium import webdriver
from webdriver_manager.chrome import ChromeDriverManager

def before_scenario(context, scenario):
    context.browser = webdriver.Chrome(ChromeDriverManager().install())

def after_scenario(context, scenario):
    context.browser.quit()

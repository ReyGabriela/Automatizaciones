from behave import given, when, then
from selenium import webdriver
from selenium.webdriver.chrome.service import Service
from webdriver_manager.chrome import ChromeDriverManager
from selenium.webdriver.chrome.options import Options
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC


@given('I open the browser and navigate to the login page')
def step_impl(context):
    chrome_options = Options()
    service = Service(ChromeDriverManager().install())
    context.browser = webdriver.Chrome(service=service, options=chrome_options)
    context.browser.get(
        "https://login.live.com/login.srf?wa=wsignin1.0&rpsnv=16&ct=1698343510&rver=7.0.6738.0&wp=MBI_SSL&wreply=https%3A%2F%2Foutlook.live.com%2Fowa%2F%3Fnlp%3D1%26cobrandid%3Dab0455a0-8d03-46b9-b18b-df2f57b9e44c&id=292841&aadredir=1&CBCXT=out&lw=1&fl=dob%2Cflname%2Cwld&cobrandid=ab0455a0-8d03-46b9-b18b-df2f57b9e44c")

@when('I enter my email and password and log in')
def step_impl(context):
    WebDriverWait(context.browser, 20).until(EC.visibility_of_element_located((By.XPATH, "/html/body/div[1]/div/div[2]/div[1]/div/div/div/div[1]/div[2]/div/div/div/form/div[2]/div/div/input"))).click()
    context.browser.find_element(By.XPATH, "/html/body/div[1]/div/div[2]/div[1]/div/div/div/div[1]/div[2]/div/div/div/form/div[2]/div/div/input").send_keys("gabriela.rey@campusucc.edu.co")
    context.browser.find_element(By.XPATH, "/html/body/div[1]/div/div[2]/div[1]/div/div/div/div[1]/div[2]/div/div/div/form/div[4]/div/div/div/div/button").click()
    WebDriverWait(context.browser, 10).until(EC.visibility_of_element_located((By.ID, "i0118"))).click()
    context.browser.find_element(By.ID, "i0118").send_keys("UniUCC!!")
    context.browser.find_element(By.ID, "idSIButton9").click()
    WebDriverWait(context.browser, 10).until(EC.visibility_of_element_located((By.ID, "idBtn_Back"))).click()

@when('I compose a new email')
def step_impl(context):
    WebDriverWait(context.browser, 10).until(EC.visibility_of_element_located((By.XPATH, "/html/body/div[1]/div/div[2]/div/div[2]/div[1]/div/div[2]/div[1]/div/div/div[1]/div/div/div/div/div/div/div/div/div[1]/div/div/div/div[1]/div/div/span/button[1]/span/span[1]/span"))).click()
    WebDriverWait(context.browser, 20).until(EC.visibility_of_element_located((By.XPATH, "//*[@id='docking_InitVisiblePart_0']/div/div[3]/div[1]/div/div[4]/div/div/div[1]"))).send_keys("gabriela.rey@campusucc.edu.co")
    context.browser.find_element(By.XPATH, "/html/body/div[1]/div/div[2]/div/div[2]/div[2]/div/div/div/div[3]/div/div/div[3]/div[1]/div/div/div/div[3]/div[2]/div[2]/div/div/div/input").send_keys("asunto")
    context.browser.find_element(By.XPATH, "/html/body/div[1]/div/div[2]/div/div[2]/div[2]/div/div/div/div[3]/div/div/div[3]/div[1]/div/div/div/div[4]/div/div/div").send_keys("bodycorreooo")
    context.browser.find_element(By.XPATH, "/html/body/div[1]/div/div[2]/div/div[2]/div[2]/div/div/div/div[3]/div/div/div[3]/div[1]/div/div/div/div[2]/div[1]/div/span/button[1]/span").click()

@then('I verify the email was sent')
def step_impl(context):
    WebDriverWait(context.browser, 20).until(EC.visibility_of_element_located((By.XPATH, "/html/body/div[3]/div/div[1]/div/button[1]/div/div[2]")))
    # Aquí añadirías una verificación adicional si es necesario, como buscar un texto de confirmación.

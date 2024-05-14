from behave import given, when, then
from selenium import webdriver
from selenium.webdriver.common.by import By

@given('el navegador está abierto en la página del formulario')
def step_impl(context):
    context.browser = webdriver.Chrome() # Asegúrate de que el ChromeDriver esté en tu PATH
    context.browser.get("https://forms.office.com/Pages/ResponsePage.aspx?id=boM2jXVr5k26uV9LF3VCfzhlh2dL3U1Kj3Q574guY0NUN1pCNVAyVDhSSkRGTzVVSEtOVUkyWEMyMi4u")

@when('el usuario completa el formulario')
def step_impl(context):
    context.browser.find_element(By.XPATH, '/html/body/div/div/div[1]/div/div/div[3]/div/div/div[2]/div[1]/div[1]/div[2]/div/span/input').send_keys('gabriela.rey')
    context.browser.find_element(By.XPATH, '/html/body/div/div/div[1]/div/div/div[3]/div/div/div[2]/div[1]/div[2]/div[2]/div/span/input').send_keys('1007702937')
    context.browser.find_element(By.XPATH, '/html/body/div/div/div[1]/div/div/div[3]/div/div/div[2]/div[1]/div[3]/div[2]/div/span/input').send_keys('gabriela.rey@campusucc.edu.co')
    context.browser.find_element(By.XPATH, '/html/body/div/div/div[1]/div/div/div[3]/div/div/div[2]/div[1]/div[4]/div[2]/div/div/div[1]/div/label/span[1]/input').click()
    context.browser.find_element(By.XPATH, '/html/body/div/div/div[1]/div/div/div[3]/div/div/div[2]/div[1]/div[5]/div[2]/div/div/div[1]/div/label/span[1]/input').click()
    context.browser.find_element(By.XPATH, '/html/body/div/div/div[1]/div/div/div[3]/div/div/div[2]/div[1]/div[6]/div[2]/div/div/div[9]/div/label/span[1]/input').click()
    context.browser.find_element(By.XPATH, '/html/body/div/div/div[1]/div/div/div[3]/div/div/div[2]/div[1]/div[7]/div[2]/div/div/div[9]/div/label/span[1]/input').click()

    context.browser.find_element(By.XPATH, "//*[@id='question-list']/div[8]/div[2]/div/div/div[3]/span").click()
    context.browser.find_element(By.XPATH, "//*[@id='question-list']/div[9]/div[2]/div/div/div[4]/span").click()
    context.browser.find_element(By.XPATH, "/html/body/div/div/div[1]/div/div/div[3]/div/div/div[2]/div[1]/div[10]/div[2]/div/div/div[3]/span").click()
    context.browser.find_element(By.XPATH, "//*[@id='question-list']/div[11]/div[2]/div/div/div[3]/span").click()

    context.browser.find_element(By.XPATH, "//*[@id='question-list']/div[12]/div[2]/div/span/input").send_keys('Si')
    context.browser.find_element(By.XPATH, "//*[@id='question-list']/div[13]/div[2]/div/div/div[3]/span").click()

    context.browser.find_element(By.XPATH, "//*[@id='form-main-content1']/div/div/div[2]/div[2]/div/button").click()

@then('el navegador se cierra')
def step_impl(context):
    context.browser.quit()


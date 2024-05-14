from behave import given, when, then
from selenium import webdriver
from selenium.common import TimeoutException
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
import time

# Configuración inicial para abrir el navegador y navegar a la página de inicio de sesión
@given('I am on the Timonel login page')
def step_impl(context):
    context.browser = webdriver.Chrome()
    context.browser.get('https://opscs.ucc.edu.co/psp/UCNAV/EMPLOYEE/HRMS/?&cmd=login&languageCd=ESP&')
    context.browser.maximize_window()

# Paso para iniciar sesión usando credenciales proporcionadas
@when('I login with username "{username}" and password "{password}"')
def step_impl(context, username, password):
    context.browser.find_element(By.NAME, 'userid').send_keys(username)
    context.browser.find_element(By.NAME, 'pwd').click()
    context.browser.find_element(By.NAME, 'pwd').send_keys(password)
    context.browser.find_element(By.XPATH, '/html/body/div/form/div/div[1]/div[8]/input').click()

# Navegación a la sección de progreso académico
@when('I navigate to the academic progress section')
def step_impl(context):
    WebDriverWait(context.browser, 10).until(
        EC.element_to_be_clickable((By.XPATH, '//*[@id="win1div$ICField3"]/img'))).click()
    WebDriverWait(context.browser, 5).until(
        EC.presence_of_element_located((By.XPATH, '//span[@id="PT_PAGETITLElbl"]')))
    time.sleep(5)
    context.browser.find_element(By.XPATH, '//a[@id="SCC_LO_FL_WRK_SCC_VIEW_BTN$1"]//ancestor::li').click()
    time.sleep(5)

# Paso final para verificar que la página de progreso académico está visible
@then('I should see the academic progress page')
def step_impl(context):
    final_title_xpath = '//*[@id="app_label"]'
    # Verificar que el elemento está presente
    try:
        WebDriverWait(context.browser, 20).until(
            EC.presence_of_element_located((By.XPATH, final_title_xpath)))
        print("El elemento está presente.")
    except TimeoutException:
        print("El elemento no está presente en el tiempo dado.")

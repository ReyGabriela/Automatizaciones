from behave import given, when, then

@given('Abro la página del campus UCC')
def step_impl(context):
    context.browser.visit('https://campusvirtual.ucc.edu.co/d2l/loginh/?target=%2fd2l%2fhome')

@when('Ingreso credenciales válidas')
def step_impl(context):
    context.browser.find_by_id('Username').fill('gabriela.rey')
    context.browser.find_by_id('Password').fill('Abcd1234!')
    context.browser.find_by_xpath('//div[@class="content_frame"]/form/input[3]').click()

@then('Debo haber logeado exitosamente')
def step_impl(context):
    assert context.browser.is_element_present_by_xpath('//header/nav/d2l-navigation/d2l-navigation-main-footer/div/div/div[1]/a', wait_time=10), "El login no fue exitoso."

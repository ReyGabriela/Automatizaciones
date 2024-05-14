from behave import given, when, then
from splinter import Browser
import time

@given('I open the browser and navigate to the Exito page')
def step_impl(context):
    if not hasattr(context, 'browser'):
        context.browser = Browser('chrome', headless=False)
    context.browser.visit("https://www.exito.com/")
    context.browser.driver.maximize_window()


@when('I search for a product')
def step_impl(context):
    search_input_xpath = '/html/body/div[1]/header/section/div/div[1]/div[2]/form/input'
    search_button_xpath = '/html/body/div[1]/header/section/div/div[1]/div[2]/form/button/span'
    product_button_xpath = '//*[@id="__next"]/main/section[3]/div/div[2]/div[2]/div[2]/ul/li[1]/article/div/div[3]/button'

    context.browser.is_element_present_by_xpath(search_input_xpath, wait_time=10)
    context.browser.find_by_xpath(search_input_xpath).click()
    context.browser.find_by_xpath(search_input_xpath).fill('Jabon')
    context.browser.is_element_present_by_xpath(search_button_xpath, wait_time=10)
    context.browser.find_by_xpath(search_button_xpath).click()
    context.browser.is_element_present_by_xpath(product_button_xpath, wait_time=10)
    context.browser.execute_script("window.scrollBy(0, 500)")
    context.browser.find_by_xpath(product_button_xpath).click()


@when('I select pickup information')
def step_impl(context):
    pickup_input_xpath = '//*[@id="react-select-2-input"]'
    pickup_location_xpath = '//*[@id="react-select-3-input"]'
    confirm_button_xpath = '/html/body/div[5]/div[2]/div/div/div[2]/div/div/div/form/div[3]/button'

    context.browser.is_element_present_by_xpath(pickup_input_xpath, wait_time=10)
    context.browser.find_by_xpath(pickup_input_xpath).click()
    context.browser.find_by_xpath(pickup_input_xpath).fill('Villavicencio')
    context.browser.find_by_xpath(pickup_input_xpath).type('\ue007')  # Press ENTER
    context.browser.is_element_present_by_xpath(pickup_location_xpath, wait_time=10)
    context.browser.find_by_xpath(pickup_location_xpath).click()
    context.browser.find_by_xpath(pickup_location_xpath).fill('Exito Sabana Villavicencio')
    context.browser.find_by_xpath(pickup_location_xpath).type('\ue007')  # Press ENTER
##    context.browser.is_element_present_by_xpath(confirm_button_xpath, wait_time=10)
##    context.browser.find_by_xpath(confirm_button_xpath).click()
    time.sleep(7)

@when('I add the product and initiate the purchase process')
def step_impl(context):
    add_to_cart_xpath = '//*[@id="__next"]/main/section[3]/div/div[2]/div[2]/div[2]/ul/li[1]/article/div/div[3]/button'
    go_to_cart_xpath = '//*[@id="__next"]/header/section/div/div[2]/div[2]/button/div/div'
    proceed_to_checkout_xpath = '//section[@class="exito-checkout-io-0-x-summaryPayContainer"]/div[2]/button'

    context.browser.is_element_present_by_xpath(add_to_cart_xpath, wait_time=10)
    context.browser.find_by_xpath(add_to_cart_xpath).click()
    context.browser.is_element_present_by_xpath(go_to_cart_xpath, wait_time=10)
    context.browser.find_by_xpath(go_to_cart_xpath).click()
    context.browser.is_element_present_by_xpath(proceed_to_checkout_xpath, wait_time=10)
    context.browser.find_by_xpath(proceed_to_checkout_xpath).click()


@then('I finalize the purchase')
def step_impl(context):
    email_input_xpath = '//div[@class="exito-checkout-io-0-x-preLoginTab"]/div/form/div[4]/input'

    # Esperar a que el campo de correo electrónico sea visible y esté listo para interactuar
    email_field = context.browser.find_by_xpath(email_input_xpath).first
    if email_field.visible:
        email_field.click()  # Activar el campo de entrada
        email_field.fill('gabrielareyrincon@gmail.com')  # Llenar el campo
        email_field.type('\ue007')  # Presionar ENTER

    # Asumiendo que querías interactuar con un botón, no con texto
    check_button_xpath = '//*[@id="render-store.custom.checkout-io"]/div/div[1]/div/div[1]/div/div/div/div[2]/div[3]/div[1]/div[2]/div/article/div/div/div[2]/div/button'
    if context.browser.is_element_present_by_xpath(check_button_xpath, wait_time=10):
        check_button = context.browser.find_by_xpath(check_button_xpath).first
        check_button.click()  # Hacer clic en el botón

    # Similar para el botón de continuar
    continue_button_xpath = '//*[@id="render-store.custom.checkout-io"]/div/div[1]/div/div[1]/div/div/div/div[2]/div[3]/section/div[2]/button/div/span[2]'
    if context.browser.is_element_present_by_xpath(continue_button_xpath, wait_time=10):
        continue_button = context.browser.find_by_xpath(continue_button_xpath).first
        continue_button.click()  # Hacer clic en el botón de continuar

    # Esperar a que aparezca el título del formulario de pedido final
    final_title_xpath = '//*[@id="orderform-title"]'
    context.browser.is_element_present_by_xpath(final_title_xpath, wait_time=10)


@then('I close the browser')
def step_impl(context):
    context.browser.quit()

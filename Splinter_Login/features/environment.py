from splinter import Browser

def before_all(context):
    # Opcionalmente puedes configurar cosas antes de que empiecen todos los tests
    pass

def before_scenario(context, scenario):
    # Aquí se inicializa el navegador antes de cada escenario
    context.browser = Browser('chrome')  # O el navegador de tu preferencia

def after_scenario(context, scenario):
    # Este hook asegura que el navegador se cierre después de cada escenario
    if hasattr(context, "browser"):
        context.browser.quit()

def after_all(context):
    # Opcionalmente puedes agregar código que se ejecute después de todos los tests
    pass

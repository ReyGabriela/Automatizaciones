*** Settings ***
Library  SeleniumLibrary
Library  driver_manager.py

*** Variables ***
${browser}  chrome
${url}  https://opscs.ucc.edu.co/psp/UCNAV/EMPLOYEE/HRMS/?&cmd=login&languageCd=ESP&

*** Test Cases ***
Iniciar Sesión en timonel y revisar pensum
    Abrir Navegador en Modo Maximizado
    Ingresar a timonel
    Buscar progreso academico
    Cerrar Navegador

*** Keywords ***
Abrir Navegador en Modo Maximizado
    ${driver_path}=    Get Driver Path
    ${chrome_options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${chrome_options}    add_argument    --start-maximized
    Open Browser    ${URL}    browser=${BROWSER}    options=${chrome_options}    executable_path=${driver_path}


Ingresar a timonel
    [Documentation]    Como usuario, quiero poder iniciar sesión en el Campus Virtual de la Universidad para acceder a los recursos y cursos.
    Input Text    name:userid    gabriela.rey
    Click Element    name:pwd
    Input Text    name:pwd    Abcd1234!
    Click Element    xpath:/html/body/div/form/div/div[1]/div[8]/input

Buscar progreso academico
    [Documentation]    Como usuario, quiero poder iniciar sesión en el Campus Virtual de la Universidad para acceder a los recursos y cursos.
    Click Element    xpath://*[@id="PTNUI_LAND_REC14$0_row_0"]

        # Aquí se espera explícitamente hasta que el elemento esté visible antes de proceder
    Wait Until Element Is Visible    //*[@id="PT_PAGETITLElbl"]    10s

        # Luego se espera explícitamente a que otro elemento esté presente en la página
    Wait Until Element Is Enabled    xpath://*[@id='SCC_LO_FL_WRK_SCC_VIEW_BTN$1']//ancestor::li    10s

        # Una vez que se confirma que el elemento está presente, se procede a hacer clic en él
    #Click Element    xpath://*[@id='SCC_LO_FL_WRK_SCC_VIEW_BTN$1']//ancestor::li
    Execute JavaScript    var xpath = "//*[@id='SCC_LO_FL_WRK_SCC_VIEW_BTN$1']//ancestor::li"; var element = document.evaluate(xpath, document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue; if (element) element.click();

    Wait Until Element Is Visible    //*[@id="app_label"]     5s

Cerrar Navegador
    Close browser
*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${browser}  chrome
${url}  https://www.exito.com/

*** Test Cases ***
Realizar una compra por la pagina del Exito
    Abrir Navegador
    Buscar un producto
    Seleccionar informacion recoger
    Agregar producto
    Iniciar proceso compra
    Cerrar Navegador

*** Keywords ***
Abrir Navegador
    Open Browser    ${url}    ${browser}
    Maximize Browser Window

Buscar un producto
    [Documentation]    Como usuario, quiero poder buscar un producto en la pagina del exito
    Input Text    xpath:/html/body/div[1]/header/section/div/div[1]/div[2]/form/input    Jabon
    Click Element    xpath:/html/body/div[1]/header/section/div/div[1]/div[2]/form/button/span
    Wait Until Element Is Visible    xpath://*[@id="__next"]/main/section[3]/div/div[2]/div[2]/div[2]/ul/li[1]/article/div/div[3]/button   10
    Execute Javascript    window.scrollBy(0, 500)
    Click Element    xpath=//body[@class='exito-theme']/div[1]/main/section[3]/div/div[2]/div[2]/div[2]/ul/li/article/div[1]/div[3]/button[1]/span[1]

Seleccionar informacion recoger
    [Documentation]    Como usuario, espero el pop up y lleno la informacion de envio para mi compra
    Wait Until Element is Visible   xpath://*[@id="react-select-2-input"]   10
    Click Element   xpath://*[@id="react-select-2-input"]
    Input Text  xpath://*[@id="react-select-2-input"]   Villavicencio
    Press Keys    xpath://*[@id="react-select-2-input"]    ENTER
    Wait Until Element is Enabled    xpath://*[@id="react-select-3-input"]  10
    Click Element   xpath://*[@id="react-select-3-input"]
    Input Text  xpath://*[@id="react-select-3-input"]   Exito Sabana Villavicencio
    Press Keys    xpath://*[@id="react-select-3-input"]    ENTER
    Wait Until Element is Enabled   xpath:/html/body/div[4]/div[2]/div/div/div[2]/div/div/div/form/div[3]/button    100
    Click Element   xpath:/html/body/div[4]/div[2]/div/div/div[2]/div/div/div/form/div[3]/button
    Sleep   5s
    Wait Until Element is Visible   xpath=//body[@class='exito-theme']/div[1]/main/section[3]/div/div[2]/div[2]/div[2]/ul/li/article/div[1]/div[3]/button[1]/span[1]    10

Agregar producto
    Wait Until Element is Visible   xpath=//*[@id="__next"]/main/section[3]/div/div[2]/div[2]/div[2]/ul/li[1]/article/div/div[3]/button    10
    Click Element   xpath=//*[@id="__next"]/main/section[3]/div/div[2]/div[2]/div[2]/ul/li[1]/article/div/div[3]/button
    Click Element   xpath=//*[@id="__next"]/header/section/div/div[2]/div[2]/button/div/div
    Wait Until Element is Enabled   xpath=//section[@class='exito-checkout-io-0-x-summaryPayContainer']/div[2]/button  100

Iniciar proceso compra
    Wait Until Element is Enabled   xpath://section[@class='exito-checkout-io-0-x-summaryPayContainer']/div[2]/button  10
    Click Element   xpath://section[@class='exito-checkout-io-0-x-summaryPayContainer']/div[2]/button
    Wait Until Element is Visible   xpath://div[@class='exito-checkout-io-0-x-preLoginTab']/div/form/div[4]/input   10
    Click Element   xpath://div[@class='exito-checkout-io-0-x-preLoginTab']/div/form/div[4]/input
    Input Text    xpath://div[@class='exito-checkout-io-0-x-preLoginTab']/div/form/div[4]/input     gabrielareyrincon@gmail.com
    Press Keys    xpath://div[@class='exito-checkout-io-0-x-preLoginTab']/div/form/div[4]/input    ENTER
    Wait Until Element is Enabled   xpath://*[@class="exito-checkout-io-0-x-preLoginContainer"]/div/div/form/button/i   10
#    Click Element   xpath://*[@class="exito-checkout-io-0-x-preLoginContainer"]/div/div/form/button/i
    Wait Until Element is Enabled   xpath://*[@id="render-store.custom.checkout-io"]/div/div[1]/div/div[1]/div/div/div/div[2]/div[3]/div[1]/div[2]/div/article/div/div/div[2]/div/button    10
    Click Element   xpath://*[@id="render-store.custom.checkout-io"]/div/div[1]/div/div[1]/div/div/div/div[2]/div[3]/div[1]/div[2]/div/article/div/div/div[2]/div/button
    Wait Until Element is Enabled   xpath://*[@id="render-store.custom.checkout-io"]/div/div[1]/div/div[1]/div/div/div/div[2]/div[3]/section/div[2]/button/div/span[2]     1000
    Click Element   xpath://*[@id="render-store.custom.checkout-io"]/div/div[1]/div/div[1]/div/div/div/div[2]/div[3]/section/div[2]/button/div/span[2]
    Wait Until Element is Visible   xpath://*[@id="btn-go-to-payment"]   100
    Execute Javascript    window.scrollBy(0, 500)

Cerrar navegador
    Close browser



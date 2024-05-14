*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${browser}  chrome
${url}  https://login.live.com/login.srf?wa=wsignin1.0&rpsnv=16&ct=1698343510&rver=7.0.6738.0&wp=MBI_SSL&wreply=https%3a%2f%2foutlook.live.com%2fowa%2f%3fnlp%3d1%26cobrandid%3dab0455a0-8d03-46b9-b18b-df2f57b9e44c%26RpsCsrfState%3dc692b4c1-7f62-50cd-84db-4b741b778b7e&id=292841&aadredir=1&CBCXT=out&lw=1&fl=dob%2cflname%2cwld&cobrandid=ab0455a0-8d03-46b9-b18b-df2f57b9e44c

*** Test Cases ***
Iniciar correo
    Abrir Navegador
    Ingresar al Correo
    Ingresar contraseña
    Enviar correo
    Revisar envio correo

*** Keywords ***
Abrir Navegador
    Open Browser    ${url}    ${browser}

Ingresar al Correo


    [Documentation]    Como usuario, quiero enviar un correo de outlook de mi correo institucional.
    Wait Until Element Is Visible    xpath=/html/body/div[1]/div/div[2]/div[1]/div/div/div/div[1]/div[2]/div/div/div/form/div[2]/div/div/input    20
    Click Element    xpath=/html/body/div[1]/div/div[2]/div[1]/div/div/div/div[1]/div[2]/div/div/div/form/div[2]/div/div/input
    Input Text      xpath=/html/body/div[1]/div/div[2]/div[1]/div/div/div/div[1]/div[2]/div/div/div/form/div[2]/div/div/input    gabriela.rey@campusucc.edu.co
    Click Element    xpath=/html/body/div[1]/div/div[2]/div[1]/div/div/div/div[1]/div[2]/div/div/div/form/div[4]/div/div/div/div/button

Ingresar contraseña
    [Documentation]    Como usuario, quiero enviar un correo de outlook de mi correo institucional.
    Wait Until Element Is Visible    id=i0118   10
    Click Element    id=i0118
    Input Text      id=i0118    UniUCC!!
    Wait Until Element Is Visible    id=idSIButton9   10
    Click Element    id=idSIButton9
    Wait Until Element Is Visible    xpath=/html/body/div/form/div/div/div[2]/div[2]/div/div/div/div/div/div[3]/div/div[2]/div/div[3]/div[2]/div/div/div[1]/input   10
    Click Element    xpath=/html/body/div/form/div/div/div[2]/div[2]/div/div/div/div/div/div[3]/div/div[2]/div/div[3]/div[2]/div/div/div[1]/input

Enviar correo
    [Documentation]    Como usuario, quiero enviar un correo de outlook de mi correo institucional.
    Wait Until Element Is Visible    xpath=/html/body/div[1]/div/div[2]/div/div[2]/div[1]/div/div[2]/div[1]/div/div/div[1]/div/div/div/div/div/div/div/div/div[1]/div/div/div/div[1]/div/div/span/button[1]/span/span[1]/span    10
    Click Element    xpath=/html/body/div[1]/div/div[2]/div/div[2]/div[1]/div/div[2]/div[1]/div/div/div[1]/div/div/div/div/div/div/div/div/div[1]/div/div/div/div[1]/div/div/span/button[1]/span/span[1]/span
    Wait Until Element Is Visible   //*[@id="docking_InitVisiblePart_0"]/div/div[3]/div[1]/div/div[4]/div/div/div[1]    20
    Click Element    xpath=//*[@id="docking_InitVisiblePart_0"]/div/div[3]/div[1]/div/div[4]/div/div/div[1]
    Input Text      xpath=//*[@id="docking_InitVisiblePart_0"]/div/div[3]/div[1]/div/div[4]/div/div/div[1]    gabriela.rey@campusucc.edu.co

    Click Element    xpath=/html/body/div[1]/div/div[2]/div/div[2]/div[2]/div/div/div/div[3]/div/div/div[3]/div[1]/div/div/div/div[3]/div[2]/div[2]/div/div/div/input
    Input Text      xpath=/html/body/div[1]/div/div[2]/div/div[2]/div[2]/div/div/div/div[3]/div/div/div[3]/div[1]/div/div/div/div[3]/div[2]/div[2]/div/div/div/input  asunto
    Click Element    xpath=/html/body/div[1]/div/div[2]/div/div[2]/div[2]/div/div/div/div[3]/div/div/div[3]/div[1]/div/div/div/div[4]/div/div/div/div
    Input Text  xpath=/html/body/div[1]/div/div[2]/div/div[2]/div[2]/div/div/div/div[3]/div/div/div[3]/div[1]/div/div/div/div[4]/div/div/div    bodycorreooo

    Click Element    xpath=/html/body/div[1]/div/div[2]/div/div[2]/div[2]/div/div/div/div[3]/div/div/div[3]/div[1]/div/div/div/div[2]/div[1]/div/span/button[1]/span



Revisar envio correo
    Wait Until Element Is Visible   xpath=/html/body/div[3]/div/div[1]/div/button[1]/div/div[2]     20
    Close Browser
Feature: Completar el formulario en Google Forms

  Scenario: Usuario completa el formulario de Google Forms con éxito
    Given el navegador está abierto en la página del formulario
    When el usuario completa el formulario
    Then el navegador se cierra

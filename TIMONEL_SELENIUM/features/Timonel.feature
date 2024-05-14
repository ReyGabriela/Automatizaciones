Feature: Iniciar sesión en Timonel y revisar pensum
  Como usuario quiero poder iniciar sesión en el Campus Virtual de la Universidad para acceder a los recursos y cursos y verificar mi progreso académico.

  Scenario: Iniciar sesión y revisar el progreso académico
    Given I am on the Timonel login page
    When I login with username "gabriela.rey" and password "Abcd1234!"
    When I navigate to the academic progress section
    Then I should see the academic progress page

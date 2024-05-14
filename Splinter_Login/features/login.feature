Feature: Login al Campus UCC

  Scenario: Login exitoso en la página del campus UCC
    Given Abro la página del campus UCC
    When Ingreso credenciales válidas
    Then Debo haber logeado exitosamente

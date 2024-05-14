Feature: Realizar una compra por la pagina del Exito

  As a website visitor
  I want to purchase a product from the Exito website
  So that I can receive it at my preferred location

  Scenario: Realizar una compra exitosa en la página del Éxito
    Given I open the browser and navigate to the Exito page
    When I search for a product
    And I select pickup information
    And I add the product and initiate the purchase process
    Then I finalize the purchase
    And I close the browser

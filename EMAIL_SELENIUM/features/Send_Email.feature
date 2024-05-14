Feature: Send email through Outlook

  Scenario: User sends an email through Outlook
    Given I open the browser and navigate to the login page
    When I enter my email and password and log in
    And I compose a new email
    Then I verify the email was sent

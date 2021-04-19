# language: en

Feature: Division
  In order to avoid errors the Teller must be able 
  to divide numbers

  Example: foobar
  
  Scenario: Regular numbers
    Given I have entered the Number 3 in the calculator
    And I press the "Division" Key
    And I have entered the Number 2 in the calculator
    When I press the "Equal" Key
    Then on the screen should be displayed the result 1,5
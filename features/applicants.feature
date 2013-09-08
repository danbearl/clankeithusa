Feature: Applicants
  Scenario: An an applicant fills out the membership application
    Given I am on the home page
    When I follow "Apply For Membership"
    And I fill in the following:
      | E-Mail          | dan@example.com                        |
      | First Name      | Dan                                    |
      | Last Name       | Bearl                                  |
      | Billing Address | 1234 Fun Street, Happy Town, USA 12345 |
      | Card Number     | 6767676767676767                       |
      | Security Code   | 123                                    |
    And I press "Submit Application"
    Then I should see "Thank you for your application. We will review it promptly and contact be in contact with you soon."

Feature: Applicants
  Scenario: An an applicant fills out the membership application
    Given I am on the home page
    When I follow "Apply For Membership"
    And I fill in the following:
      | applicant_email                 | dan@example.com  |
      | applicant_applicant_first_name  | Dan              |
      | applicant_applicant_last_name   | Bearl            |
      | Street                          | 1234 Fun Street  |
      | City                            | Happy Town       |
      | State                           | USA              |
      | Zip                             | 12345            |
      | card_number                     | 4242424242424242 |
      | card_code                       | 123              |
      | applicant_applicant_birth_place | Happy Town, USA  |
      | applicant_father_first_name     | Bob              |
      | applicant_father_last_name      | Delver           |
      | applicant_father_birth_place    | Happy Town, USA  |
      | applicant_mother_first_name     | Jane             |
      | applicant_mother_last_name      | Delver           |
      | applicant_mother_birth_place    | Happy Town, USA  |
    And I select the following:
      | card_month | 1 - January |
      | card_year  | 2028        |
    And I press "Submit Application"
    Then I should see "Thank you for your applicantion. We will review it promptly and be in contact with you soon."

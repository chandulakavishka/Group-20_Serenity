Feature: Get Book Details from the Library

  Scenario: Get all books
    When I request all books
    Then the response code should be number 200
    And the response should contain a list of books

  Scenario: Get all books when the database is empty
    When I request all books
    Then the response code should be number 200
    And the response should contain an empty list of books

  Scenario: Get a book by valid ID
    When I request a book with id 1
    Then the response code should be number 200
    And the response should contain the book details with id 1

  Scenario: Get a book with invalid ID
    When I request a book with an invalid id 99999
    Then the response code should be 404 for invalidate book id
    And the response should contain an error message "Book not found"

  Scenario: Get a book with invalid credentials
#    Given I have invalid credentials
    When I request a book with id 1 using invalid credentials
    Then the response code should be number 401 invalidate credential
    And the response should contain an error message for invalid credential ""
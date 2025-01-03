Feature: Add a Book in the Library

  Scenario: Add a book with valid details
    When I add a book with title "The Book New" and author "The Author New"
    Then the response status code should be 201
    And the response should contain the added book details with title "The Book New" and author "The Author New"

  Scenario: Add a book with invalid credentials
    Given I have invalid username and password
    When I add a book with id 5 title "The Book Anonymous" and author "The Author Anonymous" using invalid credentials
    Then the response status code should be 401

  Scenario: Add a book with missing author field
    When I add a book with title "The Book Without Author" and no author
    Then the response status code should be 400
    And the response should contain error "Author is required"

  Scenario: Add a book with existing data
    Given the library already contains a book with title "Existing Book" and author "Existing Author"
    When I add a book with title "Existing Book" and author "Existing Author"
    Then the response status code should be 409
    And the response should contain error "Book Already Exists"

  Scenario: Add a book with null id and empty title and author
    When I add a book with id null, empty title "", and empty author ""
    Then the response status code should be 400
    And the response should contain error "Title and Author are required"
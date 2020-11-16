Feature: Admin user functionalities

  Scenario: As an admin user, I want to login into the inteligencia industiral website

    Given I am on the login page
    When I login with 'admin@admin.com' and '12345678'
    Then I should be able to access the admin page and see this 'Estatísticas de Uso'

    Scenario: As an admin user, I want to access Gerais functionaly

    Given I am on the login page
    When I login with 'admin@admin.com' and '12345678'
    And I click on the Gerais button
    Then I should be able to access the admin functionality and see this Estatísticas Gerais

    Scenario: As an admin user, I want to access Especificas functionaly

    Given I am on the login page
    When I login with 'admin@admin.com' and '12345678'
    And I click on the Especificas button
    Then I should be able to access the admin functionality and see this Estatísticas Específicas

    Scenario: As an admin user, I want to access Por Usuário functionaly

    Given I am on the login page
    When I login with 'admin@admin.com' and '12345678'
    And I click on the Por Usuário button
    Then I should be able to access the admin functionality and see this Estatísticas por Usuário

    Scenario: As an admin user, I want to access Posts functionaly

    Given I am on the login page
    When I login with 'admin@admin.com' and '12345678'
    And I click on the Posts button
    Then I should be able to access the admin functionality and see this Posts Cadastrados
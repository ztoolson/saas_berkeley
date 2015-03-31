Feature: prevent cheating

  As a game designer
  To prevent cheating
  I want to make sure winning and losing cannot be faked

Background: I am in the middle of a game

  Given I start a new game with word "cheat"

Scenario: cannot fake winning

  When I try to go to the URL "/win"
  Then I should be on the show page

Scenario: cannot fake losing

  When I try to go to the URL "/lose"
  Then I should be on the show page


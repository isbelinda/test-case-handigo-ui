*** Settings ***
Documentation    Suite description
#Library         Selenium2Library
Resource        ./handigo_ui_keyword.robot

Suite Setup     User is open dashboard


*** Test Cases ***
#[1] User can login to Maow hotel
#    Given Open login page
#    When User has username is 'testhotel@mail.com' and password is '1234' to Login
#    And Dashboard page is open
#    Then Close Browser After Finish

[2] User click hotel setting menu
    Given User click menu 'setting-hotel-menu' page
    When Setting hotel is open
    Then User click menu 'dashboard-menu' page


[3] User send broadcast Banana cake for room A10
    Given User click menu 'broadcast-menu' page
    When Broadcast is open
    And User select broadcast 'send-broadcast-117'
    And User select room for broadcast 'roomSelectionItem-80'
    Then User is submit button 'submit-broadcast-room'


[3] User send broadcast Mx Coffee for room A1, A10
    Given User select broadcast 'send-broadcast-98'
    When User select room for broadcast 'roomSelectionItem-80'
    And User select room for broadcast 'roomSelectionItem-71'
    Then User is submit button 'submit-broadcast-room'


[4] User send broadcast Test image for all room
    Given User select broadcast 'send-broadcast-86'
    When User select room for broadcast 'room-select-all'
    Then User is submit button 'submit-broadcast-room'

[5] User has edit broadcast
    Given User click menu 'broadcast-menu' page
    When User select item for edit 'edit-broadcast-121'
    And User is open form broadcast page
    And User can edit info 'test from Robot' and 'The description form robot test' in form
    And User select tab 'contact' in menu
    And User can edit contact service time: '10.00am - 08.00pm', phone number: '0998889999', website: 'http://test.com', email: 'test@test.com', address: 'Milan, Italy' in form
    Then User is submit button 'submit-contact-form'

[6] User has edit broadcast choose Korean language
    Given User select language 'lang-ko'
    When User can edit contact service time: '오전 10시 - 오후 8시', phone number: '0998889999', website: 'http://test.com', email: 'test@test.com', address: '이탈리아 밀라노' in form
    And User select tab 'info' in menu
    Then User can edit info '로봇 테스트' and '설명 형식 로봇 테스트' in form
    Then User is submit button 'submit-broadcast-form'


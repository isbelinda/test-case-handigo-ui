*** Settings ***
Documentation    Suite description
Library         Selenium2Library



*** Variables ***
#${BASE_URL}         https://servicetest.handigo.run
${BASE_URL}         http://localhost:3000
${DELAY}            0.5
${DELAY_DIALOG}     0.20
${DELAY_CALL_API}   1
${BROWSER}          chrome
${USERNAME}         testhotel@mail.com
${PASSWORD}         1234



*** Keywords ***
Open login page
    open browser    ${BASE_URL}  ${BROWSER}     ${DELAY}

User has username is '${username}' and password is '${password}' to Login
    input text          name=email          ${username}
    input password      name=password       ${password}
    click element       css=label.checkbox-custom-label
    click element       id=submit-login

User is open dashboard
    open browser        ${BASE_URL}         ${BROWSER}          ${DELAY}
    input text          name=email          ${USERNAME}
    input password      name=password       ${PASSWORD}
    click element       css=label.checkbox-custom-label
    click element       id=submit-login
    wait until element is visible           css=div.main-layout
    element should be visible               css=div.main-layout
    set selenium speed  ${DELAY}

Dashboard page is open
    wait until element is visible           css=div.main-layout
    element should be visible               css=div.main-layout

User click menu '${id_menu}' page
    click link          id=${id_menu}


Setting hotel is open
    wait until element is visible           name=setting-hotel-form
    element should be visible               name=setting-hotel-form

Broadcast is open
    wait until element is visible           id=broadcast-page
    element should be visible               id=broadcast-page
    set selenium speed                      ${DELAY_DIALOG}

User select broadcast '${broadcast_id}'
    click button        id=${broadcast_id}
    set selenium speed  ${DELAY_DIALOG}

User is submit button '${button_id}'
    click button        id=${button_id}
    set selenium speed  ${DELAY_CALL_API}

User select room for broadcast '${room_id}'
    click element       id=${room_id}

User select item for edit '${item_id}'
    click element       id=${item_id}


User is open form broadcast page
    wait until element is visible           id=broadcast-form-page
    element should be visible               id=broadcast-form-page

User select tab '${menu}' in menu
    click element       id=${menu}

User can edit info '${title}' and '${description}' in form
    input text          name=title          ${title}
    input text          name=description    ${description}

User can edit contact service time: '${open_hours}', phone number: '${phone}', website: '${website}', email: '${email}', address: '${address}' in form
    input text          name=open_hours     ${open_hours}
    input text          name=phone          ${phone}
    input text          name=email          ${email}
    input text          name=website        ${website}
    input text          name=address        ${address}

User can search location '${location}'
    input text          name=search-location-input      ${location}

User select language '${language_code}'
    click element       id=${language_code}

User should see result is success
    wait until element is visible           css=div.toastify-content--success

Close Browser After Finish
    set selenium speed  ${DELAY}
    click element       css=div.logout
    close browser

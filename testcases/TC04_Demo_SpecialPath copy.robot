*** Settings ***
Library        RequestsLibrary
Library        JSONLibrary
Library        Collections
Library        String

*** Variables ***
${URL}                              https://fakestoreapi.com/
${id-expected}                               7
${email-expected}                            miriam@gmail.com
${username-expected}                         snyder
${password-expected}                         f238&@*$
${firstname-expected}                        miriam
${lastname-expected}                         snyder
${phone-expected}                            1-123-943-0563

*** Test Cases ***
TC01_SpecialPath 

    [Documentation]   ตัวอย่างแบบถูก
    [Tags]            success
    Create Session    Get_User        ${URL}      verify=true   
    ${response}       GET On Session    Get_User    /users/7    
    Should Be Equal As Integers    ${response.status_code}    200
    Log To Console    Step_GET_User_Success
    Log TO Console    ${response}

    #เป็นวิธีแบบเก่าไม่นิยม
    ${json_str}    Convert String To Json     ${response.content}
    ${id-get}      Get Value From Json        ${json_str}            $.id
    ${id-get}      Convert To String          ${id-get}[0]
    Should Be Equal     ${id-get}             ${id-expected}

    #เป็นวิธีแบบใหม่(นิยมใช้)
    ${id-get}     Set Variable               ${response.json()}[id]
    Should Be Equal As Integers              ${id-get}                 ${id-expected}

    ${email-get}     Set Variable            ${response.json()}[email]
    Should Be Equal As Strings               ${email-get}              ${email-expected}

    ${username-get}     Set Variable         ${response.json()}[username]
    Should Be Equal As Strings               ${username-get}           ${username-expected}
    
    ${password-get}     Set Variable         ${response.json()}[password]
    Should Be Equal As Strings               ${password-get}           ${password-expected}

    ${firstname-get}     Set Variable        ${response.json()}[name][firstname]
    Should Be Equal As Strings               ${firstname-get}          ${firstname-expected}

    ${lastname-get}     Set Variable         ${response.json()}[name][lastname]
    Should Be Equal As Strings               ${lastname-get}           ${lastname-expected}

    ${phone-get}     Set Variable            ${response.json()}[phone]
    Should Be Equal As Strings               ${phone-get}              ${phone-expected}

    #ตัวอย่างเสริม การบวกเลข และ set ตัวแปร
TC02_SpecialPath 
    [Tags]     number
    ${New-id-expected}      Evaluate    ${id-expected} + 3
    ${New-id-expected02}    Evaluate    (${id-expected}+3) * 2

    ${New-id-expected}      Set Variable    BRAVO${id-expected}
    ${New-id-expected02}    Set Variable    BRAVO${id-expected}

    Log TO Console    ${New-id-expected}
    Log TO Console    ${New-id-expected02}





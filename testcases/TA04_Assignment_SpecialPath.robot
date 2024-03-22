*** Settings ***
Library        RequestsLibrary
Library        JSONLibrary
Library        Collections
Library        String

*** Variables ***
${URL}                              https://fakestoreapi.com/
${id-expected}                               8
${email-expected}                            william@gmail.com
${username-expected}                         hopkins
${password-expected}                         William56$hj
${firstname-expected}                        william
${lastname-expected}                         hopkins
${phone-expected}                            1-478-001-0890

*** Test Cases ***
TA01_SpecialPath 

    [Documentation]   ตัวอย่างแบบถูก
    [Tags]            success
    Create Session    Get_User        ${URL}      verify=true   
    ${response}       GET On Session    Get_User    /users/8    
    Run Keyword And Continue On Failure     Should Be Equal As Integers    ${response.status_code}    200
    Log To Console    Step_GET_User_Success
    Log TO Console    ${response}

    #เป็นวิธีแบบเก่าไม่นิยม
    ${json_str}    Convert String To Json     ${response.content}
    ${id-get}      Get Value From Json        ${json_str}            $.id
    ${id-get}      Convert To String          ${id-get}[0]
    Run Keyword And Continue On Failure      Should Be Equal     ${id-get}             ${id-expected}

    #เป็นวิธีแบบใหม่(นิยมใช้)
    ${id-get}     Set Variable               ${response.json()}[id]
    Run Keyword And Continue On Failure      Should Be Equal As Integers              ${id-get}                 ${id-expected}

    ${email-get}     Set Variable            ${response.json()}[email]
    Run Keyword And Continue On Failure      Should Be Equal As Strings               ${email-get}              ${email-expected}

    ${username-get}     Set Variable         ${response.json()}[username]
    Run Keyword And Continue On Failure      Should Be Equal As Strings               ${username-get}           ${username-expected}
    
    ${password-get}     Set Variable         ${response.json()}[password]
    Run Keyword And Continue On Failure      Should Be Equal As Strings               ${password-get}           ${password-expected}

    ${firstname-get}     Set Variable        ${response.json()}[name][firstname]
    Run Keyword And Continue On Failure      Should Be Equal As Strings               ${firstname-get}          ${firstname-expected}

    ${lastname-get}     Set Variable         ${response.json()}[name][lastname]
    Run Keyword And Continue On Failure      Should Be Equal As Strings               ${lastname-get}           ${lastname-expected}

    ${phone-get}     Set Variable            ${response.json()}[phone]
    Run Keyword And Continue On Failure      Should Be Equal As Strings               ${phone-get}              ${phone-expected}

    #ตัวอย่างเสริม การบวกเลข และ set ตัวแปร
TA02_SpecialPath 
    [Tags]     number
    ${New-id-expected}      Evaluate    ${id-expected} + 3
    ${New-id-expected02}    Evaluate    (${id-expected}+3) * 2

    ${New-id-expected}      Set Variable    BRAVO${id-expected}
    ${New-id-expected02}    Set Variable    BRAVO${id-expected}

    Log TO Console    ${New-id-expected}
    Log TO Console    ${New-id-expected02}





*** Settings ***
Library        RequestsLibrary
Library        JSONLibrary
Library        Collections
Library        String

*** Variables ***
${URL}              https://dummyjson.com
${reason_expect}    OK
${status_pass}      200
# ${status_post}      201

*** Test Cases ***
TA02_Post_User
    [Documentation]    ตัวอย่างแบบถูก
    [Tags]            success
    Create Session    Post_User        ${URL}        verify=true   
    ${headers}        Create Dictionary    Content-type=application/json; charset=UTF-8
    ${body}           Load Json From File  request-dummyjson/Request_Post_Product.json
    Log     ${body}
    ${response}       POST On Session    Post_User    /products/add    headers=${headers}    json=${body}  
    Log    ${response.status_code}
    Log    ${response.reason}
    Log    ${response.headers}
    Log    ${response.content}
    Should Be Equal As Integers    ${response.status_code}    200
    Log To Console    Step_Post_User_Success
    Log TO Console    ${body}


TA03_Put_User
    [Documentation]    ตัวอย่างแบบถูก
    [Tags]            put_success
    Create Session    Put_User        ${URL}        verify=true   
    ${headers}        Create Dictionary    Content-type=application/json; charset=UTF-8
    ${body}           Load Json From File  request-dummyjson/Request_Put_Product.json
    ${response}       PUT On Session    Put_User    /products/3    headers=${headers}    json=${body}  
    Log    ${response.status_code}
    Log    ${response.reason}
    Log    ${response.headers}
    Log    ${response.content}
    Should Be Equal As Integers    ${response.status_code}    200


TA04_Patch_User
    [Documentation]    ตัวอย่างแบบถูก
    [Tags]            patch_success
    Create Session    Patch_User        ${URL}        verify=true   
    ${headers}        Create Dictionary    Content-type=application/json; charset=UTF-8
    ${body}           Load Json From File   request-dummyjson/Request_Patch_Product.json 
    ${response}       PATCH On Session    Patch_User    /products/10    headers=${headers}    json=${body}  
    Log    ${response.status_code}
    Log    ${response.reason}
    Log    ${response.headers}
    Log    ${response.content}
    Should Be Equal As Integers    ${response.status_code}    200

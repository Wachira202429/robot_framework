*** Settings ***
Library        RequestsLibrary
Library        JSONLibrary
Library        Collections
Library        String

*** Variables ***
${URL}              https://jsonplaceholder.typicode.com
${reason_expect}    OK
${status_pass}      200
# ${status_post}      201

*** Test Cases ***
TC01_Post_User
    Create Session    Post_User        ${URL}        verify=true   
    ${headers}        Create Dictionary    Content-type=application/json; charset=UTF-8
    ${body}           Load Json From File  request-jsonplaceholder/Request_Post_User.json
    ${response}       POST On Session    Post_User    /posts    headers=${headers}    json=${body}  
    Log    ${response.status_code}
    Log    ${response.reason}
    Log    ${response.headers}
    Log    ${response.content}
    Should Be Equal As Integers    ${response.status_code}    201

TC02_Put_User
    Create Session    Put_User        ${URL}        verify=true   
    ${headers}        Create Dictionary    Content-type=application/json; charset=UTF-8
    ${body}           Load Json From File  request-jsonplaceholder/Request_Put_User.json
    ${response}       PUT On Session    Put_User    /posts/1    headers=${headers}    json=${body}  
    Log    ${response.status_code}
    Log    ${response.reason}
    Log    ${response.headers}
    Log    ${response.content}
    Should Be Equal As Integers    ${response.status_code}    200

TC03_Patch_User
    Create Session    Patch_User        ${URL}        verify=true   
    ${headers}        Create Dictionary    Content-type=application/json; charset=UTF-8
    ${body}           Load Json From File  request-jsonplaceholder/Request_Patch_User.json
    ${response}       PATCH On Session    Patch_User    /posts/1    headers=${headers}    json=${body}  
    Log    ${response.status_code}
    Log    ${response.reason}
    Log    ${response.headers}
    Log    ${response.content}
    Should Be Equal As Integers    ${response.status_code}    200


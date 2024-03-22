*** Settings ***
Library        RequestsLibrary
Library        JSONLibrary
Library        Collections
Library        String

*** Variables ***
${URL}              https://dummyjson.com


*** Test Cases ***
TC01_GET_Token
   Create Session     Get Token        ${URL}       verify=true   
    ${headers}        Create Dictionary        Content-type=application/json; charset=UTF-8
    ${body}           Create Dictionary           username=kminchelle    password=0lelplR
    ${response}       POST On Session    Get Token     /auth/login    headers=${headers}    json=${body}  
    Log    ${body}
    Log    ${response.status_code}
    Log    ${response.reason}
    Log    ${response.headers}
    Log    ${response.content}
    Should Be Equal As Integers    ${response.status_code}    200
    ${token}    Set Variable       ${response.json()}[token]
    Set Global Variable     ${token}
    Log To Console     ${token}

TC02_Authen With Product
   Create Session     Get Product        ${URL}       verify=true   
    ${headers}        Create Dictionary        Content-type=application/json; charset=UTF-8    Authorization=${token}
    ${body}           Create Dictionary        username=kminchelle    password=0lelplR
    ${response}       GET On Session    Get Product     /auth/products     headers=${headers} 
    Log    ${body}
    Log    ${response.status_code}
    Log    ${response.reason}
    Log    ${response.headers}
    Log    ${response.content}
    Should Be Equal As Integers    ${response.status_code}    200

TC03_GET Product with token
   Create Session     Get Token        ${URL}       verify=true   
    ${headers}        Create Dictionary        Content-type=application/json; charset=UTF-8
    ${body}           Create Dictionary           username=kminchelle    password=0lelplR
    ${response}       POST On Session    Get Token     /auth/login    headers=${headers}    json=${body}  
    Log    ${body}
    Log    ${response.status_code}
    Log    ${response.reason}
    Log    ${response.headers}
    Log    ${response.content}
    Should Be Equal As Integers    ${response.status_code}    200
    ${token}    Set Variable       ${response.json()}[token]

    Create Session     Get Product        ${URL}       verify=true   
    ${headers}        Create Dictionary        Content-type=application/json; charset=UTF-8    Authorization=${token}
    ${body}           Create Dictionary        username=kminchelle    password=0lelplR
    ${response}       GET On Session    Get Product     /auth/products     headers=${headers} 
    Log    ${body}
    Log    ${response.status_code}
    Log    ${response.reason}
    Log    ${response.headers}
    Log    ${response.content}
    Should Be Equal As Integers    ${response.status_code}    200

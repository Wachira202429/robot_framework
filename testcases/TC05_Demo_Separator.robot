*** Settings ***
Library        RequestsLibrary
Library        JSONLibrary
Library        Collections
Library        String

*** Variables ***
#https://postman-echo.com/get?test=123
${URL}                              https://postman-echo.com

*** Test Cases ***
TC01_Separator
    Create Session    Get_echo       ${URL}      verify=true 
    ${params}         Catenate        SEPARATOR=&    test=123
    ${response}       GET On Session    Get_echo    /get        params=${params}  

    Should Be Equal As Integers    ${response.status_code}    200
    Log To Console    Step_GET_echo_Success
    Log TO Console    ${response}

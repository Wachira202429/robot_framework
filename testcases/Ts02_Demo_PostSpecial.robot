*** Settings ***
Library        RequestsLibrary
Library        JSONLibrary
Library        Collections
Library        String

*** Variables ***
${URL}              https://dummyjson.com
@{Product}          Iphone     Nokia     Samsung    Vivo    Oppo

*** Test Cases ***
TC01_Loop_POST_Inrange
    FOR    ${index}    IN    RANGE    5
   Create Session    Post_Product        ${URL}       verify=true   
    ${headers}        Create Dictionary        Content-type=application/json; charset=UTF-8
    ${body}           Load Json From File      request-dummyjson/Request_Post_Product.json
    ${response}       POST On Session    Post_Product    /products/add    headers=${headers}    json=${body}  
                LOG To Console    \n${index}
    Log    ${body}
    Log    ${response.status_code}
    Log    ${response.reason}
    Log    ${response.headers}
    Log    ${response.content}
    Should Be Equal As Integers    ${response.status_code}    200
    Log To Console    Step_Post_Product_Success
    Log TO Console    ${body}
    END

TC02_Loop_Update_Inlist
    FOR    ${index}    IN    @{Product}
    Create Session    Post_Product        ${URL}       verify=true   
    ${headers}        Create Dictionary        Content-type=application/json; charset=UTF-8
    ${body}           Load Json From File      request-dummyjson/Request_Post_Product.json
    ${body}            Update Value To Json    ${body}    $.title         ${index}
    Log     ${body}
    ${response}       POST On Session    Post_Product    /products/add    headers=${headers}    json=${body}  
    Log    ${response.status_code}
    Log    ${response.reason}
    Log    ${response.headers}
    Log    ${response.content}
    Should Be Equal As Integers    ${response.status_code}    200
    Log To Console    Step_Post_Product_Success
    Log TO Console    ${body}
    END

TC03_Post_Producut_test_template 
    #ใช้keyword test template
    [template]    Post Mobile Product
    [Tags]        success
    iPhone        5000        Apple        100
    Nokia200      2000        Nokia        50
    Samsungx10    4000        Samsung      90
    Vivo20        3500        Vivo         20

*** Keyword ***
Post Mobile Product
    [Arguments]    ${product}    ${price}    ${brand}    ${stock}  #สร้างมารับค่า
    Create Session    Post_Product        ${URL}       verify=true   
    ${headers}        Create Dictionary        Content-type=application/json; charset=UTF-8
    ${body}           Load Json From File      request-dummyjson/Request_Post_Product.json
    ${body}            Update Value To Json    ${body}    $.title         ${product}
    ${body}            Update Value To Json    ${body}    $.price         ${price}
    ${body}            Update Value To Json    ${body}    $.brand         ${brand}
    ${body}            Update Value To Json    ${body}    $.stock         ${stock}
    Log     ${body}
    ${response}       POST On Session    Post_Product    /products/add    headers=${headers}    json=${body}  
    Log    ${response.status_code}
    Log    ${response.reason}
    Log    ${response.headers}
    Log    ${response.content}
    Should Be Equal As Integers    ${response.status_code}    200
    Log To Console    Step_Post_Product_Success
    Log TO Console    ${body}



*** Settings ***
Library        RequestsLibrary
Library        JSONLibrary
Library        Collections
Library        String
Resource       ${CURDIR}/../testdata/data.robot
Variables      ${CURDIR}/../testdata/customer.yaml
Variables      ${CURDIR}/../testdata/product.yaml

*** Test Cases ***
TA01_Post_User01
    [Documentation]   ตัวอย่างแบบถูก
    [Tags]            success
    Create Session    Post_User        ${URL}[0]       verify=true   
    ${headers}        Create Dictionary    Content-type=application/json; charset=UTF-8
    ${body}           Load Json From File  request-jsonplaceholder/Request_Post_User.json
    ${body}            Update Value To Json    ${body}    $.title        ${titleuser01}
    ${body}            Update Value To Json    ${body}    $.body         ${body01}
    ${body}            Update Value To Json    ${body}    $.userId       ${userId01}
    Log     ${body}
    ${response}       POST On Session    Post_User    /posts    headers=${headers}    json=${body}  
    Log    ${response.status_code}
    Log    ${response.reason}
    Log    ${response.headers}
    Log    ${response.content}
    Should Be Equal As Integers    ${response.status_code}    201
    Log To Console    Step_Post_User_Success
    Log TO Console    ${body}

TA02_Post_User02
    [Documentation]   ตัวอย่างแบบถูก
    [Tags]            success
    Create Session    Post_User        ${URL}[0]       verify=true   
    ${headers}        Create Dictionary    Content-type=application/json; charset=UTF-8
    ${body}           Load Json From File  request-jsonplaceholder/Request_Post_User.json
    ${body}            Update Value To Json    ${body}    $.title        ${titleuser02}
    ${body}            Update Value To Json    ${body}    $.body         ${body02}
    ${body}            Update Value To Json    ${body}    $.userId       ${userId02}
    Log     ${body}
    ${response}       POST On Session    Post_User    /posts    headers=${headers}    json=${body}  
    Log    ${response.status_code}
    Log    ${response.reason}
    Log    ${response.headers}
    Log    ${response.content}
    Should Be Equal As Integers    ${response.status_code}    201
    Log To Console    Step_Post_User_Success
    Log TO Console    ${body}

TA03_Post_User03
    [Documentation]   ตัวอย่างแบบถูก
    [Tags]            success
    Create Session    Post_User        ${URL}[0]       verify=true   
    ${headers}        Create Dictionary    Content-type=application/json; charset=UTF-8
    ${body}           Load Json From File  request-jsonplaceholder/Request_Post_User.json
    ${body}            Update Value To Json    ${body}    $.title        ${titleuser03}
    ${body}            Update Value To Json    ${body}    $.body         ${body03}
    ${body}            Update Value To Json    ${body}    $.userId       ${userId03}
    Log     ${body}
    ${response}       POST On Session    Post_User    /posts    headers=${headers}    json=${body}  
    Log    ${response.status_code}
    Log    ${response.reason}
    Log    ${response.headers}
    Log    ${response.content}
    Should Be Equal As Integers    ${response.status_code}    201
    Log To Console    Step_Post_User_Success
    Log TO Console    ${body}

TA04_Post_Iphone
    [Documentation]   ตัวอย่างแบบถูก
    [Tags]            success
    Create Session    Post_Product        ${URL}[1]       verify=true   
    ${headers}        Create Dictionary    Content-type=application/json; charset=UTF-8
    ${body}           Load Json From File  request-dummyjson/Request_Post_Product.json
    ${body}            Update Value To Json    ${body}    $.id        ${id}
    ${body}            Update Value To Json    ${body}    $.title         ${title}
    ${body}            Update Value To Json    ${body}    $.description   ${description}
    ${body}            Update Value To Json    ${body}    $.price        ${price}
    ${body}            Update Value To Json    ${body}    $.discountPercentage         ${discountPercentage}
    ${body}            Update Value To Json    ${body}    $.rating       ${rating}
    ${body}            Update Value To Json    ${body}    $.stock        ${stock}
    ${body}            Update Value To Json    ${body}    $.brand         ${brand}
    ${body}            Update Value To Json    ${body}    $.category       ${category}
    ${body}            Update Value To Json    ${body}    $.thumbnail       ${thumbnail}
    ${body}            Update Value To Json    ${body}    $.images[0]       ${images1}
    ${body}            Update Value To Json    ${body}    $.images[1]       ${images2}
    ${body}            Update Value To Json    ${body}    $.images[2]       ${images3}
    ${body}            Update Value To Json    ${body}    $.images[3]       ${images4}
    ${body}            Update Value To Json    ${body}    $.images[4]       ${images5}
    Log     ${body}
    ${response}       POST On Session    Post_Product    /products/add    headers=${headers}    json=${body}  
    Log    ${response.status_code}
    Log    ${response.reason}
    Log    ${response.headers}
    Log    ${response.content}
    Should Be Equal As Integers    ${response.status_code}    200
    Log To Console    Step_Post_Product_Success
    Log TO Console    ${body}

TA05_Yaml_File
    [Tags]    yaml_sucess
    Create Session    Post_User        ${URL}[0]       verify=true   
    ${headers}        Create Dictionary    Content-type=application/json; charset=UTF-8
    ${body}           Load Json From File  request-jsonplaceholder/Request_Post_User.json
    ${body}            Update Value To Json    ${body}    $.title        ${customer}[id01][titleuser]
    ${body}            Update Value To Json    ${body}    $.body         ${customer}[id01][body]
    ${body}            Update Value To Json    ${body}    $.userId       ${customer}[id01][userId]
    Log     ${body}
    ${response}       POST On Session    Post_User    /posts    headers=${headers}    json=${body}  
    Log    ${response.status_code}
    Log    ${response.reason}
    Log    ${response.headers}
    Log    ${response.content}
    Should Be Equal As Integers    ${response.status_code}    201
    Log To Console    Step_Post_User_Success
    Log TO Console    ${body}


TA05_Yaml_File
    [Tags]    yaml_product_sucess
    Create Session    Post_Product        ${URL}[1]       verify=true   
    ${headers}        Create Dictionary    Content-type=application/json; charset=UTF-8
    ${body}           Load Json From File  request-dummyjson/Request_Post_Product.json
    ${body}            Update Value To Json    ${body}    $.id        ${product}[id01][id]
    ${body}            Update Value To Json    ${body}    $.title         ${product}[id01][title]
    ${body}            Update Value To Json    ${body}    $.description   ${product}[id01][description]
    ${body}            Update Value To Json    ${body}    $.price        ${product}[id01][price]
    ${body}            Update Value To Json    ${body}    $.discountPercentage         ${product}[id01][discountPercentage]
    ${body}            Update Value To Json    ${body}    $.rating       ${product}[id01][rating]
    ${body}            Update Value To Json    ${body}    $.stock        ${product}[id01][stock]
    ${body}            Update Value To Json    ${body}    $.brand         ${product}[id01][brand]
    ${body}            Update Value To Json    ${body}    $.category       ${product}[id01][category]
    ${body}            Update Value To Json    ${body}    $.thumbnail       ${product}[id01][thumbnail]
    ${body}            Update Value To Json    ${body}    $.images[0]       ${product}[id01][images][0]
    ${body}            Update Value To Json    ${body}    $.images[1]       ${product}[id01][images][1]
    ${body}            Update Value To Json    ${body}    $.images[2]       ${product}[id01][images][2]
    ${body}            Update Value To Json    ${body}    $.images[3]       ${product}[id01][images][3]
    ${body}            Update Value To Json    ${body}    $.images[4]       ${product}[id01][images][4]
    ${response}       POST On Session     Post_Product   /products/add    headers=${headers}    json=${body}  
    Should Be Equal As Integers    ${response.status_code}    200
    Log TO Console    ${body}



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
TA01_Get_products_category
    Create Session    Get_products_category      ${URL}        verify=true   
    ${response}       GET On Session    Get_products_category    /products/category/smartphones
    Log    ${response.status_code}
    Log    ${response.reason}
    Log    ${response.headers}
    Log    ${response.content}

    # //มีวิธีvalidateหลายแบบ 1//
    ${return_code}    Convert To String    ${response.status_code}
    Should Be Equal   ${return_code}       ${status_pass}
    # //มีวิธีvalidateหลายแบบ 2//
    Should Be Equal As Integers    ${response.status_code}    ${status_pass}
    # //มีวิธีvalidateหลายแบบ 3//
    Should Be Equal As Numbers     ${response.status_code}    ${status_pass}
    # //มีวิธีvalidateหลายแบบ 4//
    Should Be Equal    ${response.reason}    ${reason_expect}
    # //มีวิธีvalidateหลายแบบ 5//
    Should Be Equal As Strings    ${response.reason}    ${reason_expect}

# TA02_Post_User
#     [Documentation]    ตัวอย่างแบบผิด
#     [Tags]            fail
#     Create Session    Post_User        ${URL}        verify=true   
#     ${headers}        Create Dictionary    Content-type=application/json; charset=UTF-8
#     ${body}           Create Dictionary    
#     ...    id=1     
#     ...    title=iPhone 15    
#     ...    description=An apple mobile which is nothing like apple
#     ...    price=600
#     ...    discountPercentage=12.99
#     ...    rating=4.69
#     ...    stock=94
#     ...    brand=Apple
#     ...    category=smartphones
#     ...    thumbnail=https://cdn.dummyjson.com/product-images/1/thumbnail.jpg
#     ...    images=https://cdn.dummyjson.com/product-images/1/1.jpg
#     ...    images=https://cdn.dummyjson.com/product-images/1/2.jpg"
#     ...    images=https://cdn.dummyjson.com/product-images/1/3.jpg"    
#     ...    images=https://cdn.dummyjson.com/product-images/1/4.jpg"
#     ...    images=https://cdn.dummyjson.com/product-images/1/5.jpg"
#     ${response}       POST On Session    Post_User    /products/add    headers=${headers}    json=${body}  
#     Log    ${response.status_code}
#     Log    ${response.reason}
#     Log    ${response.headers}
#     Log    ${response.content}
#     Should Be Equal As Integers    ${response.status_code}    200
#     # Should Be Equal As Numbers     ${response.status_code}    ${status_post}

TA02_Post_User
    [Documentation]    ตัวอย่างแบบถูก
    [Tags]            post_success
    Create Session    Post_User        ${URL}        verify=true   
    ${product-random01}     Generate Random String    10    [LOWER]
    Log To Console    ${product-random01}

    ${product-random02}     Generate Random String    5    [NUMBERS]abpx
    Log To Console    ${product-random02}

    ${product-random03}     Generate Random String    10    [UPPER]
    Log To Console    ${product-random03}

    ${headers}        Create Dictionary    Content-type=application/json; charset=UTF-8
    ${images_list}    Create List
    ...    https://cdn.dummyjson.com/product-images/1/1.jpg
    ...    https://cdn.dummyjson.com/product-images/1/2.jpg"
    ...    https://cdn.dummyjson.com/product-images/1/3.jpg"    
    ...    https://cdn.dummyjson.com/product-images/1/4.jpg"
    ...    https://cdn.dummyjson.com/product-images/1/5.jpg"

    ${body}           Create Dictionary    
    ...    id=1     
    ...    title=iPhone 15    
    ...    description=An apple mobile which is nothing like apple
    ...    price=600
    ...    discountPercentage=12.99
    ...    rating=4.69
    ...    stock=94
    ...    brand=Apple
    ...    category=smartphones
    ...    thumbnail=https://cdn.dummyjson.com/product-images/1/thumbnail.jpg
    ...    images=${images_list}

    ${response}       POST On Session    Post_User    /products/add    headers=${headers}    json=${body}  
    Log    ${response.status_code}
    Log    ${response.reason}
    Log    ${response.headers}
    Log    ${response.content}
    Should Be Equal As Integers    ${response.status_code}    200


TA03_Put_User
    [Documentation]    ตัวอย่างแบบถูก
    [Tags]            put_success
    Create Session    Put_User        ${URL}        verify=true   
    ${headers}        Create Dictionary    Content-type=application/json; charset=UTF-8
    ${images_list}    Create List
    ...    https://cdn.dummyjson.com/product-images/1/1.jpg
    ...    https://cdn.dummyjson.com/product-images/1/2.jpg"
    ...    https://cdn.dummyjson.com/product-images/1/3.jpg"    
    ...    https://cdn.dummyjson.com/product-images/1/4.jpg"
    ...    https://cdn.dummyjson.com/product-images/1/5.jpg"

    ${body}           Create Dictionary    
    ...    id=1     
    ...    title=iPhone14   
    ...    description=An apple mobile which is nothing like apple
    ...    price=57500
    ...    discountPercentage=12.99
    ...    rating=5.3
    ...    stock=120
    ...    brand=Apple
    ...    category=smartphones
    ...    thumbnail=https://cdn.dummyjson.com/product-images/1/thumbnail.jpg
    ...    images=${images_list}

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
    ${images_list}    Create List
    ...    https://cdn.dummyjson.com/product-images/1/1.jpg
    ...    https://cdn.dummyjson.com/product-images/1/2.jpg"
    ...    https://cdn.dummyjson.com/product-images/1/3.jpg"    
    ...    https://cdn.dummyjson.com/product-images/1/4.jpg"
    ...    https://cdn.dummyjson.com/product-images/1/5.jpg"

    ${body}           Create Dictionary    
    ...    id=1     
    ...    title=SamsungX10   
    ...    description=An apple mobile which is nothing like apple
    ...    price=39500
    ...    discountPercentage=12.99
    ...    rating=5.3
    ...    stock=186
    ...    brand=Apple
    ...    category=smartphones
    ...    thumbnail=https://cdn.dummyjson.com/product-images/1/thumbnail.jpg
    ...    images=${images_list}

    ${response}       PATCH On Session    Patch_User    /products/10    headers=${headers}    json=${body}  
    Log    ${response.status_code}
    Log    ${response.reason}
    Log    ${response.headers}
    Log    ${response.content}
    Should Be Equal As Integers    ${response.status_code}    200

TA05_Delete_User
    Create Session    Delete_User        ${URL}        verify=true   
    ${headers}        Create Dictionary    Content-type=application/json; charset=UTF-8
    ${response}       DELETE On Session    Delete_User    /products/10   headers=${headers}   
    Log    ${response.status_code}
    Log    ${response.reason}
    Log    ${response.headers}
    Log    ${response.content}
    #Should Be Equal As Strings    ${response.content}   HP
    # สามารถใช้เพื่อเช็คstatusที่อาจจะออกมาเป็นได้หลายแบบ
    ${return_code}        Convert To String        ${response.status_code} 
    Should Contain Any    ${return_code}            201    200    500    

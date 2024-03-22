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
TC01_Get_All_User
    Create Session    Get_All_User        ${URL}        verify=true   
    ${response}       GET On Session    Get_All_User    /posts  
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


TC02_Get_Only_ID
    Create Session    Get_Only_ID        ${URL}        verify=true   
    #สามารถใส่ expected status อยู่บันทัดเกียวกันแบบนี้ได้
    ${response}       GET On Session    Get_Only_ID    /posts/1      expected_status=200 
    Log    ${response.status_code}
    Log    ${response.reason}
    Log    ${response.headers}
    Log    ${response.content}
    Should Be Equal As Integers    ${response.status_code}    200

TC03_Get_Comment
    Create Session    Get_Comment        ${URL}        verify=true   
    #สามารถใส่ expected status อยู่บันทัดเกียวกันแบบนี้ได้
    ${response}       GET On Session    Get_Comment    /posts/1/comments      expected_status=200 
    Log    ${response.status_code}
    Log    ${response.reason}
    Log    ${response.headers}
    Log    ${response.content}
    Should Be Equal As Integers    ${response.status_code}    ${status_pass}

TC04_Post_User
    Create Session    Post_User        ${URL}        verify=true   
    ${headers}        Create Dictionary    Content-type=application/json; charset=UTF-8
    ${body}           Create Dictionary    title=TEST     body=Nan    userId=1
    ${response}       POST On Session    Post_User    /posts    headers=${headers}    json=${body}  
    Log    ${response.status_code}
    Log    ${response.reason}
    Log    ${response.headers}
    Log    ${response.content}
    Should Be Equal As Integers    ${response.status_code}    201
    # Should Be Equal As Numbers     ${response.status_code}    ${status_post}

# TC04_Post_User
#     Create Session    Post_User        ${URL}        verify=true   
#     ${headers}        Create Dictionary    Content-type=application/json; charset=UTF-8
#     ${body}           Create Dictionary    
#     ...    title=TEST     
#     ...    body=Nan    
#     ...    userId=1
#     ${response}       POST On Session    Post_User    /posts    headers=${headers}    json=${body}  
#     Log    ${response.status_code}
#     Log    ${response.reason}
#     Log    ${response.headers}
#     Log    ${response.content}
#     Should Be Equal As Integers    ${response.status_code}    201

TC05_Put_User
    Create Session    Put_User        ${URL}        verify=true   
    ${headers}        Create Dictionary    Content-type=application/json; charset=UTF-8
    ${body}           Create Dictionary    
    ...    id=1    
    ...    title=TEST     
    ...    body=Nan    
    ...    userId=1
    ${response}       PUT On Session    Put_User    /posts/1    headers=${headers}    json=${body}  
    Log    ${response.status_code}
    Log    ${response.reason}
    Log    ${response.headers}
    Log    ${response.content}
    Should Be Equal As Integers    ${response.status_code}    200

TC06_Patch_User
    Create Session    Patch_User        ${URL}        verify=true   
    ${headers}        Create Dictionary    Content-type=application/json; charset=UTF-8
    ${body}           Create Dictionary    
    ...    title=NanTEST     
    ${response}       PATCH On Session    Patch_User    /posts/1    headers=${headers}    json=${body}  
    Log    ${response.status_code}
    Log    ${response.reason}
    Log    ${response.headers}
    Log    ${response.content}
    Should Be Equal As Integers    ${response.status_code}    200

TC07_Delete_User
    Create Session    Delete_User        ${URL}        verify=true   
    ${headers}        Create Dictionary    Content-type=application/json; charset=UTF-8
    ${response}       DELETE On Session    Delete_User    /posts/1    headers=${headers}   
    Log    ${response.status_code}
    Log    ${response.reason}
    Log    ${response.headers}
    Log    ${response.content}
    Should Be Equal As Strings    ${response.content}   {}
    # สามารถใช้เพื่อเช็คstatusที่อาจจะออกมาเป็นได้หลายแบบ
    ${return_code}        Convert To String        ${response.status_code} 
    Should Contain Any    ${return_code}            201    200    500    

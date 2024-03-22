*** Settings ***
Library        RequestsLibrary
Library        JSONLibrary
Library        Collections
Library        String

*** Variables ***
#https://www.alibaba.com/Home-Garden_p15?spm=a2700.product_home_l0.category_nav.1
${URL}        https://www.alibaba.com
${URL2}       https://gettgo.com/travel/search?travel_type=one_time&travel_destination=JPN&travel_person=5&travel_from_date=29%2F01%2F2024&travel_to_date=04%2F02%2F2024
            

*** Test Cases ***
TA01_Separator
    Create Session    Get_echo       ${URL}      verify=true 
    ${params}         Catenate        SEPARATOR=&    spm=a2700.product_home_l0.category_nav.1
    ${response}       GET On Session    Get_echo    /Home-Garden_p15        params=${params}  

    Should Be Equal As Integers    ${response.status_code}    200
    Log To Console    Step_GET_echo_Success
    Log TO Console    ${response}


# TA02_Separator
#     Create Session    Get_echo       ${URL2}      verify=true 
#     ${params}         Catenate        SEPARATOR=&    travel_type=one_time&travel_destination=JPN&travel_person=5&travel_from_date=29%2F01%2F2024&travel_to_date=04%2F02%2F2024        
#     ${response}       GET On Session    Get_echo    /search     params=${params}  

#     Should Be Equal As Integers    ${response.status_code}    200
#     Log To Console    Step_GET_echo_Success
#     Log TO Console    ${response}
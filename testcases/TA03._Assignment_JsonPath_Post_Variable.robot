*** Settings ***
Library        RequestsLibrary
Library        JSONLibrary
Library        Collections
Library        String

*** Variables ***
${company_TOPS}                   company_TOPS
${company_LOTTUS}                 company_LOTTUS
${company_SCB}                    company_SCB

${Company}                    test01
${Companyid}                  test02
${Companycode}                test03
${id}                         test04
${name}                       test05
${username}                   test06
${email}                      test07
${street}                     test08
${suite}                      test09
${city}                       test10
${zipcode}                    test11
${lat}                        test12   
${lng}                        test13
${phone}                      test14
${website}                    test15
${companyname}                test16
${catchPhrase}                test17
${bs}                         test18

*** Test Cases ***
TC01_JsonPath 

    ${body}    Load Json From File  response/assignment-pathjson01.json
    Log        ${body}    
    ${body}    Update Value To Json    ${body}    $.Company    ${Company}
    ${body}    Update Value To Json    ${body}    $.Companyid[0]    ${Companyid}   
    ${body}    Update Value To Json    ${body}    $.Companycode[0]    ${Companycode}
    ${body}    Update Value To Json    ${body}    $.id    ${id}
    ${body}    Update Value To Json    ${body}    $.name   ${name}
    ${body}    Update Value To Json    ${body}    $.username   ${username}
    ${body}    Update Value To Json    ${body}    $.email    ${email}
    ${body}    Update Value To Json    ${body}    $.address.street    ${street} 
    ${body}    Update Value To Json    ${body}    $.address.suite    ${suite}
    ${body}    Update Value To Json    ${body}    $.address.city   ${city}
    ${body}    Update Value To Json    ${body}    $.address.zipcode    ${zipcode}
    ${body}    Update Value To Json    ${body}    $.address.geo.lat    ${lat}
    ${body}    Update Value To Json    ${body}    $.ddress.geo.lng    ${lng}
    ${body}    Update Value To Json    ${body}    $.phone   ${phone}
    ${body}    Update Value To Json    ${body}    $.website    ${website}
    ${body}    Update Value To Json    ${body}    $.company.name    ${companyname}
    ${body}    Update Value To Json    ${body}    $.company.catchPhrase    ${catchPhrase}
    ${body}    Update Value To Json    ${body}    $.company.bs    ${bs}
    Log        ${body}  

# set แบบ Global สามารถใช้ข้ามtest case ได้
    ${body_Global}    Set Variable   ${body}  
    Set Global Variable    ${body}

TC02_JsonPath 
    ${body}    Update Value To Json    ${body}    $.Company    ${company_TOPS} 
        Log        ${body}  

TC03_JsonPath 
    ${body}    Update Value To Json    ${body}    $.Company    ${company_LOTTUS} 
        Log        ${body}  

TC04_JsonPath 
    ${body}    Update Value To Json    ${body}    $.Company    ${company_SCB} 
        Log        ${body}  



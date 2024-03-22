*** Settings ***
Library        RequestsLibrary
Library        JSONLibrary
Library        Collections
Library        String

*** Variables ***
${recipientId}                    test01
${recipientMobileNumbers}         test02
${recipientEmails}                test03
${recipientTaxId}                 test04
${documentId}                     test05
${sequence}                       test06
${recipientName}                  test07
${addressNumber}                  test08
${floorNumber}                    test09
${unitNumber}                     test10
${addressVillage}                 test11
${addressSubdistrict}             test12   
${addressDistrict}                test13
${addressProvince}                test14
${addressZipCode}                 test15
${addressCountryCode}             test16
${migratedAddress}                test17

*** Test Cases ***
TC01_JsonPath 

    ${body}    Load Json From File  response/example-path.json
    Log        ${body}    
    ${body}    Update Value To Json    ${body}    $.recipientId    ${recipientId}
    ${body}    Update Value To Json    ${body}    $.recipientMobileNumbers    ${recipientMobileNumbers}
    Log        ${body}    
    ${body}    Update Value To Json    ${body}    $.recipientEmails    ${recipientEmails}
    ${body}    Update Value To Json    ${body}    $.recipientTaxId    ${recipientTaxId}
    ${body}    Update Value To Json    ${body}    $.recipientDocuments[0].documentId    ${documentId}
    ${body}    Update Value To Json    ${body}    $.recipientDocuments[0].sequence    ${sequence}
    ${body}    Update Value To Json    ${body}    $.recipientDocuments[0].recipientName    ${recipientName}
    ${body}    Update Value To Json    ${body}    $.recipientDocuments[0].addressNumber    ${addressNumber} 
    ${body}    Update Value To Json    ${body}    $.recipientDocuments[0].floorNumber    ${floorNumber}
    ${body}    Update Value To Json    ${body}    $.recipientDocuments[0].unitNumber    ${unitNumber}
    ${body}    Update Value To Json    ${body}    $.recipientDocuments[0].addressVillage    ${addressVillage}
    ${body}    Update Value To Json    ${body}    $.recipientDocuments[0].addressSubdistrict    ${addressSubdistrict}
    ${body}    Update Value To Json    ${body}    $.recipientDocuments[0].addressDistrict    ${addressDistrict}
    ${body}    Update Value To Json    ${body}    $.recipientDocuments[0].addressProvince    ${addressProvince}
    ${body}    Update Value To Json    ${body}    $.recipientDocuments[0].addressZipCode    ${addressZipCode}
    ${body}    Update Value To Json    ${body}    $.recipientDocuments[0].addressCountryCode    ${addressCountryCode}
    ${body}    Update Value To Json    ${body}    $.recipientDocuments[0].migratedAddress    ${migratedAddress}
    Log        ${body}  


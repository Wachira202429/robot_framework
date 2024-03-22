*** Settings ***
Library        RequestsLibrary
Library        JSONLibrary
Library        Collections
Library        String

*** Variables ***
@{Name}    Nan    PloySri    Sphinx    Yo     Nam  
  #ประกาศ list

*** Test Cases ***
TC01_Loop_Inrange
    FOR    ${index}    IN    RANGE    10
            LOG To Console    Japan
    END
TC02_Loop_InList
    FOR    ${index}    IN    @{Name}
            LOG To Console    \n${index}
    END
TC03_Loop
    FOR    ${index}    IN    RANGE    5
    FOR    ${index}    IN    @{Name}
            LOG To Console    \n${index}
    END
    END
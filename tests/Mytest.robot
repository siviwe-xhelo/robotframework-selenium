*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem
Library    Screenshot

*** Variables ***
${URL}                                                      https://www.microsoft.com/en-za
*** Test Cases ***
example 1
    [Tags]  Regression
    ${chrome_options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${chrome_options}    add_argument    --disable-extensions
    Call Method    ${chrome_options}    add_argument    --headless
    Call Method    ${chrome_options}    add_argument    --disable-gpu
    Call Method    ${chrome_options}    add_argument    --no-sandbox
    Create Webdriver    Chrome    chrome_options=${chrome_options}
    Set Window Size  1024  768
    Go To    ${URL}

    Capture Page Screenshot
    sleep                                                    3
    close browser
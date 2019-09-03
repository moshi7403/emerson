*** Settings ***

Library  SeleniumLibrary




*** Variables ***

${Browser}  chrome
${URL}  https://www.emersonecologics.com

##Variables for Category
${ShopMenuXpath}   xpath=//*[@id="shopMenuDropdownToggle"]/span/span[1]
${CategoryXpath}  xpath=//*[@id="mega-menu-shop-by"]/li[2]/a
${NutritionalSuppliXpath}  xpath=//*[@id="mega-menu-shop-by"]/li[2]/div/div/div[1]/ul/li/a
${ResponseOnNutrinalSuppliXpath}  xpath=//*[@id="main"]/div/div/div/div[1]/div/h4
${ExpectedResponse}  “Nutritional Supplements” returned 0 results
${CrossIconOnSerachBarXpath}  xpath=//*[@id="navbar-main"]/search-box/div/div/div/div/ee-autocomplete/div/form/button
${SearchBarXpath}  xpath=//*[@id="searchAutocomplete"]
${NegativeInputTextForCategory}  jadwebdehjgff
${PositiveInputTextForCategory}  Ther-Biotic® Complete powder
${SearchIconXpath}  xpath=//*[@id="searchIconBtn"]
${ProductXpath}  xpath=//*[@id="main"]/div/div/div/div[3]/div[2]/div/ul/li/div/product-card/div/div/div[1]/div[2]/h3/a

#Variables for Brand
${BrandXpath}  xpath=//*[@id="mega-menu-shop-by"]/li[3]/a
${BrandImageXpath}  xpath=//*[@id="mega-menu-shop-by"]/li[3]/div/div/div/div[1]/div[1]/div/div[1]/img
${ShopIconXpath}  xpath=//*[@id="mega-menu-shop-by"]/li[3]/div/div/div/div[1]/div[3]/div/div[2]/p/a/span
${NextPageIconXpath}  xpath=//*[@id="main"]/div/div/div/div[3]/div[2]/div/div/paging/div/section/button[2]






*** Test Cases ***


TC_Category_001
     #Open Browser with the Home page URL
     Open Browser  ${URL}  ${Browser}
     Maximize Browser Window

     Wait Until Element Is Visible   ${ShopMenuXpath}
     Click Element    ${ShopMenuXpath}

     Wait Until Element Is Visible  ${CategoryXpath}
     Click Element    ${CategoryXpath}

     Wait Until Element Is Visible  ${NutritionalSuppliXpath}
     Click Element    ${NutritionalSuppliXpath}

TC_Category_002
     # Nutritional Page contains the text “Nutritional Supplements” returned 0 results
     Wait Until Element Is Visible  ${ResponseOnNutrinalSuppliXpath}
     ${ActualResponse}    Get Text    ${ResponseOnNutrinalSuppliXpath}
     Should Be Equal As Strings    ${ActualResponse}   ${ExpectedResponse}

     Capture Page Screenshot


TC_Category_003
     # Click on the search bar
     Wait Until Element Is Visible   ${CrossIconOnSerachBarXpath}
     Click Element    ${CrossIconOnSerachBarXpath}

     Capture Page Screenshot

TC_Category_004
     # Negative input
     wait Until Element Is Visible  ${SearchBarXpath}
     Input text  ${SearchBarXpath}    ${NegativeInputTextForCategory}
     Click Element  ${SearchBarXpath}

     Capture Page Screenshot

TC_Category_005
     # positive input of a product
     wait Until Element Is Visible  ${SearchBarXpath}
     Click Element  ${CrossIconOnSerachBarXpath}
     wait Until Element Is Visible  ${SearchBarXpath}
     Input text  ${SearchBarXpath}  ${PositiveInputTextForCategory}
     Click Element  ${SearchIconXpath}

     Capture Page Screenshot

TC_Category_006
     #Click on  the selected product and land on the selected product information page
     Wait Until Element Is Visible  ${ProductXpath}
     Click Element  ${ProductXpath}

     Capture Page Screenshot

     #Closing Browser
     Close browser


TC_Brand_001
     Open Browser  ${URL}  ${Browser}
     Maximize Browser Window

     Wait Until Element Is Visible   ${ShopMenuXpath}
     Click Element    ${ShopMenuXpath}

TC_Brand_002
     # click on the brand ( sub category )
     Wait Until Element Is Visible  ${BrandXpath}
     Click Element  ${BrandXpath}

TC_Brand_003
     #Checking if the Brand name displays corresponding image
     Page should contain image  ${BrandImageXpath}
     Capture Page Screenshot

     #Page should not contain image  xpath=//*[@id="mega-menu-shop-by"]/li[3]/div/div/div/div[1]/div[1]/div/div[1]/img

TC_Brand_004
     # verify the third feature brand is clickable and directing to the corresponding page
     Wait Until Element Is Visible  ${ShopIconXpath}
     Click Element  ${ShopIconXpath}

TC_Brand_005
     # Verify the next page icon is clickable and direct that to the next page
     Wait Until Element Is Visible  ${NextPageIconXpath}
     Click Element  ${NextPageIconXpath}

     #Closing Browser
     Close Browser








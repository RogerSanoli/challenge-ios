//
//  LodjinhaUITests.swift
//  LodjinhaUITests
//
//  Created by Roger Sanoli on 05/07/19.
//  Copyright © 2019 RogerSanoli. All rights reserved.
//

import XCTest

class LodjinhaUITests: XCTestCase {

    override func setUp() {
        continueAfterFailure = false
        XCUIApplication().launch()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testProductReserve() {
        let app = XCUIApplication()
        sleep(5)
        app/*@START_MENU_TOKEN@*/.tables["BestSellerCell, BestSellerCell, BestSellerCell"]/*[[".otherElements[\"HomeScene\"].tables[\"BestSellerCell, BestSellerCell, BestSellerCell\"]",".tables[\"BestSellerCell, BestSellerCell, BestSellerCell\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.cells["CategoryList"].children(matching: .other).matching(identifier: "CategoryCell").element(boundBy: 0).tap()
        sleep(5)
        app/*@START_MENU_TOKEN@*/.tables["ProductCell, ProductCell, ProductCell, ProductCell, ProductCell, ProductCell"]/*[[".otherElements[\"ProductListScene\"].tables[\"ProductCell, ProductCell, ProductCell, ProductCell, ProductCell, ProductCell\"]",".tables[\"ProductCell, ProductCell, ProductCell, ProductCell, ProductCell, ProductCell\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.children(matching: .staticText).matching(identifier: "ProductCell").element(boundBy: 0).children(matching: .other).element(boundBy: 0).tap()
        sleep(5)
        app/*@START_MENU_TOKEN@*/.buttons["reserveButton"]/*[[".otherElements[\"ProductDetailScene\"].buttons[\"reserveButton\"]",".buttons[\"reserveButton\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.alerts.buttons["OK"].tap()
    }
    
    func testSobre() {
        let app = XCUIApplication()
        sleep(3)
        app.tabBars.buttons["Sobre"].tap()
        XCTAssertTrue(app.staticTexts["Roger dos Santos Oliveira"].exists)
    }
}

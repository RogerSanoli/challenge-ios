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

    /*func testProductDetail() {
                
        let app = XCUIApplication()
        sleep(4)
        app.staticTexts["Mais Vendidos"].tap()
        //children(matching: .other).matching(identifier: "productImage").element(boundBy: 0).tap()
        sleep(4)

        
        //let homesceneElement = XCUIApplication().otherElements["HomeScene"]
        //homesceneElement.tap()
        
        
        
        //let tabBarsQuery = XCUIApplication().tabBars
        //tabBarsQuery.buttons["Sobre"].tap()
        
        //tabBarsQuery.buttons["Home"].tap()
        
        //XCUIDevice.shared.orientation = .portrait
        //XCUIApplication().tables.cells["CategoryList"].children(matching: .other).matching(identifier: "CategoryCell").element(boundBy: 0).tap()
        
        //BestSeller
        
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }*/
    
    func testSobre() {
        let app = XCUIApplication()
        sleep(3)
        app.tabBars.buttons["Sobre"].tap()
        XCTAssertTrue(app.staticTexts["Roger dos Santos Oliveira"].exists)
    }

}

//
//  windsorislamiccouncilUITests.swift
//  windsorislamiccouncilUITests
//
//  Created by may on 2017-08-05.
//  Copyright © 2017 sohaeb. All rights reserved.
//

import XCTest

class windsorislamiccouncilUITests: XCTestCase {
    
    override func setUp() {
        
        super.setUp()
        
        let app = XCUIApplication()
        setupSnapshot(app)
        app.launch()
    }
    
                func testExample() {
           
            let tabBarsQuery = XCUIApplication().tabBars
            snapshot("1Portrait")
            tabBarsQuery.children(matching: .button).element(boundBy: 1).tap()
            snapshot("2Portrait")
            tabBarsQuery.children(matching: .button).element(boundBy: 2).tap()
            snapshot("3Portrait")
            tabBarsQuery.children(matching: .button).element(boundBy: 4).tap()
            snapshot("4Portrait")
            
            
            // 1
//            let app = XCUIApplication()
//            setupSnapshot(app)
//            app.launch()
//            
//            // 2
//            let chipCountTextField = app.textFields["chip count"]
//            chipCountTextField.tap()
//            chipCountTextField.typeText("10")
//            // 3
//            let bigBlindTextField = app.textFields["big blind"]
//            bigBlindTextField.tap()
//            bigBlindTextField.typeText("100")
//            // 4
//            snapshot("01UserEntries")
//            
//            // 5
//            app.buttons["what should i do"].tap()
//            snapshot("02Suggestion")
//            XCUIApplication().tabBars.children(matching: .button).element(boundBy: 1).tap()
    }
    
    
}

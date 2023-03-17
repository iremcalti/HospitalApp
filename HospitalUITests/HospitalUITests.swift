//
//  HospitalUITests.swift
//  HospitalUITests
//
//  Created by İrem Çaltı on 16.08.2022.
//

import XCTest

class HospitalUITests: XCTestCase {

    func testHospital(){
        
        let app = XCUIApplication()
        app.activate()
        let tablesQuery = app.tables
        tablesQuery.cells.containing(.staticText, identifier:"Cleveland Clinic").staticTexts["Show More"].tap()
        tablesQuery.staticTexts["Show Less"].tap()
        tablesQuery.staticTexts["Cleveland Clinic"].tap()
        app.navigationBars["Hospitals"].buttons["Hospitals"].tap()
    
    }
    func testHosp(){
        
        let app = XCUIApplication()
        app.activate()
        app.tables.staticTexts["Mayo Clinic"].tap()
        
        let collectionViewsQuery = app.collectionViews
        collectionViewsQuery.staticTexts["Address"].tap()
        app.scrollViews.otherElements.staticTexts["Call"].tap()
        collectionViewsQuery.staticTexts["Introduction"].tap()
        app.navigationBars["Hospitals"].buttons["Hospitals"].tap()
                
}
    func testCall(){
        
        
        let app = XCUIApplication()
        app.activate()
        app.tables.staticTexts["Mayo Clinic"].tap()
        app.collectionViews.staticTexts["Address"].tap()
        app.scrollViews.otherElements.buttons["Call"].tap()
        app.navigationBars["Hospitals"].buttons["Hospitals"].tap()
        
    }
    
}

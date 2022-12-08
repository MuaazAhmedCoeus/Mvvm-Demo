//
//  CurrencyRateApiUnitTest.swift
//  DemoMVVMTests
//
//  Created by Muaaz on 07/12/2022.
//

import XCTest

@testable import DemoMVVM

class CurrencyRateApiUnitTest: XCTestCase {
    
    func test_CurrencyDetailViewModel_isNotNil_Returns_true() {
        let priceVM = CurrencyViewModel()
        XCTAssertNotNil(priceVM, "The profile view model should not be nil.")
    }
    
    func test_currencyApi_With_NonEmpty_URL_retuns_True() {
        let urlStr = Constants.urlString

        let result = !urlStr.isEmpty
        XCTAssertTrue(result)
    }
    
    func test_CurrencyRate_Api_Returns_CurrencyRate() {
        //let priceVM = CurrencyViewModel()
        let urlStr = Constants.urlString
        let expectation = self.expectation(description: "CurrencyRate_Api_Returns_CurrencyRate")
        Service.sharedInstance.serverCall(urlString: urlStr) { dataResponse in
            guard let currency : CurrencyModel = Service.sharedInstance.decodeData(from: dataResponse) else {return}
           // let currencyDetails = currency.rates
            XCTAssertNotNil(dataResponse) // Api response is not nil
            XCTAssertNotNil(currency) // decoded data is not nil
            expectation.fulfill()
        }
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    
    
    
    
    
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}

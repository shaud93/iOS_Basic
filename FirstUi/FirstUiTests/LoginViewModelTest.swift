//
//  LoginViewModelTest.swift
//  FirstUiTests
//
//  Created by D'Ante Watson on 11/9/23.
//

import XCTest
@testable import FirstUi

final class LoginViewModelTest: XCTestCase {
    
    var loginViewModel:LoginViewModel!

    override func setUpWithError() throws {
        //Given
        loginViewModel = LoginViewModel()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        loginViewModel = nil
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_LoginValidation_WhenExpecteingGood_Results() throws {
        //When
        let result = loginViewModel.LoginValidation(email: "swift@Gmail.com", password: "123456")
        print(result)
        
        //Then
        XCTAssertTrue(result)
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }
    
    func test_LoginValidation_WhenExpecteingBad_Results() throws {
        //When
        let result = loginViewModel.LoginValidation(email: "swiftGmail.com", password: "123456")
        print(result)
        
        //Then
        XCTAssertFalse(result)
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }
    
    func test_LoginValidation_WhenExpecteingBad_Results_Email_is_nil() throws {
        //When
        let result = loginViewModel.LoginValidation(email: nil, password: "123456")
        print(result)
        
        //Then
        XCTAssertFalse(result)
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }
    
    func test_LoginValidation_WhenExpecteingBad_Results_EmailAndPassword_is_nil() throws {
        //When
        let result = loginViewModel.LoginValidation(email: nil, password: nil)
        print(result)
        
        //Then
        XCTAssertFalse(result)
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func test_LoginValidation_WhenExpecteingBad_Results_PassWord_is_TooShort() throws {
        //When
        let result = loginViewModel.LoginValidation(email: "seift@gmail.com", password: "12345")
        print(result)
        
        //Then
        XCTAssertFalse(result)
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

//
//  LoginVieControllerTests.swift
//  Teste ioasys - LailaTests
//
//  Created by Laila Guzzon Hussein Lailota on 28/06/21.
//

import XCTest
@testable import Teste_ioasys___Laila

class LoginVieControllerTests: XCTestCase {

    var storyboard: UIStoryboard!
    var sut: LoginViewController!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard.instantiateViewController(identifier: "LoginViewController") as LoginViewController
        sut.loadViewIfNeeded()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        storyboard = nil
        sut = nil
    }

    
    func testSignupViewController_WhenCreated_HasRequieredTextFieldsEmpty() throws {
        
        let emailTextField = try XCTUnwrap(sut.emailTextField, "The emailTextField is not connected to an IBOutlet")
        let passwordTextField = try XCTUnwrap(sut.passwordTextField, "The passwordTextField is not connected to an IBOutlet")
        
        XCTAssertEqual(emailTextField.text, "", "Email text field was not empty when the view controller initially loaded")
        XCTAssertEqual(passwordTextField.text, "", "Password text field was not empty when the view controller initially loaded")
    }

    
    func testViewController_WhenCreated_HasSignupButtonAndAction() throws {
        // Arrange
        let loginButton: UIButton = try XCTUnwrap(sut.loginButton, "Signup button does not have a referencing outlet")
        
        // Act
        let loginButtonActions = try XCTUnwrap(loginButton.actions(forTarget: sut, forControlEvent: .touchUpInside), "Signup button does not have any actions assigned to it")
        
        // Assert
        XCTAssertEqual(loginButtonActions.count, 1)
        XCTAssertEqual(loginButtonActions.first, "entrarButtonTapped:", "There is no action with a name signupButtonTapped assigned to signup button")
    }
    

}

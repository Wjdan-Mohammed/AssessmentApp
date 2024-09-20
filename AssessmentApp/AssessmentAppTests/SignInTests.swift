

import XCTest
@testable import AssessmentApp

final class SignInTests: XCTestCase {
    
    var viewModel: AuthViewModel!

        override func setUpWithError() throws {
            try super.setUpWithError()
            viewModel = AuthViewModel()
        }

        // Username Validation Tests

        func testUsernameValidation_ValidUsername() {
            viewModel.username = "ValidUser"
            
            XCTAssertTrue(viewModel.isUsernameValid)
            XCTAssertEqual(viewModel.errorMessage, "")
        }

        func testUsernameValidation_InvalidUsername() {
            viewModel.username = "ab"
            
            XCTAssertFalse(viewModel.isUsernameValid)
            XCTAssertEqual(viewModel.errorMessage, "Username must be at least 3 characters long.")
        }

        // Password Validation Tests

        func testPasswordValidation_ValidPassword() {
            viewModel.password = "Password1@"
            
            XCTAssertTrue(viewModel.isPasswordValid)
            XCTAssertEqual(viewModel.errorMessage, "")
        }

        func testPasswordValidation_InvalidPassword_MissingUppercase() {
            viewModel.password = "password1@"
            
            XCTAssertFalse(viewModel.isPasswordValid)
            XCTAssertEqual(viewModel.errorMessage, "Password must contain at least 6 characters, 1 uppercase letter, 1 lowercase letter, @ symbol and a numeric digit.")
        }

        func testPasswordValidation_InvalidPassword_MissingSpecialCharacter() {
            viewModel.password = "Password1"
            
            XCTAssertFalse(viewModel.isPasswordValid)
            XCTAssertEqual(viewModel.errorMessage, "Password must contain at least 6 characters, 1 uppercase letter, 1 lowercase letter, @ symbol and a numeric digit.")
        }

        func testPasswordValidation_InvalidPassword_TooShort() {
            viewModel.password = "P1@"
            
            XCTAssertFalse(viewModel.isPasswordValid)
            XCTAssertEqual(viewModel.errorMessage, "Password must contain at least 6 characters, 1 uppercase letter, 1 lowercase letter, @ symbol and a numeric digit.")
        }

        // Button Disabled State Tests

        func testButtonDisabled_ValidUsernameAndPassword() {
            viewModel.username = "ValidUser"
            viewModel.password = "Password1@"
            
            XCTAssertFalse(viewModel.isButtonDisabled())
        }

        func testButtonDisabled_InvalidUsername() {
            viewModel.username = "ab"
            viewModel.password = "Password1@"
            
            XCTAssertTrue(viewModel.isButtonDisabled())
        }

        func testButtonDisabled_InvalidPassword() {
            viewModel.username = "ValidUser"
            viewModel.password = "pas1@"
            
            XCTAssertTrue(viewModel.isButtonDisabled())
        }
    
    func testSignIn_InvalidResponse() async {
        
        viewModel.username = "not_admin"
        viewModel.password = "wrong_password"
        
        let result = await viewModel.signIn()
        
        XCTAssertFalse(result)
    }
    
}

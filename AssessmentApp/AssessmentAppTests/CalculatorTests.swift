//
//  CalculatorTests.swift
//  AssessmentAppTests
//
//  Created by WjdanMo on 20/09/2024.
//

import XCTest
@testable import AssessmentApp

final class CalculatorTests: XCTestCase {
    
    var viewModel: CalculatorViewModel!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        viewModel = CalculatorViewModel()
    }
    
    // Valid Division Tests
    func testDivideNumbers_ValidInput() {
        viewModel.dividend = "10"
        viewModel.divisor = "2"
        
        viewModel.divideNumbers()
        
        XCTAssertEqual(viewModel.result, "5.0")
    }
    
    func testDivideNumbers_ValidInputWithDecimals() {
        viewModel.dividend = "7.5"
        viewModel.divisor = "2.5"
        
        viewModel.divideNumbers()
        
        XCTAssertEqual(viewModel.result, "3.0")
    }
    
    // Division by Zero Tests
    func testDivideNumbers_ZeroDivisor() {
        viewModel.dividend = "10"
        viewModel.divisor = "0"
        
        viewModel.divideNumbers()
        
        XCTAssertEqual(viewModel.result, "Error: Division by zero")
    }
    
    // Invalid Input Tests
    func testDivideNumbers_InvalidDividend() {
        viewModel.dividend = "ten"
        viewModel.divisor = "2"
        
        viewModel.divideNumbers()
        
        XCTAssertEqual(viewModel.result, "Error: Invalid input")
    }
    
    func testDivideNumbers_InvalidDivisor() {
        viewModel.dividend = "10"
        viewModel.divisor = "two"
        
        viewModel.divideNumbers()
        
        XCTAssertEqual(viewModel.result, "Error: Invalid input")
    }
    
    func testDivideNumbers_BothInputsInvalid() {
        viewModel.dividend = "abc"
        viewModel.divisor = "xyz"
        
        viewModel.divideNumbers()
        
        XCTAssertEqual(viewModel.result, "Error: Invalid input")
    }
    
    // MARK: - Edge Cases
    func testDivideNumbers_EmptyInputs() {
        viewModel.dividend = ""
        viewModel.divisor = ""
        
        viewModel.divideNumbers()
        
        XCTAssertEqual(viewModel.result, "Error: Invalid input")
    }
    
}

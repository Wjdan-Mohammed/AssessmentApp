//
//  CalculatorViewModel.swift
//  AssessmentApp
//
//  Created by WjdanMo on 20/09/2024.
//

import Foundation

class CalculatorViewModel: ObservableObject {
    @Published var dividend: String = ""
    @Published var divisor: String = ""
    @Published var result: String = ""
    
    func divideNumbers() {
        guard let dividend = Double(self.dividend),
              let divisor = Double(divisor) else {
            result = "Error: Invalid input"
            return
        }
        
        if divisor == 0 {
            result = "Error: Division by zero"
        } else {
            result = String(dividend / divisor)
        }
    }
}

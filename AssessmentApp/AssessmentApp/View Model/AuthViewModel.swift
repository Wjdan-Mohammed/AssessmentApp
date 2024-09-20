//
//  AuthViewModel.swift
//  AssessmentApp
//
//  Created by WjdanMo on 20/09/2024.
//

import Foundation

class AuthViewModel: ObservableObject{
    
    @Published var username = "" {
        didSet { self.validateUsername() }
    }

    @Published var password = "" {
        didSet { self.validatePassword() }
    }
    @Published var errorMessage = ""
    @Published var isSignedIn = false
    var isUsernameValid = false
    var isPasswordValid = false
    
    func isButtonDisabled() -> Bool{
        return !(isUsernameValid && isPasswordValid)
    }
    
    func validateUsername()  {
        if username.count >= 3 {
            errorMessage = ""
            isUsernameValid = true
        }
        else{
            errorMessage = "Username must be at least 3 characters long."
            isUsernameValid = false
        }

    }
    
    func validatePassword() {
        let passwordRegex = #"^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@]).{6,}$"#
        if NSPredicate(format: "SELF MATCHES %@", passwordRegex).evaluate(with: password) {
            errorMessage = ""
            isPasswordValid = true
        } else {
            errorMessage = "Password must contain at least 6 characters, 1 uppercase letter, 1 lowercase letter, @ symbol and a numeric digit."
            isPasswordValid = false
        }
    }
    
    func signIn() async -> Bool{
        guard let url = URL(string: "https://20fc9164-96ce-460c-881e-4d254636120d.mock.pstmn.io/login") else {
            return false
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let loginData = ["username": username, "password": password]
        guard let httpBody = try? JSONSerialization.data(withJSONObject: loginData) else {
            return false
        }
        request.httpBody = httpBody
        
        do {
            let (_, response) = try await URLSession.shared.data(for: request)
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                return false
            }
            isSignedIn = true
            return true
            
        } catch {
            return false
        }
    }
}

//
//  UserViewModel.swift
//  AssessmentApp
//
//  Created by WjdanMo on 20/09/2024.
//

import Foundation

class UserViewModel: ObservableObject {
    @Published var users: [User] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil
    
    func fetchUsers() {
        guard let url = URL(string: "https://pastebin.com/raw/wgkJgazE") else {
            errorMessage = "Invalid URL :/"
            return
        }
        
        isLoading = true
        errorMessage = nil
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            DispatchQueue.main.async {
                self.isLoading = false
                
                if let error = error {
                    self.errorMessage = "Error fetching users :/: \(error.localizedDescription)"
                    return
                }
                
                guard let data = data else {
                    self.errorMessage = "data not found :/"
                    return
                }
                
                do {
                    let userResponses = try JSONDecoder().decode([UserResponse].self, from: data)
                    self.users = userResponses.map { $0.user }
                } catch {
                    self.errorMessage = "Failed to decode :/: \(error.localizedDescription)"
                }
            }
        }.resume()
    }
}


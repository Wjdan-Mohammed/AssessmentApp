//
//  ContentView.swift
//  AssessmentApp
//
//  Created by WjdanMo on 18/09/2024.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = AuthViewModel()
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 16){
                
                TextField("Username", text: $viewModel.username)
                    .padding(.leading)
                    .frame(maxWidth: .infinity, maxHeight: 40)
                
                    .overlay(
                        RoundedRectangle(cornerRadius: 6)
                            .stroke(Color.gray, lineWidth: 1)
                    )
                    .frame(maxWidth: .infinity, maxHeight: 40)
                
                TextField("Password", text: $viewModel.password)
                    .padding(.leading)
                    .frame(maxWidth: .infinity, maxHeight: 40)
                    .overlay(
                        RoundedRectangle(cornerRadius: 6)
                            .stroke(Color.gray, lineWidth: 1)
                    )
                    .frame(maxWidth: .infinity, maxHeight: 40)
                
                if !viewModel.errorMessage.isEmpty{
                    Text(viewModel.errorMessage)
                        .foregroundColor(.red)
                }
                Button(action: {
                    
                    Task {
                        await viewModel.signIn()
                    }
                }) {
                    Text("Sign In").bold()
                }
                .disabled(viewModel.isButtonDisabled())
                .frame(maxWidth: .infinity, maxHeight: 40)
                .background(viewModel.isButtonDisabled() ? Color.secondary : Color.blue)
                .foregroundColor(.white)
                .cornerRadius(6)
                
            }
            .navigationDestination(isPresented: $viewModel.isSignedIn) {
                MainTabView()
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}



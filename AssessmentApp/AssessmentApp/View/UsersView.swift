//
//  UsersView.swift
//  AssessmentApp
//
//  Created by WjdanMo on 20/09/2024.
//

import Foundation
import SwiftUI

struct UsersView: View {
    @StateObject private var viewModel = UserViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                if viewModel.isLoading {
                    ProgressView("Loading ..")
                } else if let errorMessage = viewModel.errorMessage {
                    Text(errorMessage).foregroundColor(.red)
                } else {
                    List(viewModel.users) { user in
                        HStack {
                            AsyncImage(url: URL(string: user.profileImage.large)) { image in
                                image.resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 50, height: 50)
                                    .clipShape(Circle())
                            } placeholder: {
                                ProgressView()
                            }
                            .frame(width: 50, height: 50)
                            
                            Text(user.name)
                                .font(.headline)
                                .padding(.leading, 10)
                        }
                        .padding(.vertical, 2)
                    }
                }
            }
            .onAppear {
                viewModel.fetchUsers()
            }
            .navigationTitle("Users")
        }
    }
}

#Preview {
    UsersView()
}


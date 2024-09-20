//
//  UserModel.swift
//  AssessmentApp
//
//  Created by WjdanMo on 20/09/2024.
//

import Foundation

struct UserResponse: Codable {
    let user: User
}

struct User: Codable, Identifiable {
    let id: String
    let name: String
    let profileImage: ProfileImage
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case profileImage = "profile_image"
    }
}

struct ProfileImage: Codable {
    let large: String
}

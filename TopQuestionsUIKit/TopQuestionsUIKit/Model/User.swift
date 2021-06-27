//
//  User.swift
//  TopQuestionsUIKit
//
//  Created by Jesus Cruz on 25/06/21.
//
import Foundation
import UIKit

// MARK: - User
struct User {
    let name: String?
    let reputation: Int?
    let profileImageURL: URL?
    var profileImage: UIImage?
}

extension User: Decodable {
    enum CodingKeys: String, CodingKey {
        case reputation
        case name = "display_name"
        case profileImageURL = "profile_image"
    }
}

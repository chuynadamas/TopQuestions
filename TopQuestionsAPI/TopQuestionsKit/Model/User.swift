//
//  User.swift
//  TopQuestionsUIKit
//
//  Created by Jesus Cruz on 25/06/21.
//
import Foundation
import UIKit

// MARK: - User
public struct User {
    public let name: String?
    public let reputation: Int?
    public let profileImageURL: URL?
    public var profileImage: UIImage?
}

extension User: Decodable {
    enum CodingKeys: String, CodingKey {
        case reputation
        case name = "display_name"
        case profileImageURL = "profile_image"
    }
}

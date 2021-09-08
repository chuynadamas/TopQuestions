//
//  User.swift
//  TopQuestionsUIKit
//
//  Created by Jesus Cruz on 25/06/21.
//
import Foundation
import UIKit

// MARK: - User
public struct User: Codable {
    public let name: String?
    public let reputation: Int?
    public let profileImageURL: URL?
    public var profileImage: UIImage?
    
    enum CodingKeys: String, CodingKey {
        case name = "display_name"
        case reputation = "reputation"
        case profileImageURL = "profile_image"
    }
}

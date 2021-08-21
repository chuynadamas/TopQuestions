//
//  Formatting.swift
//  TopQuestionsUIKit
//
//  Created by Jesus Cruz on 25/06/21.
//
import Foundation
import SwiftUI

public extension Int {
    var thousandsFormatting: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        let number = self > 1000
            ? NSNumber(value: Float(self) / 1000)
            : NSNumber(value: self)
        let strings = formatter.string(from: number)!.split(separator: ".")
        if strings.count > 1 {
            return strings[0]+"K"
        } else {
            return String(strings[0])
        }
    }
}

public extension Date {
    var formatted: String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter.string(from: self)
    }
}

public extension Color {
    static var teal: Color {
        Color(UIColor.systemTeal)
    }
}

//
//  PasswordModel.swift
//  PasswordGenerator
//
//  Created by Göktug Yeşil on 21.09.2023.
//

import Foundation
import SwiftUI

struct Password: Identifiable, Codable {
    var id = UUID()
    var password: String
    var symbols: Bool
    var uppercase: Bool
    
    var levelColor: Color{
        var level = 0
        var color: Color
        
        if symbols {
            level += 1
        }
        if uppercase {
            level += 1
        }
        if password.count > 12 {
            level += 1
        } else if password.count < 8 {
            level += 1
        }
        switch level {
        case 1: color = .green
        case 2: color = .yellow
        case 3: color = .red
        default: color = .gray
        }
        
        return color
    }
}

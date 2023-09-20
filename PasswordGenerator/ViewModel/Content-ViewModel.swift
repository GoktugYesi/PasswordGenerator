//
//  Content-ViewModel.swift
//  PasswordGenerator
//
//  Created by Göktug Yeşil on 21.09.2023.
//

import Foundation
import SwiftUI

extension ContentView {
    class ViewModel: ObservableObject {
        @Published var passwords: [Password] = []
        @Published var symbols = true
        @Published var uppercase = false
        @Published var length = 10
        
        init() {
            createPassword()
        }
        
        func createPassword() {
            let alphabet = "abcdefghijklmnopqrstuvwxyz"
            var base = alphabet + "1234567890"
            var newPassword = ""
            
            if symbols {
                base += "!@#$%^&*()-_=+[]{}|;:,.<>?/`~|"
            }
            if uppercase {
                base += alphabet.uppercased()
            }
            for _ in 0..<length {
                let randChar = base.randomElement()!
                newPassword += String(randChar)
            }
            
            let password = Password(password: newPassword, symbols: symbols, uppercase: uppercase)
            
            withAnimation{
               passwords.insert(password, at: 0)
            }
        }
        
    }
}

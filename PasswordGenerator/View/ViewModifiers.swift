//
//  ViewModifiers.swift
//  PasswordGenerator
//
//  Created by Göktug Yeşil on 21.09.2023.
//

import Foundation
import SwiftUI

extension View {
    func centerH() -> some View {
        HStack {
            Spacer()
            self
            Spacer()
        }
    }
    
    func addNavigationView(title: String) -> some View {
        NavigationView {
            self
                .navigationTitle(title)
        }
    }
}

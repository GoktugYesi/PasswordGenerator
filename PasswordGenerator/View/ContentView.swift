//
//  ContentView.swift
//  PasswordGenerator
//
//  Created by Göktug Yeşil on 20.09.2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var vm = ViewModel()
    
    var body: some View {
        Form{
            Section("Ayarlar") {
                Toggle("Semboller", isOn: $vm.symbols)
                Toggle("Büyük Harfler", isOn: $vm.uppercase)
                Stepper("Karakter Sayısı \(vm.length)", value: $vm.length, in: 6...18)
                Button("Şifre Oluştur", action: vm.createPassword)
                    .centerH()
            }
            Section("Şifrelerim") {
                List(vm.passwords) { password in
                    HStack {
                        Text("\(password.password)")
                            .padding()
                            .textSelection(.enabled)
                        Spacer()
                        Image(systemName: "lock.fill")
                            .foregroundColor(password.levelColor)
                    }
                }
            }
        }
        .addNavigationView(title: "Şifre Oluşturucu")
    }
}

#Preview {
    ContentView()
}

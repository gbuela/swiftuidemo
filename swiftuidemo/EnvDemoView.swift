//
//  EnvDemoView.swift
//  examples
//
//  Created by German Buela on 01/11/2019.
//  Copyright © 2019 German Buela. All rights reserved.
//

import SwiftUI

class UserSettings: ObservableObject {
    @Published var largeText: Bool = false
    @Published var darkMode: Bool = false
    
    var bkgColor: Color { darkMode ? .black : .white }
    var fgColor: Color { darkMode ? .white : .black }
    var font: Font { largeText ? .title : .body }
}

struct EnvDemoView: View {
    @EnvironmentObject var userSettings: UserSettings
    var body: some View {
        NavigationView {
            VStack {
                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")
                    .font(userSettings.font)
                    .foregroundColor(userSettings.fgColor)
                NavigationLink(destination: SettingsView()) {
                    Image(systemName: "gear")
                }
                Spacer()
            }
            .padding()
            .navigationBarTitle("EnvironmentObject Demo", displayMode: .inline)
            .background(userSettings.bkgColor)
            .edgesIgnoringSafeArea(Edge.Set.bottom)
        }
    }
}

struct SettingsView: View {
    @EnvironmentObject var userSettings: UserSettings
    var body: some View {
        VStack {
            Toggle(isOn: $userSettings.largeText) {
                Text("Texto grande")
                    .font(userSettings.font)
                    .foregroundColor(userSettings.fgColor)
                
            }
            Toggle(isOn: $userSettings.darkMode) {
                Text("Modo oscuro")
                    .font(userSettings.font)
                    .foregroundColor(userSettings.fgColor)
            }
            Spacer()
        }
        .padding()
        .background(userSettings.bkgColor)
        .edgesIgnoringSafeArea(Edge.Set.bottom)
        .navigationBarTitle("Ajustes", displayMode: .inline)
    }
}








//struct DynamicText: View {
//    let text: String
//    @EnvironmentObject var userSettings: UserSettings
//
//    init(_ text: String) { self.text = text }
//
//    var body: some View {
//        Text(text)
//            .font(userSettings.font)
//            .foregroundColor(userSettings.fgColor)
//    }
//}

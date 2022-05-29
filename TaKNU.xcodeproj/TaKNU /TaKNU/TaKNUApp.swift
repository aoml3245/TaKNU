//
//  TaKNU_1App.swift
//  TaKNU-1
//
//  Created by 맥북프로 M1 on 2022/04/29.
//

import SwiftUI
import Firebase 

@main
struct TaKNU_1App: App {
    
    @StateObject var viewModel = AuthViewModel()
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
            ContentView()
                    .environmentObject(viewModel)
            }
        }
    }
}

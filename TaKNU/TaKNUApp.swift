//
//  TaKNUApp.swift
//  TaKNU
//
//  Created by 서명원 on 2022/04/27.
//

import SwiftUI
import Firebase

@main
struct TaKNUApp: App {
    init() {
        FirebaseApp.configure() // 코드 추가
    }
    var body: some Scene {
        WindowGroup {
            tabView(viewRouter: ViewRouter(), tabIndex: .home, rentDate: Date(), returnDate: Date(), rentItem: "charger")
//            MainView(viewRouter: ViewRouter())
        }
    }
}

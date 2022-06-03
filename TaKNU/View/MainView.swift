//
//  MainView.swift
//  TaKNU
//
//  Created by 서명원 on 2022/06/03.
//

import SwiftUI

struct MainView: View {
    @ObservedObject var viewRouter : ViewRouter
    
    var body: some View {
        VStack{
            if viewRouter.currentPage == "LoginView"{
                LoginView(viewRouter : viewRouter)
            }
            else if viewRouter.currentPage == "tabView"{
                tabView(viewRouter: viewRouter, tabIndex: .home)
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(viewRouter: ViewRouter())
    }
}

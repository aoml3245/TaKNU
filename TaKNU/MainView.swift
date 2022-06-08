//
//  MainView.swift
//  TaKNU
//
//  Created by 서명원 on 2022/06/03.
//

import SwiftUI

struct MainView: View {
    @ObservedObject var viewRouter : ViewRouter
    @ObservedObject var rentViewModel : rentViewModel
    var selectTab: ViewRouter.TabIndex {
        viewRouter.tabIndex
    }
    
    var body: some View {
        VStack{
            if viewRouter.currentPage == "LoginView"{
                LoginView(viewRouter : viewRouter)
            }
            else if viewRouter.currentPage == "RegistrationView"{
                RegistrationView()
            }
            else if viewRouter.currentPage == "rentView"{
                rentView(viewRouter: viewRouter, rentViewModel: rentViewModel)
            }
            else{
                GeometryReader{ proxy in
                    ZStack(alignment: .bottom){
                        if viewRouter.currentPage == "menuView"{
                            menuView(viewRouter: viewRouter, rentViewModel: rentViewModel)
                            tabView(viewRouter: viewRouter, rentViewModel: rentViewModel, proxy: proxy,houseColor: .green, rentColor: .gray, settingColor: .gray)
                        }
                        else if viewRouter.currentPage == "currentRentStateView" {
                            currentRentStateView(viewRouter: viewRouter)
                            tabView(viewRouter: viewRouter, rentViewModel: rentViewModel,proxy: proxy,houseColor: .gray, rentColor: .purple, settingColor: .gray)
                        }
                        else if viewRouter.currentPage == "MySettingView" {
                            MySettingView()
                            tabView(viewRouter: viewRouter, rentViewModel: rentViewModel,proxy: proxy,houseColor: .gray, rentColor: .gray, settingColor: .blue)
                        }
                        
                    }
                }
            }
        }
    }
}



struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(viewRouter: ViewRouter(), rentViewModel: rentViewModel())
    }
}

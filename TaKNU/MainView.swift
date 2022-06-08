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
    
    
    func changeMyView(tabIndex: ViewRouter.TabIndex){
        switch tabIndex {
        case .home:
            viewRouter.currentPage = "menuView"
        case .rent:
            viewRouter.currentPage = "currentRentStateView"
        case .setting:
            viewRouter.currentPage = "MySettingView"
        }
    }
    
    func changeIconColor(tabIndex: ViewRouter.TabIndex) -> Color{
        switch tabIndex{
        case .home:
            return .green
        case .rent:
            return .purple
        case .setting:
            return .blue
        }
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
                rentView(viewRouter: viewRouter)
            }
            else{
                GeometryReader{ proxy in
                    ZStack(alignment: .bottom){
                        if viewRouter.currentPage == "menuView"{
                            menuView(viewRouter: viewRouter, rentViewModel: rentViewModel)
                        }
                        else if viewRouter.currentPage == "currentRentStateView" {
                            currentRentStateView(viewRouter: viewRouter)
                        }
                        else if viewRouter.currentPage == "MySettingView" {
                            MySettingView()
                        }
                        VStack(spacing: 0){
                            HStack(spacing: 0){
                                Button(action:{
                                    viewRouter.tabIndex = .home
                                    viewRouter.currentPage = "menuView"
                                }){
                                    Image(systemName: "house.fill")
                                        .font(.system(size: 25))
                                        .foregroundColor(viewRouter.tabIndex == .home ? self.changeIconColor(tabIndex: viewRouter.tabIndex) : .gray)
                                        .frame(width: proxy.size.width/3, height: 50)
                                }.background(.white)
                                Button(action:{
                                    viewRouter.tabIndex = .rent
                                    viewRouter.currentPage = "currentRentStateView"
                                    
                                    
                                }){
                                    Image(systemName: "archivebox.fill")
                                        .font(.system(size: 25))
                                        .foregroundColor(viewRouter.tabIndex == .rent ? self.changeIconColor(tabIndex: viewRouter.tabIndex) : .gray)
                                        .frame(width: proxy.size.width/3, height: 50)
                                }.background(.white)
                                Button(action:{
                                    
                                    viewRouter.tabIndex = .setting
                                    viewRouter.currentPage = "MySettingView"
                                    
                                }){
                                    Image(systemName: "person.crop.circle.fill")
                                        .font(.system(size: 25))
                                        .foregroundColor(viewRouter.tabIndex == .setting ? self.changeIconColor(tabIndex: viewRouter.tabIndex) : .gray)
                                        .frame(width: proxy.size.width/3, height: 50)
                                }.background(.white)
                            }
                            Rectangle()
                                .foregroundColor(.white)
                                .frame(height: 20)
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

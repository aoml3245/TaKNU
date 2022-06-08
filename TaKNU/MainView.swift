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
//
//    func changeIconColor(tabIndex: ViewRouter.TabIndex) -> Color{
//        switch tabIndex{
//        case .home:
//            return .green
//        case .rent:
//            return .purple
//        case .setting:
//            return .blue
//        }
//    }
    
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

struct tabView: View{
    @ObservedObject var viewRouter : ViewRouter
    @ObservedObject var rentViewModel : rentViewModel
    var proxy : GeometryProxy
    var houseColor: Color = Color.gray
    var rentColor: Color = Color.gray
    var settingColor: Color = Color.gray
    
    var body: some View{
        VStack(spacing: 0){
            HStack(spacing: 0){
                Button(action:{
                    viewRouter.tabIndex = .home
                    viewRouter.currentPage = "menuView"
                }){
                    Image(systemName: "house.fill")
                        .font(.system(size: 25))
                        .foregroundColor(houseColor)
                        .colorMultiply(houseColor)
                        .frame(width: proxy.size.width/3, height: 50)
                }.background(.white)
                Button(action:{
                    viewRouter.tabIndex = .rent
                    viewRouter.currentPage = "currentRentStateView"
                }){
                    Image(systemName: "archivebox.fill")
                        .font(.system(size: 25))
                        .foregroundColor(rentColor)
                        .colorMultiply(rentColor)
                        .frame(width: proxy.size.width/3, height: 50)
                }.background(.white)
                Button(action:{
                    viewRouter.tabIndex = .setting
                    viewRouter.currentPage = "MySettingView"
                }){
                    Image(systemName: "person.crop.circle.fill")
                        .font(.system(size: 25))
                        .foregroundColor(settingColor)
                        .colorMultiply(settingColor)
                        .frame(width: proxy.size.width/3, height: 50)
                }.background(.white)
            }
            Rectangle()
                .foregroundColor(.white)
                .frame(height: 20)
        }
    }
    
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(viewRouter: ViewRouter(), rentViewModel: rentViewModel())
    }
}

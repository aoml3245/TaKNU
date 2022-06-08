////
////  tabView.swift
////  TaKNU
////
////  Created by 박상원 on 2022/05/11.
////
//import SwiftUI
//
//enum TabIndex{
//    case home, rent, setting
//}
//
//struct tabView: View{
//    @ObservedObject var viewRouter : ViewRouter
//    @State var tabIndex: TabIndex = .home
//
//
//    func changeMyView(tabIndex: TabIndex){
//        switch tabIndex {
//        case .home:
//            viewRouter.currentPage = "menuView"
//        case .rent:
//            viewRouter.currentPage = "currentRentStateView"
//        case .setting:
//            viewRouter.currentPage = "MySettingView"
//        }
//    }
//
//    func changeIconColor(tabIndex: TabIndex) -> Color{
//        switch tabIndex{
//        case .home:
//            return .green
//        case .rent:
//            return .purple
//        case .setting:
//            return .blue
//        }
//    }
//
//    var body: some View{
//        GeometryReader{ proxy in
//            ZStack(alignment: .bottom){
////                self.changeMyView(tabIndex: self.tabIndex)
//                VStack(spacing: 0){
//                    HStack(spacing: 0){
//                        Button(action:{
//                                self.tabIndex = .home
//                        }){
//                            Image(systemName: "house.fill")
//                                .font(.system(size: 25))
//                                .foregroundColor(self.tabIndex == .home ? self.changeIconColor(tabIndex: self.tabIndex) : .gray)
//                                .frame(width: proxy.size.width/3, height: 50)
//                        }.background(.white)
//                        Button(action:{
//
//                                self.tabIndex = .rent
//
//                        }){
//                            Image(systemName: "archivebox.fill")
//                                .font(.system(size: 25))
//                                .foregroundColor(self.tabIndex == .rent ? self.changeIconColor(tabIndex: self.tabIndex) : .gray)
//                                .frame(width: proxy.size.width/3, height: 50)
//                        }.background(.white)
//                        Button(action:{
//
//                                self.tabIndex = .setting
//
//                        }){
//                            Image(systemName: "person.crop.circle.fill")
//                                .font(.system(size: 25))
//                                .foregroundColor(self.tabIndex == .setting ? self.changeIconColor(tabIndex: self.tabIndex) : .gray)
//                                .frame(width: proxy.size.width/3, height: 50)
//                        }.background(.white)
//                    }
//                    Rectangle()
//                        .foregroundColor(.white)
//                        .frame(height: 20)
//                }
//            }
//        }
//        .edgesIgnoringSafeArea(.bottom)
//    }
//}
//
//struct tabView_Previews: PreviewProvider {
//    static var previews: some View {
//        tabView(viewRouter: ViewRouter())
//    }
//}

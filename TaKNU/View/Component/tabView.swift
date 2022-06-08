////
////  tabView.swift
////  TaKNU
////
////  Created by 박상원 on 2022/05/11.
////
import SwiftUI

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
//
//struct tabView_Previews: PreviewProvider {
//    static var previews: some View {
//        tabView(viewRouter: ViewRouter())
//    }
//}

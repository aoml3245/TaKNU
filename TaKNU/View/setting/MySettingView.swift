//
//  MySettingView.swift
//  TaKNU
//
//  Created by 박상원 on 2022/05/11.
//
import SwiftUI
import Firebase

struct MySettingView : View{
        @ObservedObject var viewRouter : ViewRouter
        @State var alarmState: Bool = true
        var body: some View {
            VStack{
                List{
                    Section(header: Text("설정")
                        .font(.system(size: 35, weight: .bold)).foregroundColor(.black)
                        .padding(.bottom, 10))
                    {
                        Text("사용자명")

                        Button(action: {
                                try? Auth.auth().signOut()
                            viewRouter.currentPage = "LoginView"
                        }) {
                            Text("로그아웃")
                        }
                        
                    }
                }
            }
        }
    
}


struct MySettingView_Previews: PreviewProvider {
    static var previews: some View {
        MySettingView(viewRouter: ViewRouter())
    }
}

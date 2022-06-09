//
//  MySettingView.swift
//  TaKNU
//
//  Created by 박상원 on 2022/05/11.
//
import SwiftUI

struct MySettingView : View{
    //    @ObservedObject var viewRouter : ViewRouter
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
                        // action
                    }) {
                        Text("로그아웃")
                    }
                    Button(action: {
                        // action
                    }) {
                        Text("탈퇴")
                    }
                }
            }
        }
    }
}

struct MySettingView_Previews: PreviewProvider {
    static var previews: some View {
        MySettingView()
    }
}

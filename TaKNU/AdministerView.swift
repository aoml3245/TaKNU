//
//  AdministerView.swift
//  TaKNU
//
//  Created by jae hong on 2022/04/30.
//

import SwiftUI

struct AdministerView: View {
    var body: some View {
        VStack {
            HStack{
                Text("< Back")
                    .padding(10)

                Spacer()
                Text("관리자")
                    .padding(10)
                Spacer()
            }
            Spacer()
            HStack {
                NavigationLink(destination: settingView()) {
                    Text("물품 관리")
                }.padding(20)
                NavigationLink(destination: settingView()) {
                    Text("사용자 관리")
                }.padding(20)
            }
           .padding(10)
            Spacer()
            HStack {
                NavigationLink(destination: settingView()) {
                    Text("대여자 확인")
                }.padding(20)
                NavigationLink(destination: settingView()) {
                    Text("연체 기록 확인")
                }.padding(20)
            }
            .padding(10)
           Spacer()
        }
    }
}


struct AdministerView_Previews: PreviewProvider {
    static var previews: some View {
        AdministerView()
    }
}

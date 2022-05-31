//
//  ContentView.swift
//  TaKNU
//
//  Created by 서명원 on 2022/04/27.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView() {
            List {
//                NavigationLink(
//                    destination: currentRentStateView(rentItem: "충전기"),
//                    label: {
//                        Text("대여 현황")
//                    })
//                NavigationLink(
//                    destination: menuView(),
//                    label: {
//                        Text("메뉴")
//                    })
//                NavigationLink(
//                    destination: rentView(rentItem: "충전기"),
//                    label: {
//                        Text("대여하기")
//                    })
                NavigationLink(
                    destination: overdueView(),
                    label: {
                        Text("내 연체 기록")
                    })
                NavigationLink(
                    destination: settingView(),
                    label: {
                        Text("설정")
                    })
                NavigationLink(
                    destination: AdministerView(),
                    label: {
                        Text("관리자 메뉴")
                    })
                NavigationLink(
                    destination: CheckOverdueView(),
                    label: {
                        Text("연체 확인")
                    })
                NavigationLink(
                    destination: RenderListView(),
                    label: {
                        Text("연체자 목록")
                    })
                NavigationLink(
                    destination: UserManage(),
                    label: {
                        Text("사용자 관리")
                    })
            }.navigationBarHidden(true)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

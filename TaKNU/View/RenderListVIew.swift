//
//  UserManageView.swift
//  TaKNU
//
//  Created by jae hong on 2022/04/30.
//

import SwiftUI

struct RenderListView: View {
//    @ObservedObject var viewRouter : ViewRouter
    var body: some View {
        VStack{
            List{
                UserRecord(name: "김재홍", grade: 3, major: "컴퓨터공학")
                UserRecord(name: "부반손", grade: 3, major: "컴퓨터공학")
                UserRecord(name: "박상원", grade: 3, major: "전자공학")
                UserRecord(name: "서명원", grade: 3, major: "컴퓨터공학")
            }
        }
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("연체 기록")
                    .font(.system(size: 20, weight: .semibold))
                    .accessibilityAddTraits(.isHeader)
            }
        }
    }
}

struct UserRecord: View{
    var name: String
    var grade: Int
    var major: String
    
    var body: some View{
        HStack{
            Text("이름: \(name)")
            Text("\(grade)학년")
            Text("\(major)")
        }
    }
}

struct RenderListView_Previews: PreviewProvider {
    static var previews: some View {
        RenderListView()
    }
}

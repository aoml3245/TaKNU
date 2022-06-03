//
//  overdueView.swift
//  TaKNU
//
//  Created by 서명원 on 2022/04/27.
//

import SwiftUI

struct overdueView: View {
    @ObservedObject var viewRouter : ViewRouter
    var body: some View {
        VStack{
            HStack{
                Button(action: {
                    // action
                }) {
                    Text("뒤로 가기")
                }
                Spacer()
                Text("연체 기록")
                Spacer()
            }
            
            List{
                overdueRecord(thing: "대여 뭄품", takeTime: Date(), returnTime: Date())
                overdueRecord(thing: "대여 뭄품", takeTime: Date(), returnTime: Date())
                overdueRecord(thing: "대여 뭄품", takeTime: Date(), returnTime: Date())
                overdueRecord(thing: "대여 뭄품", takeTime: Date(), returnTime: Date())
            }
        }
    }
}

struct overdueRecord: View{
    var thing: String
    var takeTime: Date
    var returnTime: Date
    
    var body: some View{
        HStack{
            Text("\(thing)")
            Text("\(takeTime)")
            Text("\(returnTime)")
        }
    }
}

struct overdueView_Previews: PreviewProvider {
    static var previews: some View {
        overdueView()
    }
}

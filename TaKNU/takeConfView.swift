//
//  takeConf.swift
//  TaKNU
//
//  Created by 서명원 on 2022/04/27.
//

import SwiftUI

struct takeConfView: View {
    var body: some View {
        VStack{
            HStack{
                Button(action: {
                    // action
                }) {
                    Text("뒤로 가기")
                }
                Spacer()
                Text("대여 현황")
                Spacer()
            }
            
            List{
                record(thing: "대여 뭄품", takeTime: Date())
            }
        }
    }
}

struct record: View{
    var thing: String
    var takeTime: Date
    
    var body: some View{
        HStack{
            Text("\(thing)")
            Text("\(takeTime)")
        }
    }
}

struct takeConf_Previews: PreviewProvider {
    static var previews: some View {
        takeConfView()
    }
}

//
//  RentView.swift
//  taknu
//
//  Created by 박상원 on 2022/05/01.
//

import SwiftUI

struct returnView: View {
    @State var isChecked:Bool = false
    func toggle(){isChecked = !isChecked}
    var body: some View {
        VStack{
            banner()
            Form{
                HStack{
                    Text("대여물품")
                    Spacer()
                    Text("대여한 물품")
                }
            }
            Button("반납하기"){}
        }
    }
}

struct banner: View{
    var body: some View{
        VStack{
            HStack{
                Button(action: {
                    // action
                }) {
                    Text("뒤로 가기")
                }.padding(.leading)
                Spacer()
                Text("반납하기")
                Spacer()
            }
        }
    }
}

struct overdueView_Previews: PreviewProvider {
    static var previews: some View {
        returnView()
    }
}

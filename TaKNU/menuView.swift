//
//  menuView.swift
//  taknu
//
//  Created by 박상원 on 2022/05/01.
//

import SwiftUI
struct menuView: View{
    var body: some View{
        VStack{
            HStack{
                Text("TaKNU");
            }
            List{
                HStack{
                    things()
                    Spacer()
                    things()
                    Spacer()
                    things()
                }
            }
        }
    }
}
struct things: View{
    var body: some View{
        Button("대여 물품"){
        }
        .frame(width: 70, height: 70)
        .border(.red, width: 1.5)
    }
}

struct menuView_Previews: PreviewProvider {
    static var previews: some View {
        menuView()
    }
}

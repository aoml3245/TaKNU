//
//  AuthHeaderView.swift
//  TaKNU-1
//
//  Created by 맥북프로 M1 on 2022/04/29.
//

import SwiftUI

struct MainTabView: View {
    let title1: String
    let title2: String
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack { Spacer() }
          //  HStack { Spacer() } // day sang 2 goc
            
            Text(title1)
                .font(.largeTitle)
                .fontWeight(.semibold)
            
            Text(title2)
                .font(.largeTitle) // cỡ chữ
                .fontWeight(.semibold)
        }
//            .frame(width: UIScreen.main.bounds.width, height: 260) // can chu ra giua le
        .frame(height: 260)
                .padding(.leading)
                .background(Color(.systemRed)) //màu nền chữ
                .foregroundColor(.white) // màu chữ
                .clipShape(RoundedShape(corners: [.bottomRight]))
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView(title1: "안녕하세요", title2: "TaKNU에 오신것을 환영합니다")
    }
}

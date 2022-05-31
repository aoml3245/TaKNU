//
//  settingView.swift
//  TaKNU
//
//  Created by 서명원 on 2022/04/27.
//

import SwiftUI

struct settingView: View {
    @State var alarmState: Bool = true
    var body: some View {
        VStack{
            List{
//                Toggle(isOn: $alarmState, label: {
//                                Text("알람")
//                            })
                Section(header: Text("계정 설정"), footer: Text(""), content: {
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
                })
            }
        }
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("설정")
                    .font(.system(size: 20, weight: .semibold))
                    .accessibilityAddTraits(.isHeader)
            }
        }
        
    }
    
    func getUserData(){
        
    }
}


struct settingView_Previews: PreviewProvider {
    static var previews: some View {
        settingView()
    }
}

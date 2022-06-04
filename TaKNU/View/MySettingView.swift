//
//  MySettingView.swift
//  TaKNU
//
//  Created by 박상원 on 2022/05/11.
//

import SwiftUI

struct MySettingView : View{
//    @ObservedObject var viewRouter : ViewRouter
    var body: some View{
        NavigationView{
            VStack(alignment: .leading, spacing: 20){
                Text("마이페이지")
                    .font(.system(size: 40, weight: .black))
                    .padding(.leading, 17)
                    .padding(.top)
                ScrollView{
//                    NavigationLink(destination: MyProfileView()){
//                        Text("개인정보")
//                            .frame(width: 300, height: 50,alignment: .leading)
//                            .padding(.horizontal)
//                            .overlay(Rectangle().stroke(.gray, lineWidth: 1))
//                    }
                    NavigationLink(destination: RenderListView()){
                        Text("연체기록")
                            .frame(width: 300, height: 50,alignment: .leading)
                            .padding(.horizontal)
                            .overlay(Rectangle().stroke(.gray, lineWidth: 1))
                    }
                    NavigationLink(destination: settingView()){
                        Text("설정")
                            .frame(width: 300, height: 50,alignment: .leading)
                            .padding(.horizontal)
                            .overlay(Rectangle().stroke(.gray, lineWidth: 1))
                    }
                }
                .foregroundColor(.black)
                .font(.system(size: 25, weight: .medium))
                .frame(width: 300)
                .padding(.horizontal)
                
            }
            .navigationBarHidden(true)
            .navigationTitle("")
        }
    }
    
//    func getUserData(){
//        var ret : NSEnumerator?
//        self.ref.child("User/\(uid)").observeSingleEvent(of: .value, with: { snapshot in
//            ret =  snapshot.children
//        })
//    }
}


struct MySettingView_Previews: PreviewProvider {
    static var previews: some View {
        MySettingView()
    }
}

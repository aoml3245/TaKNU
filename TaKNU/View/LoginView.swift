//
//  LoginView.swift
//  TaKNU-1
//
//  Created by 맥북프로 M1 on 2022/04/29.
//

import SwiftUI
import Firebase 

struct LoginView: View {
    @State private var 이메일 = ""
    @State private var 비밀번호 = ""
    
    @ObservedObject var viewRouter : ViewRouter
    
    var body: some View {
        // parent container
        VStack {
            
            MainTabView(title1: "안녕하세요", title2: "TaKNU에 오신것을 환영합니다")
        
            
            VStack(spacing: 40) {
                CustomInputField(imageName: "envelope",
                                 placeholderText: "이메일",
                                 text: $이메일)
                CustomInputField(imageName: "lock",
                                 placeholderText: "비밀번호",
                                 isSecureField: true,
                                 text: $비밀번호)
            }
            .padding(.horizontal, 32)
            .padding(.top, 33)
            HStack {  // bat buoc phai co moi hien
             //  Button {
                   
            }
            Spacer(minLength: 40)
            Button {
                login(email: 이메일, password: 비밀번호)
            } label: {
                Text("TaKNU 로그인")
                .font(.subheadline)
                .foregroundColor(.white)
                .frame(width: 360, height: 55)
                .background(Color(.systemRed))
                .clipShape(Capsule())
                .padding()
            }
            .shadow(color: .gray.opacity(0.5), radius: 10, x: 0, y: 0)
            
            Spacer () //chac chan phai co
            
            NavigationLink{
                RegistrationView()
                    .navigationBarHidden(true)
            } label: {
                HStack {
                    Text("혹시,TaKNU이 처음이신가요?")
                        .font(.footnote)
                
                Text("회원가입")
                    .font(.footnote)
                    .fontWeight(.semibold)
                }
            }
            .padding(.bottom, 32)
            .foregroundColor(Color(.systemRed))
        }
    
        .ignoresSafeArea() // căn góc tròn
        .navigationBarHidden(true)
    }
    
    func login(email: String, password: String) {
            Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
                if error != nil {
                    print("error")
                    //확인해 달라는 팝업 메세지
                } else {
                    print("sucess")
                    self.viewRouter.currentPage = "tabView"
                }
                
            }
        }
}
struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(viewRouter: ViewRouter())
    }
}


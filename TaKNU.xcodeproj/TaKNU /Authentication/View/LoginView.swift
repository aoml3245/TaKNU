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
    @EnvironmentObject var viewModel: AuthViewModel
    
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
                   NavigationLink {
                        Text("한국어, 영어, 베트남어")
                    } label: {
                         Text("언어 설정")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundColor(Color(.systemRed))
                            .padding(.top)
                            .padding(.trailing, 24)
                }
        }
            HStack{
                Spacer()
                NavigationLink {
                   Text("비밀번호 찾기")
                } label: {
                    Text("이메일/비밀번호 찾기")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundColor(Color(.systemRed))
                        .padding(.top)
                        .padding(.trailing, 23)
                }
            }

            Button {
                viewModel.login(withEmail: 이메일, password: 비밀번호)
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
}
struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}


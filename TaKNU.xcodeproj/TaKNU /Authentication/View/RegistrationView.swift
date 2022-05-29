//
//  RegistrationView.swift
//  TaKNU-1
//
//  Created by 맥북프로 M1 on 2022/04/29.
//

import SwiftUI
import Firebase

struct RegistrationView: View {
    @State private var email = ""
    @State private var username = ""
    @State private var fullname = ""
    @State private var password = ""
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        VStack {
            MainTabView(title1: "시작하기", title2: "계정을 만들자")
            
            VStack (spacing: 40){
                CustomInputField(imageName: "envelope",
                                 placeholderText: "이메일",
                                 text: $email)
                
                CustomInputField(imageName: "person",
                                 placeholderText: "이름",
                                 text: $username)
                
                
                CustomInputField(imageName: "person",
                                 placeholderText: "닉넴",
                                 text: $fullname)
                
                CustomInputField(imageName: "lock",
                                 placeholderText: "비밀번호",
                                 isSecureField: true,
                                 text: $password)
            }
            .padding(32)
            
            Button {
                viewModel.register(withEmail: email,
                                   password: password,
                                   fullname: fullname,
                                   username: username)
            } label: {
                Text("가입하기")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(width: 340, height: 50)
                    .background(Color(.systemRed))
                    .clipShape(Capsule())
                    .padding()
            }
            .shadow(color: .gray.opacity(0.5), radius: 10, x: 0, y: 0)
            
            Spacer()
            
            Button {
                presentationMode.wrappedValue.dismiss()
            } label: {
                HStack {
                    Text("계정이 있으세요?")
                        .font(.footnote)
                    
                    Text("로그인 하기")
                        .font(.footnote)
                        .fontWeight(.semibold)
                }
            }
            .padding(.bottom, 32)
            .foregroundColor(Color(.systemRed))
        }
        .ignoresSafeArea()
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}


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
    @State private var password = ""
//    @ObservedObject var viewRouter : ViewRouter
    
    @Environment(\.presentationMode) var presentationMode
    
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
                
                
                CustomInputField(imageName: "lock",
                                 placeholderText: "비밀번호",
                                 isSecureField: true,
                                 text: $password)
            }
            .padding(32)
            
            Button {
                signUp(emailAddress: email, password: password)
                regitUser(name: username, email: email)
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
    func signUp(emailAddress: String, password: String) {
        Auth.auth().createUser(withEmail: emailAddress, password: password)
        login(email: email, password: password)
    }
    func regitUser(name: String, email:String) -> Bool{
        var ret = true
        let ref: DatabaseReference! = Database.database().reference()
        let uid = Auth.auth().currentUser?.uid
        ref.child("Users/\(uid!)").observeSingleEvent(of: .value, with: { snapshot in
            if(snapshot.exists() == false){
                // 현재 사용자가 존재하지 않으면 사용자를 만든다.
                ref.child("Users/\(uid!)/name").setValue(name)
                ref.child("Users/\(uid!)/email").setValue(email)
                print("사용자 등록에 성공했습니다.")
            }
            else{
                ret =  false
                print("사용자가 존재합니다.")
            }
        })
        return ret
        
    }
    func login(email: String, password: String) {
            Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
                if error != nil {
                    print("error")
                    //확인해 달라는 팝업 메세지
                } else {
                    print("sucess")
                    //화면 전환 함수
                }
                
            }
        }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}


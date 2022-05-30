//
//  AuthViewModel.swift
//  TaKNU-1
//
//  Created by 맥북프로 M1 on 2022/04/30.
//

import SwiftUI
import Firebase

class AuthViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    
    init() {
        self.userSession = Auth.auth().currentUser
        
        print("DEBUG: User session is \(String(describing: self.userSession)) )")
        
    }
    
    func login(withEmail email: String, password: String) {
        print("DEBUG: Login with email \(email)")
    }
    
    func register(withEmail email: String, password: String, fullname: String, username: String) {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                print("DEBUG: Faile to register with error \(error.localizedDescription)")
                return
            }
            guard let user = result?.user else {return}
            self.userSession = user
            
        print("DEBUG: Registered user successfully")
            print("DEBUG: User is\(String(describing: self.userSession))")
            
            let data = ["이메일": email,
                       "아이디": username.lowercased(),
                        "닉넴": fullname,
                        "uid": user.uid]
            Firestore.firestore().collection("users")
                .document(user.uid)
                .setData(data) { _ in
                    print("DEBUG: Did upload user data..")
                }
        
    }
}
    func signOut() {
        
        userSession = nil
 //       try? Auth.auth().signOut()
        
    }
}

//
//  AuthenticationService.swift
//  TaKNU
//
//  Created by 서명원 on 2022/05/09.
//

import Foundation
import Firebase

class AuthenticationModel: ObservableObject {
  
    @Published var user: User?

    func signIn(emailAddress: String, password: String) {
        listenToAuthState()
        Auth.auth().signIn(withEmail: emailAddress, password: password)
    }
    
    func signUp(emailAddress: String, password: String) {
        Auth.auth().createUser(withEmail: emailAddress, password: password)
    }
    
    func signOut(){
        try? Auth.auth().signOut()

    }
  
    private func listenToAuthState() {
        Auth.auth().addStateDidChangeListener { (auth, user) in
            print("Sign in state has changed.")
            self.user = user

            if let user = user {
                let anonymous = user.isAnonymous ? "anonymously " : ""
                print("User signed in \(anonymous)with user ID \(user.uid).")
            }
            else {
                print("User signed out.")
            }
        }
    }
  
}

//
//  database.swift
//  TaKNU
//
//  Created by 서명원 on 2022/05/09.
//

import Foundation
import FirebaseAuth
import FirebaseDatabase

class DatabaseModel: ObservableObject{
    lazy var databasePath: DatabaseReference? = {
      // 1
      guard let uid = Auth.auth().currentUser?.uid else {
        return nil
      }

      // 2
      let ref = Database.database()
        .reference()
        .child("users/\(uid)/thoughts")
      return ref
    }()
    
    private let encoder = JSONEncoder()
}




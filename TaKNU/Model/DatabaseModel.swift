//
//  database.swift
//  TaKNU
//
//  Created by 서명원 on 2022/05/09.
//

import Foundation
import FirebaseAuth
import FirebaseDatabase

class DatabaseModel{
    var ref:DatabaseReference!
    
    private lazy var databasePath: DatabaseReference? = {
      // 1
      guard let uid = Auth.auth().currentUser?.uid else {
        return nil
      }

      // 2
    let ref = Database.database()
        .reference()
        self.ref = ref
      return ref
    }()
    
    private let encoder = JSONEncoder()
    
    private let decoder = JSONDecoder()
    
    private func registerUser(){
        
    }
    private func addItem(){
        
    }
    private func deleteItem(){
        
    }
    private func takeItem(){
        
    }
    private func returnItem(){
        
    }
    private func getOverdue(){
        
    }
    private func getTakeRecord(){
        
    }
    
}

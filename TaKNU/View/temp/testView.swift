//
//  testView.swift
//  TaKNU
//
//  Created by 서명원 on 2022/05/15.
//

import SwiftUI
import Firebase

struct testView: View {
    @State var email = ""
    @State var password = ""
    var ref: DatabaseReference! = Database.database().reference()
    var uid = Auth.auth().currentUser?.uid
    
    @State var name = ""
    @State var groupname = ""
    @State var itemname = ""
    
    var body: some View {
        VStack {
              
        
        }
    }
    
    func takeItem(itemname: String) {
            //물품 대여
            var rent = true
            
            self.ref.child("Thinglist/\(itemname)").observeSingleEvent(of: .value, with: { snapshot in
                
                print(snapshot.value!)
                
                let s =  snapshot.value! as? Int ?? 0
                
                print(s)
                print(s-1)
                
                print(type(of: (snapshot.value)))
                
                //let num = (snapshot.value as! NSString).integerValue
                
                //print(num)
            })
            
            //return rent
            //USer에도 업데이트 해주고
            //Group의 데이터도 업데이트해줘야함
            //record도 기록해야함
        }
    func getPersonalRecord(){
        //개인의 대여기록 확인
    }
    func getItemRecord(){
        //물품의 대여기록 확인
    }
    func showItems() -> NSEnumerator {
        var ret : NSEnumerator?
        self.ref.child("Groups/\(groupname)/thinglist").observeSingleEvent(of: .value, with: { snapshot in
            ret =  snapshot.children
        })
        return ret!
    }
    func showItem(){
        //물품 하나에 대한 상태 보기
    }
    func showUser(groupname:String) -> NSEnumerator{
        // 그룹의 허용된 사용자
        var ret : NSEnumerator?
        self.ref.child("Groups/\(groupname)/userlist").observeSingleEvent(of: .value, with: { snapshot in
            ret =  snapshot.children
        })
        return ret!
    }
    func getUserData(uid:String) -> NSEnumerator {
        // 사용자 개인의 데이터
        var ret : NSEnumerator?
        self.ref.child("User/\(uid)").observeSingleEvent(of: .value, with: { snapshot in
            ret =  snapshot.children
        })
        return ret!
    }
    func resign(uid: String){
        //사용자 탈퇴
    }
    func returnItem(){
        //물품 반납
        //USer에도 업데이트 해주고
        //Group의 데이터도 업데이트해줘야함
        //record도 기록해야함
    }
    func getPersonalOverdueRecord(uid:String) -> NSEnumerator {
        //개인 연체 기록
        var ret : NSEnumerator?
        self.ref.child("Users/\(uid)/takerecord").observeSingleEvent(of: .value, with: { snapshot in
            ret =  snapshot.children
        })
        return ret!
    }
    func getItemOverdueRecord() -> NSEnumerator {
        //물품 연체 기록
        var ret : NSEnumerator?
        self.ref.child("Groups/\(uid)/takerecord").observeSingleEvent(of: .value, with: { snapshot in
            ret =  snapshot.children
        })
        return ret!
    }
    
}

struct testView_Previews: PreviewProvider {
    static var previews: some View {
        testView()
    }
}

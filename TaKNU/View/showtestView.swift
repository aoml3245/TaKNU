//
//  testView.swift
//  TaKNU
//
//  Created by 서명원 on 2022/05/15.
//

import SwiftUI
import Firebase

struct showTestView: View {
    @State var email = ""
    @State var password = ""
    var ref: DatabaseReference! = Database.database().reference()
    var uid = Auth.auth().currentUser?.uid
    
    @State var name = ""
    @State var groupname = ""
    @State var itemname = ""
    
    var body: some View {
        VStack {
//
//            for item in (record){
//
//            }
          }
          .padding()
        
        
    }
    
    func signUp(emailAddress: String, password: String) {
            Auth.auth().createUser(withEmail: emailAddress, password: password)
        }
    
    func login() {
            Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
                if error != nil {
                    print(error?.localizedDescription ?? "")
                } else {
                    print("success")
                }
            }
        }
    func regitUser(uid: String, name: String, email:String) -> Bool{
        var ret = true
        self.ref.child("Users/\(uid)").observeSingleEvent(of: .value, with: { snapshot in
            if(snapshot.exists() == false){
                // 현재 사용자가 존재하지 않으면 사용자를 만든다.
                self.ref.child("Users/\(uid)/name").setValue(name)
                self.ref.child("Users/\(uid)/email").setValue(email)
                print("사용자 등록에 성공했습니다.")
            }
            else{
                ret =  false
                print("사용자가 존재합니다.")
            }
        })
        return ret
        
    }
    func regitGroup(uid: String, groupname:String) -> Bool{
        var ret = true
        self.ref.child("Groups/\(groupname)").observeSingleEvent(of: .value, with: { snapshot in
            if(snapshot.exists() == false){
                //그룹이 존재하지 않으면? 등록을 진행한다.
                guard let key = ref.child("Groups").childByAutoId().key else { return }
                self.ref.child("Groups/\(groupname)").setValue(key)
                self.ref.child("Groups/\(key)").setValue(["admin": uid])
                print("그룹을 만들었습니다.")
                ret =  true
            }
            else{
                //그룹이 존재 하면
                ref.child("Groups").getData(completion:  { error, snapshot in
                  guard error == nil else {
                    print(error!.localizedDescription)
                    return;
                  }
                    let value = snapshot.value as? NSDictionary
                    
                    let key = value?[groupname] as? String
                    self.ref.child("Groups/\(key!)/regitList/\(uid)").setValue(true)
                    ret =  false
                    print("그룹 등록리스트에 추가했습니다.")
                });
                
            }
            self.ref.child("Users/\(uid)/group/").setValue(groupname)
        })
        return ret
    }
    func regitItem(groupname: String, itemname:String){
        //대여 물품 등록
        self.ref.child("Groups/\(groupname)").observeSingleEvent(of: .value, with: { snapshot in
            ref.child("Groups").getData(completion:  { error, snapshot in
                let value = snapshot.value as? NSDictionary
                let key = value?[groupname] as? String
                self.ref.child("Groups/\(key!)/thinglist/\(itemname)").setValue(true)
            });
        })
    }
    func removeItem(groupname: String, itemname:String){
        //대여 물품 삭제
        self.ref.child("Groups/\(groupname)").observeSingleEvent(of: .value, with: { snapshot in
            ref.child("Groups").getData(completion:  { error, snapshot in
                let value = snapshot.value as? NSDictionary
                let key = value?[groupname] as? String
                self.ref.child("Groups/\(key!)/thinglist/\(itemname)").removeValue()
            });
        })
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
    func showRegitUser(groupname:String) -> NSEnumerator {
        // 그룹에 들어오고 싶어하는 사용자
        var ret : NSEnumerator?
        self.ref.child("Groups/\(groupname)/regitlist").observeSingleEvent(of: .value, with: { snapshot in
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
    func takeItem(){
        //물품 대여
        //USer에도 업데이트 해주고
        //Group의 데이터도 업데이트해줘야함
        //record도 기록해야함
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
    func getGroupId(groupname:String) -> String{
        //그룹의 아이디 가져오기
        var id : String?
        self.ref.child("Groups/").observeSingleEvent(of: .value, with: { snapshot in
                let value = snapshot.value as? NSDictionary
                id = value?[groupname] as? String
        })
        
        return id!
    }
    func getUserGroupName(uid: String) -> String{
        //유저가 속해있는 그룹의 이름
        var name : String?
        self.ref.child("User/\(uid)").observeSingleEvent(of: .value, with: { snapshot in
                let value = snapshot.value as? NSDictionary
                name = value?["group"] as? String
        })
        return name!
    }
    func userAccept(){
        //사용자 요청 허용
    }
    func userDenied(){
        //사용자 요청 불허락
    }
    func userRemove(){
        //그룹 내 사용자 삭제
    }
    
}

struct showtestView_Previews: PreviewProvider {
    static var previews: some View {
        showTestView()
    }
}

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
    
    var body: some View {
        VStack {
              TextField("Email", text: $email)
              SecureField("Password", text: $password)
              Button(action: { login() }) {
                  Text("Sign in")
              }
          }
          .padding()
        TextField("name", text: $name)
        TextField("groupname", text: $groupname)
        
        Button(action: {
            regitUser(uid: uid!, name: name, email: email)
            
        }) {
            Text("registar user")
        }
        
        Button(action: {
            regitGroup(uid: uid!, groupname: groupname)
            
        }) {
            Text("registar group")
        }
        
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
            self.ref.child("Users/\(uid)/group/\(groupname)").setValue(true)
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
    func showItems(){
        //대여 가능 물품 보기
    }
    func showItem(){
        //물품 하나에 대한 상태 보기
    }
    func showUser(){
        //유저 목록 보기
    }
    func showRegitUser(){
        //등록 신청 중인 대기자 목록 보기
    }
    func getUserData(){
        //유저 데이터 가져오기
    }
    func limitUser(){
        //사용자 제재
    }
    func resign(){
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
    func getPersonalOverdueRecord(){
        //개인 연체 기록
    }
    func getItemOverdueRecord(){
        //물품 연체 기록
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

struct testView_Previews: PreviewProvider {
    static var previews: some View {
        testView()
    }
}

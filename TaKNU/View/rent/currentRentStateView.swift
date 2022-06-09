//
//  RentView.swift
//  TaKNU
//
//  Created by 박상원 on 2022/05/09.
//
import SwiftUI
import Firebase

struct currentRentStateView: View {
    @ObservedObject var viewRouter : ViewRouter
    
    var rentState: NSDictionary? {
        
        getTakeRecord()
        return nil
    }
    @State var rentDate : Date?
    @State var returnDate : Date?
    @State var rentItem : String?
    
    
    var body: some View {
        VStack(alignment: .center, spacing: 20){
            HStack{
                
                Text("대여 현황")
                    .font(.system(size: 40, weight: .black))
                    .padding(.leading, 30)
                    .padding(.top)
                Spacer()
            }
            ScrollView{
                if rentState == nil{
                    if rentDate == nil, returnDate == nil, rentItem == nil {
                        Text("대여 물품이 없습니다")
                            .font(.system(size: 40, weight: .black))
                            .padding(.leading, 30)
                            .padding(.top)
                        Spacer()
                    }
                    else{
                        rentedBox(viewRouter: viewRouter, rentDate: rentDate!, returnDate: returnDate!, rentItem: rentItem!)
                    }
                }
                
            }
        }
    }
    
    func getTakeRecord(){
        let uid = Auth.auth().currentUser?.uid
        let ref: DatabaseReference! = Database.database().reference()
        ref.child("Users/\(String(describing: uid!))/takerecode/").observeSingleEvent(of: .value, with: { snapshot in
            let value = snapshot.value as? NSDictionary
            
            if let get = value?["taketime"] as? String{
                self.rentDate = dateFormat().date(from: get)
            }
            if let get = value?["returntime"] as? String{
                self.returnDate = dateFormat().date(from: get)
            }
            if let get = value?["thingname"] as? String{
                self.rentItem = get
            }
        })
    }
    
    func dateFormat() -> DateFormatter{
        let formatter = DateFormatter()
        formatter.dateFormat = "Y . M . d a h:mm"
        return formatter
    }
    
}

struct currentRentStateView_Previews: PreviewProvider {
    static var previews: some View {
        currentRentStateView(viewRouter: ViewRouter())
    }
}

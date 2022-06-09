//
//  RentView.swift
//  TaKNU
//
//  Created by 박상원 on 2022/05/09.
//
import SwiftUI
import Firebase

struct rentView: View {
    @ObservedObject var viewRouter : ViewRouter
    @ObservedObject var rentViewModel : rentViewModel
    @State var rentItem :String
    @State private var isChecked = false
    @State private var selectedDate = Date()
    @State private var shouldAlert : Bool = false
    @State private var isActive: Bool = false
    @State var alertMessage = ""
    @State var rentedState = false
    
    private var returnDate: Date {
        selectedDate.addingTimeInterval(60*60*24)
    }
    private var selectedDateString: String {
        self.dateFormat().string(from: selectedDate)
    }
    private var returnDateString: String {
        self.dateFormat().string(from: returnDate)
    }
    
    @State var presentAlert: Bool = false
    var printReturnDate: String {
        self.dateFormat().string(from: returnDate)
    }
    
    var body: some View {
        ScrollView{
            VStack(alignment: .center, spacing: 20){
                rentItemImage(rentItem: $rentItem)
                    .padding(.top, 30)
                VStack(alignment: .center,spacing: 0){
                    Text("언제부터 필요하신가요?")
                        .padding(9)
                        .font(.system(size: 20, weight: .bold))
                    selectingDate(selectedDate: $selectedDate)
                    Divider().frame(height: 20)
                    checkBoxView(checked: $isChecked)
                        .padding(.bottom, 40)
                    VStack{
                        Button{
                            if !self.isChecked{
                                self.shouldAlert = true
                                self.isActive = false
                                self.presentAlert = false
                            }
                            if self.isChecked{
                                checkTakeAval(itemname: rentItem, borrowedtime: selectedDateString, returntime: returnDateString)
//                                if takeItem(itemname: rentItem, borrowedtime: selectedDate, returntime: returnDate) == true{
//                                    viewRouter.currentPage = "currentRentStateView"
//                                    self.isActive = true
//                                }
//                                else{
//                                    self.alertMessage = "빌릴 물품이 부족합니다."
//                                    self.presentAlert = true
//                                }
                            }
                        } label: {
                            VStack{
                                Text("대여하기")
                                    .fontWeight(.bold)
                                    .font(.system(size: 20))
                                Text("반납 예정일 : \(printReturnDate)")
                                    .alert("", isPresented: $shouldAlert){
                                        Button("OK"){}
                                    } message:{
                                        Text("주의사항을 체크해주세요!")
                                            .font(.system(size: 30))
                                            .fontWeight(.bold)
                                    }
                            }
                                .alert("알림", isPresented: $presentAlert, actions: {
                                    
                                    Button("Ok", role: .cancel){
                                        if rentedState == true{
                                            viewRouter.currentPage = "currentRentStateView"
                                        }
                                    }
                                }, message: {
                                    Text(alertMessage)
                                })
                                .frame(width: 280)
                                .padding(.vertical)
                                .background(.orange)
                                .foregroundColor(.white)
                                .cornerRadius(100)
                        }
                    }
                }
                .frame(width: 300)
            }
        }
    }
    
    func checkTakeAval(itemname: String, borrowedtime: String, returntime: String){
        let uid = Auth.auth().currentUser?.uid
        let ref: DatabaseReference! = Database.database().reference()
        print(uid)
        ref.child("Users/\(String(describing: uid!))/takerecode/").observeSingleEvent(of: .value, with: { snapshot in
            let value = snapshot.value as? NSDictionary
            if let key = value?["thingname"] as? String{
                print("현재 상태: ", key)
                self.alertMessage = "현재 빌린 물품이 있습니다"
                self.presentAlert = true
                rentedState = true
                return
            }
            else{
                rentedState = false
                takeItem(itemname: rentItem, borrowedtime: selectedDateString, returntime: returnDateString)
            }
            
        })
    }
    
    func takeItem(itemname: String, borrowedtime: String, returntime: String){
            //물품 대여
            let uid = Auth.auth().currentUser?.uid
        let ref: DatabaseReference! = Database.database().reference()
            
            ref.child("Thinglist/\(itemname)").observeSingleEvent(of: .value, with: { snapshot in
                
                var s = snapshot.value! as? Int ?? 0
                print(s)
                
                // 대여가능여부 파악
                if 0 < s {
                    s = s - 1
                    print ("대여 완료.")
                    // user에 업데이트
                    ref.child("Users/\(String(describing: uid!))/takerecode/returntime").setValue(returntime)
                    ref.child("Users/\(String(describing: uid!))/takerecode/taketime").setValue(borrowedtime)
                    ref.child("Users/\(String(describing: uid!))/takerecode/thingname").setValue(itemname)
                    
                } else {
                    print ("잘못된 동작입니다.")
                    self.alertMessage = "빌릴 물품이 부족합니다."
                    self.presentAlert = true
                    return
                }
                
                ref.child("Thinglist/\(itemname)").setValue(s)
                
                viewRouter.currentPage = "currentRentStateView"
                self.isActive = true
            })
            
            // 대여 가능여부 반환
        }
    
    func dateFormat() -> DateFormatter{
        let formatter = DateFormatter()
        formatter.dateFormat = "Y . M . d a h:mm"
        return formatter
    }
    

}

struct selectingDate: View{
    @Binding var selectedDate : Date
    var body: some View{
        DatePicker("대여 날짜", selection: $selectedDate, displayedComponents: [.date, .hourAndMinute])
            .datePickerStyle(CompactDatePickerStyle())
            .labelsHidden()
            .environment(\.locale, Locale.init(identifier: "ko"))
            .frame(height: 60)
            .padding(.horizontal, 20)
    }
}


struct rentView_Previews: PreviewProvider {
    struct rentViewHolder: View {
        var body: some View {
            rentView(viewRouter: ViewRouter(), rentViewModel: rentViewModel(), rentItem: "충전기")
        }
    }
    static var previews: some View {
        rentViewHolder()
    }
}






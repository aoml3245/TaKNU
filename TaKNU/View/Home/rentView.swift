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
                VStack(alignment: .center,spacing: 0){
                    Text("대여 일자")
                        .padding(9)
                        .font(.system(size: 24))
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(.gray, lineWidth: 1))
                    Divider().frame(height: 40)
                    selectingDate(selectedDate: $selectedDate)
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
                                takeItem(itemname: rentItem, borrowedtime: selectedDateString, returntime: returnDateString)
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
                                        Text("you should check the checkbox!")
                                            .font(.system(size: 30))
                                            .fontWeight(.bold)
                                    }
                            }
                                .alert("알림", isPresented: $presentAlert, actions: {
                                    
                                    Button("Ok", role: .cancel){
                                        
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
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("대여하기")
                        .font(.system(size: 20, weight: .semibold))
                        .accessibilityAddTraits(.isHeader)
                }
            }
        }
    }
    
    func takeItem(itemname: String, borrowedtime: String, returntime: String){
            //물품 대여
            var rent = true
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
                    ref.child("Users/\(String(describing: uid))/takerecode/returntime").setValue(returntime)
                    ref.child("Users/\(String(describing: uid))/takerecode/taketime").setValue(borrowedtime)
                    ref.child("Users/\(String(describing: uid))/takerecode/thingname").setValue(itemname)
                    
                } else {
                    print ("잘못된 동작입니다.")
                    rent = false
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
        formatter.dateFormat = "M월 d일 a H시 m분"
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

//struct rentButton: View{
//    @Binding var isChecked:Bool
//    @Binding var selectedDate : Date
//    @Binding var shouldAlert : Bool
//    @Binding var returnDate : Date
//    @State var printDate = ""
//
//    var body: some View{
//
//        VStack{
//            Text("대여하기")
//                .fontWeight(.bold)
//                .font(.system(size: 20))
//            Text("반납 예정일 : \(printDate)")
//                .onAppear(){
//                    printDate = formattedReturnTime(selectedDate)
//                }
//                .alert("", isPresented: $shouldAlert){
//                    Button("OK"){}
//                } message:{
//                    Text("you should check the checkbox!")
//                        .font(.system(size: 30))
//                        .fontWeight(.bold)
//                }
//
//        }
//        .frame(width: 280)
//        .padding(.vertical)
//        .background(.orange)
//        .foregroundColor(.white)
//        .cornerRadius(100)
//    }
//}

struct rentView_Previews: PreviewProvider {
    struct rentViewHolder: View {
        
        var body: some View {
            rentView(viewRouter: ViewRouter(), rentViewModel: rentViewModel(), rentItem: "charger2")
        }
    }
    static var previews: some View {
        rentViewHolder()
    }
}

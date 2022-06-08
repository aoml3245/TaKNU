//
//  RentView.swift
//  TaKNU
//
//  Created by 박상원 on 2022/05/09.
//
import SwiftUI

struct rentView: View {
    @ObservedObject var viewRouter : ViewRouter
    @ObservedObject var rentViewModel : rentViewModel
    @State var rentItem :String
    @State private var isChecked = false
    @State private var selectedDate = Date()
    @State private var shouldAlert : Bool = false
    @State private var isActive: Bool = false
    
    private var returnDate: Date {
        selectedDate.addingTimeInterval(60*60*24)
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
                                self.presentAlert = true
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
                                .alert("alarm", isPresented: $presentAlert, actions: {
                                    Button{
                                        self.isActive = true
                                        viewRouter.currentPage = "currentRentStateView"
                                    }label: {
                                        Text("Ok")
                                    }
                                    Button("cancel", role: .cancel){
                                        
                                    }
                                }, message: {
                                    Text("message")
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

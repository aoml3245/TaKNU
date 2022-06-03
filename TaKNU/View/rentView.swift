//
//  RentView.swift
//  TaKNU
//
//  Created by 박상원 on 2022/05/09.
//

import SwiftUI

struct rentView: View {
    @ObservedObject var viewRouter : ViewRouter
    @State private var isChecked = false
    @State private var selectedDate = Date()
    @State private var shouldAlert : Bool = false
    @State private var isActive: Bool = false
    @State private var returnDate: Date = Date()
    @State var presentAlert: Bool = false
    @State var rentItem : String
    
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
//                    HStack{
//                        Image(systemName: "flame.fill")
//                            .font(.system(size: 25))
//                            .foregroundColor(self.isChecked ? .blue : .gray)
//                        Image(systemName: "car.fill")
//                            .font(.system(size: 25))
//                            .foregroundColor(self.isActive ? .blue : .gray)
//                        Image(systemName: "person.fill")
//                            .font(.system(size: 25))
//                            .foregroundColor(self.shouldAlert ? .blue : .gray)
//                    }
                    checkBoxView(checked: $isChecked)
                        .padding(.bottom, 40)
                    VStack{
                        NavigationLink(destination: currentRentStateView(rentDate: selectedDate, returnDate: returnDate, rentItem: rentItem), isActive: $isActive)
                        {
                            rentButton(isChecked: $isChecked, selectedDate: $selectedDate, shouldAlert: $shouldAlert, returnDate: $returnDate)
                                .simultaneousGesture(TapGesture().onEnded{
                                    if !self.isChecked{
                                        self.shouldAlert = true
                                        self.isActive = false
                                        self.presentAlert = false
                                    }
                                    if self.isChecked{
                                        self.presentAlert = true
                                    }
                                })
                        }
                        .alert("alarm", isPresented: $presentAlert, actions: {
                            Button(action: {
                                self.isActive = true
                            }){Text("OK")}
                            Button("cancel", role: .cancel){}
                        }, message: {
                            Text("message")
                        })
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

struct rentButton: View{
    @Binding var isChecked:Bool
    @Binding var selectedDate : Date
    @Binding var shouldAlert : Bool
    @Binding var returnDate : Date
    
    
    func dateFormat() -> DateFormatter{
        let formatter = DateFormatter()
        formatter.dateFormat = "M월 d일 a H시 m분"
        return formatter
    }
    
    func formattedReturnTime(_ selectedDate: Date!) -> Text{
        returnDate = selectedDate.addingTimeInterval(60*60*24)
        return Text("\(returnDate, formatter: self.dateFormat())")
    }
    
    var body: some View{
        
        VStack{
            Text("대여하기")
                .fontWeight(.bold)
                .font(.system(size: 20))
            Text("반납 예정일 : \(formattedReturnTime(selectedDate))")
                .alert("", isPresented: $shouldAlert){
                    Button("OK"){}
                } message:{
                    Text("you should check the checkbox!")
                        .font(.system(size: 30))
                        .fontWeight(.bold)
                }
        }
        .frame(width: 280)
        .padding(.vertical)
        .background(.orange)
        .foregroundColor(.white)
        .cornerRadius(100)
    }
}

struct rentView_Previews: PreviewProvider {
    struct rentViewHolder: View {
        @State var rentItem = "돗자리"
        
        var body: some View {
            rentView(rentItem: rentItem)
        }
    }
    static var previews: some View {
        rentViewHolder()
    }
}


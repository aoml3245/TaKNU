//
//  RentView.swift
//  TaKNU
//
//  Created by 박상원 on 2022/05/09.
//
import SwiftUI

struct currentRentStateView: View {
    @ObservedObject var viewRouter : ViewRouter
    @State var rentDate : Date = Date()
    @State var returnDate: Date = Date()
    @State var rentItem : String = ""
    
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
                rentedBox(rentDate: rentDate, returnDate: returnDate, rentItem: rentItem)
                
            }
        }
    }
}

struct currentRentStateView_Previews: PreviewProvider {
    static var previews: some View {
        currentRentStateView(viewRouter: ViewRouter())
    }
}

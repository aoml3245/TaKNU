//
//  RentView.swift
//  TaKNU
//
//  Created by 박상원 on 2022/05/09.
//

import SwiftUI

struct currentRentStateView: View {
    @Binding var rentDate : Date
    @Binding var returnDate: Date
    @Binding var rentItem : String

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
                HStack(alignment: .center){
                    rentedBox(rentDate: $rentDate, returnDate: $returnDate, rentItem: $rentItem)
                    rentedBox(rentDate: $rentDate, returnDate: $returnDate, rentItem: $rentItem)
                    
                }
                HStack{
                    rentedBox(rentDate: $rentDate, returnDate: $returnDate, rentItem: $rentItem)
                    rentedBox(rentDate: $rentDate, returnDate: $returnDate, rentItem: $rentItem)
                }
            }
        }
        //        .toolbar {
        //            ToolbarItem(placement: .principal) {
        //                Text("대여현황")
        //                    .font(.system(size: 20, weight: .semibold))
        //                    .accessibilityAddTraits(.isHeader)
        //            }
        //        }
        .navigationBarHidden(true)
        .navigationTitle("")
        
    }
}

//struct currentRentStateView_Previews: PreviewProvider {
//    static var previews: some View {
//        currentRentStateView(rentDate: Date(), returnDate: Date(), rentItem: "충전기")
//    }
//}

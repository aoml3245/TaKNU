//
//  rentedBox.swift
//  TaKNU
//
//  Created by 박상원 on 2022/05/10.
//

import SwiftUI

struct rentedBox : View{
    @State private var showModal = false
    @Binding var rentDate: Date
    @Binding var returnDate: Date
    @Binding var rentItem: String

    func dateFormat() -> DateFormatter{
        let formatter = DateFormatter()
        formatter.dateFormat = "M월 d일 a H시"
        return formatter
    }
    
    var body: some View{
        VStack(alignment: .center, spacing: 10){
            Rectangle().frame(height: 0)
            Image(rentItem)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 140, height: 140, alignment: .center)
                .clipped()
                .cornerRadius(10)
            Text("대여 날짜 : \(rentDate, formatter: self.dateFormat())")
            Text("반납 예정일 : \(returnDate, formatter: self.dateFormat())")
            Button(action: {
                self.showModal = true
            }){
                Text("반납하기")
                    .frame(width: 120, height: 40)
                    .background(.orange)
                    .foregroundColor(.white)
                    .cornerRadius(100)
            }.padding(.bottom, 10)
                .sheet(isPresented: self.$showModal){
                    returnModalView()
                }
        }
        .foregroundColor(.black)
        .font(.system(size: 15))
        .background(.yellow)
        .frame(width: 160)
        .cornerRadius(10)


    }
}
//
//struct rentedBox_Previews: PreviewProvider {
//    static var previews: some View {
//        VStack(alignment: .center, spacing: 20){
//            HStack(alignment: .center){
//
//            }
//            HStack{
//            }
//        }
//    }
//}

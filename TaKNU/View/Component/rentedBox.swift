//
//  rentedBox.swift
//  TaKNU
//
//  Created by 박상원 on 2022/05/10.
//
import SwiftUI

struct rentedBox : View{
    @ObservedObject var viewRouter : ViewRouter
    @State private var showModal = false
    @State var rentDate: Date
    @State var returnDate: Date
    @State var rentItem: String
    
    func dateFormat() -> DateFormatter{
        let formatter = DateFormatter()
        formatter.dateFormat = "Y. M. d a h:mm"
        return formatter
    }
    
    var body: some View{
        VStack(alignment: .center, spacing: 10){
            Image(rentItem)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 240, height: 240)
                .clipped()
                .padding(.top, 30)
            Spacer()
                .frame(height: 20)
            VStack(alignment: .leading){
                Text("대여일자 : \(rentDate, formatter: self.dateFormat())")
                    .font(.system(size: 22, weight:.semibold))
                    .padding(.bottom, 5)
                Text("반납 예정일 : \(returnDate, formatter: self.dateFormat())")
                    .font(.system(size: 22, weight:.semibold))
            }
            Spacer()
                .frame(height:10)
            Button(action: {
                self.showModal = true
            }){
                Text("반납하기")
                    .font(.system(size: 24, weight: .bold))
                    .frame(width: 264, height: 66)
                    .foregroundColor(Color(red: 50/255, green: 50/255, blue: 50/255))
                    .background(Color(red: 217/255, green: 217/255, blue: 217/255))
                    .cornerRadius(100)
                    .shadow(color: .gray.opacity(0.5), radius: 10, x: 0, y: 0)
            }
            .padding(.bottom, 30)
            .sheet(isPresented: self.$showModal){
                returnModalView(viewRouter: viewRouter, rentDate: rentDate, returnDate: returnDate, rentItem: rentItem)
            }
        }
        .padding(.horizontal)
        //        .frame(width: 330, height: 462)
        .foregroundColor(.black)
        .font(.system(size: 15))
        .background(Color(red: 255/255, green: 209/255, blue: 92/255))
        .cornerRadius(20)
        .shadow(color: .gray.opacity(0.5), radius: 10, x: 0, y: 0)
    }
    
}

struct rentedBox_Previews: PreviewProvider {
    static var previews: some View {
        rentedBox(viewRouter: ViewRouter(), rentDate: Date(), returnDate: Date(), rentItem: "충전기")
    }
}

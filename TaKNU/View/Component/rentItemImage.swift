//
//  rentItemImage.swift
//  TaKNU
//
//  Created by 박상원 on 2022/05/11.
//
import SwiftUI



struct rentItemImage: View{
    @Binding var rentItem : String
    
    var body: some View{
        VStack{
            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(Color(red: 217/255, green: 217/255, blue: 217/255))
                .overlay{
                    Image(rentItem)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 300, height: 300, alignment: .center)
                        .clipped()
                }
                .frame(width: 340, height: 340)
        }
    }
}

struct rentItemImageView_Previews: PreviewProvider {
    struct rentItemImageViewHolder: View {
        @State var rentItem = "충전기"

        var body: some View {
            rentItemImage(rentItem: $rentItem)
        }
    }
    
    static var previews: some View {
        rentItemImageViewHolder()
    }
}

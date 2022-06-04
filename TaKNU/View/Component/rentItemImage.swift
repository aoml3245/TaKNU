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
            Image(rentItem)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 300, height: 300, alignment: .center)
                .clipped()
        }
    }
}

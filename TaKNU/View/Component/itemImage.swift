//
//  itemButton.swift
//  TaKNU
//
//  Created by 박상원 on 2022/05/08.
//

import SwiftUI

struct itemImage: View{
    
    var imageName : String = ""
    
    var body: some View{
        VStack{
            Image(imageName)
                .resizable()
                .clipShape(Rectangle())
                .frame(width: 130, height: 130)
                .cornerRadius(23)
                .padding(.bottom, 15)
            Text(imageName)
                .font(.system(size: 19))
                .fontWeight(.bold)
                .foregroundColor(.secondary)
        }
    }
}

struct itemButton_Previews: PreviewProvider {
    static var previews: some View {
        itemImage(imageName: "돗자리")
    }
}

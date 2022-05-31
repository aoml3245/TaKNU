//
//  checkboxView.swift
//  TaKNU
//
//  Created by 박상원 on 2022/05/09.
//

import SwiftUI

struct checkBoxView: View {
    @Binding var checked: Bool
    
    var body: some View {
        HStack{
            Image(systemName: checked ? "checkmark.square.fill" : "square")
                .foregroundColor(checked ? Color(UIColor.systemBlue) : Color.secondary)
            Text("반납 시간을 준수해 주세요!")
        }
        .onTapGesture {
            self.checked.toggle()
        }
    }
}

struct checkBoxView_Previews: PreviewProvider {
    struct checkBoxViewHolder: View {
        @State var checked = false

        var body: some View {
            checkBoxView(checked: $checked)
        }
    }
    
    static var previews: some View {
        checkBoxViewHolder()
    }
}

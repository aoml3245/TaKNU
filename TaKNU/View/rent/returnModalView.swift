//
//  ModalView.swift
//  TaKNU
//
//  Created by 박상원 on 2022/05/10.
//
import SwiftUI

struct returnModalView: View {
//    @ObservedObject var viewRouter : ViewRouter
    @Environment(\.presentationMode) var presentation
    @State var present: Bool = false
    
    var body: some View {
        VStack {
            HStack{
                Text("반납하기")
                    .font(.system(size: 30, weight: .black))
                    .padding(.leading, 30)
                Spacer()
            }
            Image("돗자리")
                .resizable()
                .frame(width: 300, height: 300)
            Text("대여 시작 : 2022년 5월 12일 19시 40분")
            Text("반납 예정일 : 2022년 5월 13일 19시 40분")
            Text("반납까지 5시간 41분 남았습니다.")
            
            Button(action:{
                present.toggle()
            }){
                Text("반납하기")
            }
            .frame(width: 150, height: 40)
            .background(RoundedRectangle(cornerRadius: 40).fill(.orange))
            .foregroundColor(.white)
            .alert("지금 반납하시겠습니까?", isPresented: $present){
                Button("OK"){}
            } message : {
                Text("반납하시겠습니까?")
            }

            Button(action: {
                presentation.wrappedValue.dismiss()
            }) {
                Text("좀이따 반납할게요").bold()
            }
            .frame(width: 150, height: 35, alignment: .center)
            .background(RoundedRectangle(cornerRadius: 40).fill(.green))
            .font(.system(size: 16))
            .foregroundColor(Color.white)
        }
    }
}
struct returnModalView_Previews: PreviewProvider {
    static var previews: some View {
       returnModalView()
    }
}

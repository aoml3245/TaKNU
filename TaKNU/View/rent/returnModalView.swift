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
    @State var rentItem : String = ""
    var body: some View {
        VStack {
            HStack{
                Text("반납하기")
                    .font(.system(size: 30, weight: .black))
                    .padding(.leading, 30)
                Spacer()
            }
            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(Color(red: 217/255, green: 217/255, blue: 217/255))
                .overlay{
                    Image("돗자리")
                        .resizable()
                        .padding()
                }
                .frame(width: 330, height: 330)
            
            VStack(alignment: .leading, spacing: 10){
                Text("대여 일자 : 2022년 5월 12일 19시 40분")
                Text("반납 예정일 : 2022년 5월 13일 19시 40분")
            }
            .font(.system(size: 19, weight: .semibold))
            .padding(.vertical)
            
            Text("반납까지 5시간 41분 남았어요.")
                .font(.system(size: 19, weight: .semibold))

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

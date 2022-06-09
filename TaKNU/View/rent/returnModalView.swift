//
//  ModalView.swift
//  TaKNU
//
//  Created by 박상원 on 2022/05/10.
//
import SwiftUI
import Firebase

struct returnModalView: View {
    @ObservedObject var viewRouter : ViewRouter
    @Environment(\.presentationMode) var presentation
    @State var present: Bool = false
    
    @State var rentDate : Date = Date()
    @State var returnDate : Date = Date()
    @State var rentItem : String
    @State var nowTime : Date = Date()
    
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
                    Image(rentItem)
                        .resizable()
                        .padding()
                }
                .frame(width: 330, height: 330)
            
            VStack(alignment: .leading, spacing: 10){
                Text("대여일자 : \(rentDate, formatter: self.dateFormat())")
                Text("반납 예정일 : \(returnDate, formatter: self.dateFormat())")
            }
            .font(.system(size: 20, weight: .semibold))
            .padding(.vertical)
            
            Text("반납까지 \(getTimeInterval()) 남았습니다.")
                .font(.system(size: 19, weight: .semibold))
            
            Button(action:{
                present.toggle()
            }){
                Text("반납하기")
                    .font(.system(size: 16, weight: .bold))
            }
            .frame(width: 150, height: 40)
            .background(RoundedRectangle(cornerRadius: 40).fill(.orange))
            .foregroundColor(.white)
            .alert("지금 반납하시겠습니까?", isPresented: $present){
                Button("OK"){
                    returnTakeItem()
                    presentation.wrappedValue.dismiss()
                }
            } message : {
                Text("반납하시겠습니까?")
            }
            .shadow(color: .gray.opacity(0.5), radius: 10, x: 0, y: 0)
            Button(action: {
                presentation.wrappedValue.dismiss()
                
            }) {
                Text("좀이따 반납할게요").bold()
            }
            .frame(width: 150, height: 35, alignment: .center)
            .background(RoundedRectangle(cornerRadius: 40).fill(.green))
            .font(.system(size: 16))
            .foregroundColor(Color.white)
            .shadow(color: .gray.opacity(0.5), radius: 10, x: 0, y: 0)
        }
    }
    func dateFormat() -> DateFormatter{
        let formatter = DateFormatter()
        formatter.dateFormat = "Y. M. d a h:mm"
        return formatter
    }
    
    func getTimeInterval()-> String{
        var date = Int(self.returnDate.timeIntervalSince(self.nowTime))
        let second = date % 60
        date = date / 60
        let minute = date % 60
        date = date / 60
        
        let hour = date % 60
        date = date / 60
        
        let day = date % 24
        
        let ret = String(day) + "일" + String(hour) + "시" + String(minute) + "분" + String(second) + "초"
        
        return ret
        
    }
    
    func returnTakeItem(){
        let uid = Auth.auth().currentUser?.uid
        let ref: DatabaseReference! = Database.database().reference()
        
        ref.child("Thinglist/\(self.rentItem)").observeSingleEvent(of: .value, with: { snapshot in
            
            var s = snapshot.value! as? Int ?? 0
            print(s)
            
            s = s + 1
            ref.child("Thinglist/\(self.rentItem)").setValue(s)
            print ("반납 완료.")
            // user에 업데이트
            ref.child("Users/\(String(describing: uid!))/takerecode/").setValue(0)
            self.viewRouter.currentPage = "menuView"
        })
    }
}
struct returnModalView_Previews: PreviewProvider {
    static var previews: some View {
        returnModalView(viewRouter: ViewRouter(), rentItem: "충전기")
    }
}

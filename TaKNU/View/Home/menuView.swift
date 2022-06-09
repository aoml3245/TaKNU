import SwiftUI
import Firebase

struct menuView: View{
    var viewRouter : ViewRouter
    var rentViewModel: rentViewModel
    var rentItems = ["충전기", "돗자리", "담요", "멀티탭"]
    
    
    @State var showRent = false
    var body: some View{
        VStack(spacing: 0){
            HStack(spacing: 0){
                Image("logo1")
                    .resizable()
                    .scaledToFit()
            }
            .frame(width: 200,height: 40)
            .padding()
            
            ScrollView{
                Image("배너")
                    .resizable()
                    .clipped()
                    .frame(width: 330, height: 120)
                    .cornerRadius(20)
                    .padding()
                    .shadow(color: .gray.opacity(0.2), radius: 10, x: 0, y: 0)
                LazyVGrid(columns: [GridItem(), GridItem()]){
                    ForEach(rentViewModel.items){ item in
                        Button {
                            rentViewModel.choose(item)
                            viewRouter.rentItem = rentItems[item.id]
                            print(viewRouter.rentItem)
                            showRent = true
//                            viewRouter.currentPage = "rentView"
                            
                        } label: {
                            itemView(item: item)
                        }
                        .sheet(isPresented: self.$showRent){
                            rentView(viewRouter: viewRouter, rentViewModel: rentViewModel, rentItem: viewRouter.rentItem)
                        }
                        .shadow(color: .gray.opacity(0.2), radius: 10, x: 0, y: 0)

                    }
                }
                .frame(width: 340)
            }
            .frame(width: 350)
        }
    }
    
}

struct itemView: View{
    let item: rentModel<String>.Item
    var body: some View{
        VStack{
            HStack{
                Image(item.content)
                    .resizable()
                    .frame(width: 100, height: 100)
                    .padding()
            }
            .frame(width: 150, height: 150)
            .background(Color(red: 230/255, green: 230/255, blue: 230/255))
            .cornerRadius(18)
            Text(item.content)
                .font(.system(size: 19))
                .fontWeight(.bold)
                .foregroundColor(.secondary)
        }
    }
}

struct menuView_Previews: PreviewProvider {
    static var previews: some View {
        menuView(viewRouter: ViewRouter(), rentViewModel: rentViewModel())
    }
}

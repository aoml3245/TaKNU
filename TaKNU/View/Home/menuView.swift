import SwiftUI

struct menuView: View{
    let viewRouter : ViewRouter
    let rentViewModel: rentViewModel
    var body: some View{
        NavigationView{
            VStack(spacing: 0){
                HStack(spacing: 0){
                    Image("logo1")
                        .resizable()
                        .scaledToFit()
                }
                .frame(height: 30)
                .padding()
                
                ScrollView{
                    Image("배너")
                        .resizable()
                        .clipped()
                        .frame(width: 330, height: 120)
                        .cornerRadius(20)
                        .padding()
                    LazyVGrid(columns: [GridItem(), GridItem()]){
                        ForEach(rentViewModel.items){ item in
                            Button {
                                rentViewModel.choose(item)
                                viewRouter.currentPage = "rentView"
                            } label: {
                                itemView(item: item)
                            }

                        }
                    }
                }
            }
            .navigationBarTitle("")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarHidden(true)
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
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .frame(width: 100, height: 100)
                    .padding()
            }
            .frame(width: 150, height: 150)
            .background(Color(red: 220/255, green: 220/255, blue: 220/255))
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

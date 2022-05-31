import SwiftUI

enum RentItem{
    case mat, charger, blanket, multitab
}

struct menuView: View{
    @State var rentItem : RentItem = .mat
    @State var rentItemString: String = ""
    
    func selectedItem(rentItem: RentItem) -> String{
        switch rentItem {
        case .mat:
            return "돗자리"
        case .charger:
            return "충전기"
        case .blanket:
            return "담요"
        case .multitab:
            return "멀티탭"
        }
    }
    
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
                    HStack(spacing: 30){
                        NavigationLink(destination: rentView(rentItem: rentItemString)){
                            itemImage(imageName: selectedItem(rentItem: .mat))
                        }
                        .simultaneousGesture(TapGesture().onEnded{
                            self.rentItem = .mat
                            rentItemString = selectedItem(rentItem: self.rentItem)
                        })
                        
                        NavigationLink(destination: rentView(rentItem: rentItemString)){
                            itemImage(imageName: selectedItem(rentItem: .charger))
                        }
                        .simultaneousGesture(TapGesture().onEnded{
                            self.rentItem = .charger
                            rentItemString = selectedItem(rentItem: self.rentItem)
                        })
                    }.padding(30)
                    HStack(spacing: 30){
                        NavigationLink(destination: rentView(rentItem: rentItemString)){
                            itemImage(imageName: selectedItem(rentItem: .blanket))
                        }
                        .simultaneousGesture(TapGesture().onEnded{
                            self.rentItem = .blanket
                            rentItemString = selectedItem(rentItem: self.rentItem)
                        })
                        NavigationLink(destination: rentView(rentItem: rentItemString)){
                            itemImage(imageName: selectedItem(rentItem: .multitab))
                        }
                        .simultaneousGesture(TapGesture().onEnded{
                            self.rentItem = .multitab
                            rentItemString = selectedItem(rentItem: self.rentItem)
                        })
                    }
                }
            }
            .navigationBarTitle("")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarHidden(true)
        }
    }
}



struct menuView_Previews: PreviewProvider {
    static var previews: some View {
        menuView(rentItem: .blanket)
    }
}

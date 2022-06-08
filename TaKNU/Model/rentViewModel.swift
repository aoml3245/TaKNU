//
//  rentViewModel.swift
//  TaKNU
//
//  Created by 박상원 on 2022/06/03.
//
import SwiftUI

class rentViewModel: ObservableObject{
    static let rentItems = ["charger2", "mat", "blanket", "power"]
    typealias Item = rentModel<String>.Item
    
    static func createView() -> rentModel<String> {
        rentModel<String>(numberOfItems: 4){ numbers in
            rentItems[numbers]
        }
    }
    private var model: rentModel<String> = createView()
    
    var items: Array<Item>{
        model.items
    }
    
    // MARK: -Intent(s)
    func choose(_ item: Item){
        model.choose(item)
    }
    
    func getSelectedItem() -> String{
        print(model.selectedItem)
        return model.selectedItem
    }
}

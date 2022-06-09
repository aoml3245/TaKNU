//
//  rentViewModel.swift
//  TaKNU
//
//  Created by 박상원 on 2022/06/03.
//
import SwiftUI

class rentViewModel: ObservableObject{
    static let rentItems = ["충전기", "돗자리", "담요", "멀티탭"]
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

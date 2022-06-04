//
//  rentModel.swift
//  TaKNU
//
//  Created by 박상원 on 2022/06/03.
//

import Foundation
import SwiftUI

struct rentModel<ItemContent> where ItemContent: Equatable{
    private(set) var items: Array<Item>
    private(set) var atrs: Array<Atr>
    private(set) var selectedItem: String = ""
    
    mutating func choose(_ item: Item){
        let chosenIndex = index(of: item)
        let chosenItem = items[chosenIndex]
        selectedItem = item.content as! String
        print(chosenItem)
        print(selectedItem)
    }
    
    func returnselectedItem() -> String{
        return selectedItem
    }
    
    func index(of item: Item) -> Int{
        for index in 0..<items.count{
            if items[index].id == item.id{
                return index
            }
        }
        return 0
    }
    struct Item: Identifiable{
        var content: ItemContent
        var id: Int
    }
    
    init(numberOfItems: Int, createItemContent: (Int) -> ItemContent){
        items = Array<Item>()
        for numbers in 0..<numberOfItems{
            let content = createItemContent(numbers)
            items.append(Item(content: content, id: numbers))
        }
        atrs = Array<Atr>()
        atrs.append(Atr(id: 0))
    }
    
    func check(_ atr: Atr){
        let chosenIndex = atrIndex(of: atr)
        var chosenAtr = atrs[chosenIndex]
        chosenAtr.isChecked.toggle()
    }
    
    func atrIndex(of atr: Atr) -> Int{
        for index in 0..<atrs.count{
            if atrs[index].id == atr.id{
                return index
            }
        }
        return 0
    }
    
    struct Atr: Identifiable{
        var isChecked: Bool = false
        var shouldAlert: Bool = false
        var isActive: Bool = false
        var presentAlert: Bool = false
        var selectedDate: Date = Date()
        var returnDate: Date = Date()
        var id: Int
    }
    
}

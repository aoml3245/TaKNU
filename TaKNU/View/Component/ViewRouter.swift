//
//  ViewRouter.swift
//  TaKNU
//
//  Created by 서명원 on 2022/06/03.
//

import Foundation
import Combine
import SwiftUI



class ViewRouter: ObservableObject{
    let objectWillChange = PassthroughSubject<ViewRouter, Never> ()
    
    enum TabIndex{
        case home, rent, setting
    }
    
    @State var tabIndex: TabIndex = .home{
        didSet{
            if tabIndex == .home{
                houseColor = Color.green
                rentColor = Color.gray
                settingColor = Color.gray
            }
            else if tabIndex == .rent{
                houseColor = Color.gray
                rentColor = Color.purple
                settingColor = Color.gray
            }
            else if tabIndex == .setting{
                houseColor = Color.gray
                rentColor = Color.gray
                settingColor = Color.blue
            }
        }
    }
    
    var currentPage: String = "menuView"{
        didSet{
            objectWillChange.send(self)
        }
    }

    
    @State var houseColor: Color = Color.green
    @State var rentColor: Color  = Color.gray
    @State var settingColor: Color = Color.gray
    
    
    var rentItem: String = "돗자리"
    

}

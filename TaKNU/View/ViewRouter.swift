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
    
    var currentPage: String = "LoginView"{
        didSet{
            objectWillChange.send(self)
        }
    }
}

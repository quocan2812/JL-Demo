//
//  ItemCallModel.swift
//  JLDemo
//
//  Created by VN01-MAC-0005 on 05/06/2022.
//

import Foundation

struct ItemToCall : Decodable {
    var id : Int
    var name : String
    var number : String
}

struct ItemToBuy : Decodable {
    var id : Int
    var name : String
    var price : Int
    var quantity : Int
    var type : Int
}

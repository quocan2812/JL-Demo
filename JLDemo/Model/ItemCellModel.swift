//
//  ListItemModel.swift
//  JLDemo
//
//  Created by VN01-MAC-0005 on 05/06/2022.
//

import Foundation
import CoreData

struct ItemCellModel {
  
    var objectId: NSManagedObjectID?
    var id: Int16
    var name: String
    var price: Int32
    var quantity: Int16
    var number: String
    var type: Int16
    let typeObject: TypeListView
    
}

extension ItemCellModel {
    
    static func createItemCellModelFromItemToSellDB(itemCoreData: ItemToSell) -> ItemCellModel {
        return ItemCellModel(objectId: itemCoreData.objectID, id: itemCoreData.id, name: itemCoreData.name ?? "", price: itemCoreData.price, quantity: itemCoreData.quantity,number: "",type: itemCoreData.type ,typeObject: .sellList)
    }
    
    static func createItemCellModeFromItemToCallFromApi(itemCallFromApi: ItemToCall) -> ItemCellModel {
        return ItemCellModel(objectId: nil, id: Int16(itemCallFromApi.id), name: itemCallFromApi.name, price: 0, quantity: 0,number: itemCallFromApi.number,type: 0, typeObject: .callList)
    }
    
    static func createItemCellModeFromItemToBuyFromApi(itemBuyFromApi: ItemToBuy) -> ItemCellModel {
        return ItemCellModel(objectId: nil, id: Int16(itemBuyFromApi.id), name: itemBuyFromApi.name, price: Int32(itemBuyFromApi.price), quantity: Int16(itemBuyFromApi.quantity),number: "",type: Int16(itemBuyFromApi.type), typeObject: .buyList)
    }
}


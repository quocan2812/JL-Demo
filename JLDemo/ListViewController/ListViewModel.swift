//
//  ListViewModel.swift
//  JLDemo
//
//  Created by VN01-MAC-0005 on 05/06/2022.
//

import Foundation

final class ListViewModel {
    let typeListView: TypeListView
    
    init (typeListView: TypeListView) {
        self.typeListView = typeListView
    }
    
    var datasource: [ItemCellModel]?
    
    func getTitleListView() -> String {
        var title : String
        switch typeListView {
        case .callList:
            title = "Call List"
        case .buyList:
            title = "Buy List"
        case .sellList:
            title = "Sell List"
        }
        return title
    }
}

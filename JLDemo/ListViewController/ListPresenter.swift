//
//  ListVCPresenter.swift
//  JLDemo
//
//  Created by VN01-MAC-0005 on 04/06/2022.
//

import Foundation

protocol ListPresenterProtocol {
    func showDataOnListView(datasource: [AnyObject], typeListView: TypeListView)
    func showErrorOnListView(error: Error)
}

final class ListPresenter {
    weak var viewController: ListViewController?
    
    init(viewController: ListViewController) {
        self.viewController = viewController
    }
}

extension ListPresenter: ListPresenterProtocol {
   
    func showDataOnListView(datasource: [AnyObject], typeListView: TypeListView) {
        //formatData
        var itemCells = [ItemCellModel]()
        switch typeListView {
        case .callList:
            for object in datasource {
                if object is ItemToCall {
                    itemCells.append(ItemCellModel.createItemCellModeFromItemToCallFromApi(itemCallFromApi: object as! ItemToCall))
                }
            }

        case .buyList:
            for objetct in datasource {
                if objetct is ItemToBuy {
                    itemCells.append(ItemCellModel.createItemCellModeFromItemToBuyFromApi(itemBuyFromApi: objetct as! ItemToBuy))
                }
            }
        case .sellList:
            for object in datasource {
                if object is ItemToSell {
                    itemCells.append(ItemCellModel.createItemCellModelFromItemToSellDB(itemCoreData: object as! ItemToSell))
                }
            }
        }
        
        DispatchQueue.main.async {
            self.viewController?.showDataOnListView(datasource: itemCells)
        }
 
    }
    
    func showErrorOnListView(error: Error) {
        DispatchQueue.main.async {
            self.viewController?.showAlertIfHasError()
        }
    }
}


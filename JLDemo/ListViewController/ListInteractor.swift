//
//  ListInteractor.swift
//  JLDemo
//
//  Created by VN01-MAC-0005 on 04/06/2022.
//

import Foundation

protocol ListInteractorProtocol {
    
    func loadDataWithType(typeListView: TypeListView)

    
}

final class ListInteractor: ListInteractorProtocol {
    private let presenter : ListPresenterProtocol
    private let apiWorker : ApiWorkerProtocol
    private let coredataWorker : CoreDataWorkerProtocol
    
    
    init (presenter: ListPresenterProtocol, apiWorker: ApiWorkerProtocol, coredataWorker: CoreDataWorkerProtocol) {
        self.presenter = presenter
        self.apiWorker = apiWorker
        self.coredataWorker = coredataWorker
    }
    
    func loadDataWithType(typeListView: TypeListView) {
        switch typeListView {
        case .callList:
            self.loadDataCallListFromApi()
        case .buyList:
            self.loadDataBuyListFromApi()
        case .sellList:
            self.loadDataSellListFromDatabase()
        }
    }
    
    private func loadDataSellListFromDatabase() {
        self.coredataWorker.getDataFromLocal { itemToSells in
            self.presenter.showDataOnListView(datasource: itemToSells, typeListView: .sellList)
        } onFail: { error in
            if let error = error {
                self.presenter.showErrorOnListView(error: error)
            }
            
        }

    }
    
    private func loadDataCallListFromApi() {
        self.apiWorker.getDataFromApiToCall { itemToCalls in
            self.presenter.showDataOnListView(datasource: itemToCalls as [AnyObject], typeListView: .callList)
        
        } onFail: { error in
            if let error = error {
                self.presenter.showErrorOnListView(error: error)
            }
        }
    }
    
    func loadDataBuyListFromApi() {
        self.apiWorker.getDataFromApiToBuy { itemToBuys in
            self.presenter.showDataOnListView(datasource: itemToBuys as [AnyObject], typeListView: .buyList)
        } onFail: { error in
            if let error = error {
                self.presenter.showErrorOnListView(error: error)
            }
        }

    }
}

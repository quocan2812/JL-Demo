//
//  ListVCConfig.swift
//  JLDemo
//
//  Created by VN01-MAC-0005 on 04/06/2022.
//

import Foundation
import UIKit

final class ListConfig {
    static func makeListViewController(typeListView: TypeListView) -> ListViewController {
        let listViewController = ListViewController()
        
        let presenter = ListPresenter(viewController: listViewController)
        
        let apiWorker = ApiWorker()
        let coredataWorker = CoreDataWorker()
        
        let interactor = ListInteractor(presenter: presenter, apiWorker: apiWorker, coredataWorker: coredataWorker)
        
        listViewController.interactor = interactor
        listViewController.typeListView = typeListView
        
        return listViewController
    }
}

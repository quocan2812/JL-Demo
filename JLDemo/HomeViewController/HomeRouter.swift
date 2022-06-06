//
//  HomeRounter.swift
//  JLDemo
//
//  Created by VN01-MAC-0005 on 04/06/2022.
//

import Foundation
import UIKit

enum TypeListView {
    case callList
    case buyList
    case sellList
}

protocol HomeVCRounterProtolcol {
    var viewController: HomeViewController? { get set }
    
    func navigateToListView(typeList: TypeListView)
}

final class HomeRouter {
    
    weak var viewController: HomeViewController?
    
    private var nav: UINavigationController? {
        viewController?.navigationController
    }
    
    init(viewController: HomeViewController) {
        self.viewController = viewController
    }
}

extension HomeRouter: HomeVCRounterProtolcol {
    func navigateToListView(typeList: TypeListView) {
        let listViewController = ListConfig.makeListViewController(typeListView: typeList)
        nav?.pushViewController(listViewController, animated: true)

    }
}

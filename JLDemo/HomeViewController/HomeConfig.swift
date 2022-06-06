//
//  HomeConfig.swift
//  JLDemo
//
//  Created by VN01-MAC-0005 on 04/06/2022.
//

import Foundation
import UIKit

final class HomeConfig {
    static func makeListViewController(viewController: HomeViewController) -> HomeViewController {
        let router = HomeRouter(viewController: viewController)
        viewController.router = router
        return viewController
    }
}

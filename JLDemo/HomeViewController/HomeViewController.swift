//
//  ViewController.swift
//  JLDemo
//
//  Created by VN01-MAC-0005 on 04/06/2022.
//

import UIKit

final class HomeViewController: UIViewController {
    
    var router: HomeVCRounterProtolcol?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        _ = HomeConfig.makeListViewController(viewController: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func onClickCallButton(_ sender: Any) {
        router?.navigateToListView(typeList: .callList)
        
    }
    
    @IBAction func onClickBuyButton(_ sender: Any) {
        router?.navigateToListView(typeList: .buyList)
    }
    
    @IBAction func onClickSellButton(_ sender: Any) {
        router?.navigateToListView(typeList: .sellList)
    }
}


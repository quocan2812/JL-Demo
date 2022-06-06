//
//  ListTableViewCell.swift
//  JLDemo
//
//  Created by VN01-MAC-0005 on 05/06/2022.
//

import UIKit

class ListTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var nameValueLabel: UILabel!
    
    @IBOutlet weak var priceLabel: UILabel!
    
    @IBOutlet weak var priceValueLabel: UILabel!
    
    @IBOutlet weak var quantityLabel: UILabel!
    
    @IBOutlet weak var quantityValueLabel: UILabel!
    
    //layout
    
    @IBOutlet weak var topLayoutContraintNameLabel: NSLayoutConstraint!
    
    @IBOutlet weak var widthLayoutContraintPriceLabel: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configCell(itemCell : ItemCellModel, typeListView : TypeListView) {
        switch typeListView {
        case .callList:
            configCellTypeCallApiList(itemCell: itemCell)
        case .buyList, .sellList:
            configCellTypeSellList(itemCell: itemCell)
        }
    }
    
    private func configCellTypeSellList(itemCell: ItemCellModel) {
        self.nameValueLabel.text = itemCell.name
        self.priceValueLabel.text = String(itemCell.price)
        self.quantityValueLabel.text = String(itemCell.quantity)
        
    }
    
    private func configCellTypeCallApiList(itemCell: ItemCellModel) {
        //change Layout a little
        self.topLayoutContraintNameLabel.constant = 25
        self.widthLayoutContraintPriceLabel.constant = 70
        self.quantityLabel.isHidden = true
        self.quantityValueLabel.isHidden = true
       //set value
        self.nameValueLabel.text = itemCell.name
        self.priceLabel.text = "Number:"
        self.priceValueLabel.text = itemCell.number

    }
    
}

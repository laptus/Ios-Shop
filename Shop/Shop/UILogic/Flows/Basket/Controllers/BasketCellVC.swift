//
//  BasketCellVC.swift
//  Shop
//
//  Created by Laptev Sasha on 03/08/2018.
//  Copyright © 2018 Laptev Sasha. All rights reserved.
//

import UIKit

class BasketCellVC: UITableViewCell {
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var name: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

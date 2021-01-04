//
//  ResultTCell.swift
//  MoneyGift
//
//  Created by leeyuno on 07/08/2019.
//  Copyright © 2019 leeyuno. All rights reserved.
//

import UIKit

class ResultTCell: UITableViewCell {
    
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!

    @IBOutlet weak var moneyImage: UIImageView!
    @IBOutlet weak var innerView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}

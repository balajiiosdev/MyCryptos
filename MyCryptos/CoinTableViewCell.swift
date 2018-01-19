//
//  CoinTableViewCell.swift
//  MyCryptos
//
//  Created by Balaji on 19/01/18.
//  Copyright © 2018 Synchronoss. All rights reserved.
//

import UIKit

class CoinTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var rankLabel: UILabel!

    @IBOutlet weak var priceUSDLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

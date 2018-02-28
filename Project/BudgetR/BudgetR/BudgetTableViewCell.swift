//
//  BudgetTableViewCell.swift
//  BudgetR
//
//  Created by Ross Blassingame on 2/28/18.
//  Copyright © 2018 Ross Blassingame. All rights reserved.
//

import UIKit

class BudgetTableViewCell: UITableViewCell {
	
	@IBOutlet weak var categoryNameLabel: UILabel!
	@IBOutlet weak var categoryAmountLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

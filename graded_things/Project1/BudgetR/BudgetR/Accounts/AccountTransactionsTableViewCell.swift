//
//  AccountTransactionsTableViewCell.swift
//  BudgetR
//
//  Created by Ross Blassingame on 3/1/18.
//  Copyright © 2018 Ross Blassingame. All rights reserved.
//

import UIKit

class AccountTransactionsTableViewCell: UITableViewCell {
	
	@IBOutlet weak var payeeLabel: UILabel!
	@IBOutlet weak var amountLabel: UILabel!
	@IBOutlet weak var categoryLabel: UILabel!
	@IBOutlet weak var dateLabel: UILabel!
	
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

//
//  AccountTableViewCell.swift
//  BudgetR
//
//  Created by Ross Blassingame on 2/14/18.
//  Copyright © 2018 Ross Blassingame. All rights reserved.
//

import UIKit

class AccountTableViewCell: UITableViewCell {
	
	//MARK: Properties
	@IBOutlet weak var accountNameLabel: UILabel!
	@IBOutlet weak var accountBalanceLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

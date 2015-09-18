//
//  AccountTableViewCell.swift
//  PasswordManager
//
//  Created by Hamza Ansari on 10/08/15.
//  Copyright (c) 2015 HamzaAnsari. All rights reserved.
//

import UIKit

class AccountTableViewCell: UITableViewCell {

  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var descLabel: UILabel!
  @IBOutlet weak var accontLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

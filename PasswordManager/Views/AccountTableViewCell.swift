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
  @IBOutlet weak var passwordField: UITextField!
  @IBOutlet weak var accontLabel: UILabel!
    @IBOutlet weak var showHideButton: UIButton!

    func update(account: Account){
        accontLabel.text = account.title + " (\(account.username))"
        passwordField.text = account.decryptedPassword()
        
        if let firstChar = account.title.characters.first {
            titleLabel.text = "\(firstChar)"
        }else if let firstChar = account.username.characters.first{
            titleLabel.text = "\(firstChar)"
        }
    }
    
    func show(_ isShow: Bool=true){
        if isShow{
            passwordField.isSecureTextEntry = false
            showHideButton.setTitle("Hide", for: .normal)
        }else{
            passwordField.isSecureTextEntry = true
            showHideButton.setTitle("Show", for: .normal)
        }
    }
}

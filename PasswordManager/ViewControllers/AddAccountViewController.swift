//
//  AddAccountViewController.swift
//  PasswordManager
//
//  Created by Hamza Ansari on 10/08/15.
//  Copyright (c) 2015 HamzaAnsari. All rights reserved.
//

import UIKit

class AddAccountViewController: UITableViewController {
    
    @IBOutlet weak var accountTextField: UITextField!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
   // @IBOutlet weak var webTextField: UITextField!
    @IBOutlet weak var colorButton: UIButton!

    var account: Account?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let account = account{
            accountTextField.text = account.title
            usernameTextField.text = account.username
            passwordTextField.text = account.decryptedPassword()
        }else{
            account = Account()
        }
        
        accountTextField.becomeFirstResponder()
    }

    @IBAction func doneTapped(_ sender: UIBarButtonItem){
        let title = accountTextField.text!
        let password = passwordTextField.text!
        let username = usernameTextField.text!
        //let website = webTextField.text!
        
        guard !title.isEmpty && !password.isEmpty else {
            SwiftNotice.showNoticeWithText(.error, text: "Require Title \nand Password", autoClear: true)
            return
        }
        
        account!.updateAccount(title: title, password: password, username: username, website: "")
        self.performSegue(withIdentifier: "exitToAccounts", sender: nil)
    }
    
    @IBAction func unwindToAddAccount(_ segue: UIStoryboardSegue){
        if segue.identifier == "exitToAddAccount"{
            let destinationVC = segue.source as! ColorsTableViewController
            colorButton.backgroundColor = Colors.brandColors[destinationVC.selectedColorRow]
        }
    }
}

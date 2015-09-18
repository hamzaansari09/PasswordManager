//
//  ViewController.swift
//  PasswordManager
//
//  Created by Hamza Ansari on 08/08/15.
//  Copyright (c) 2015 HamzaAnsari. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {

  @IBOutlet weak var passwordTextField: UITextField!
  let password = SSKeychain.passwordForService(Keys.service, account: Keys.master)

  override func viewDidLoad() {
    super.viewDidLoad()
    self.navigationController?.navigationBarHidden = true
    
    let keyView = UIImageView(frame:CGRect(x:0, y:0, width:24, height:30))
    keyView.image = UIImage(named: "key")
    keyView.contentMode = .Center
    passwordTextField.leftView = keyView
    passwordTextField.leftViewMode = .Always
    passwordTextField.becomeFirstResponder()
    passwordTextField.secureTextEntry = true
    passwordTextField.addTarget(self, action: "didChange:", forControlEvents: UIControlEvents.EditingChanged)
  }
  
  //MARK: TextFieldDelegate
  func didChange(textField:UITextField){
    if textField.text == password{
      performSegueWithIdentifier("gotoAccounts", sender: nil)
    }
  }
  
  @IBAction func watchPasswordTapped() {
    if !passwordTextField.text.isEmpty{
      passwordTextField.secureTextEntry = !passwordTextField.secureTextEntry
    }
  }
  
  @IBAction func enterTapped() {
    if passwordTextField.text == password{
      performSegueWithIdentifier("gotoAccounts", sender: nil)
    }else{
      SwiftNotice.showNoticeWithText(NoticeType.error, text: "Wrong Password", autoClear: true)
    }
  }

}


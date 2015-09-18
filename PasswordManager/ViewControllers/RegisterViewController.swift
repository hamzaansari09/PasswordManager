//
//  RegisterViewController.swift
//  PasswordManager
//
//  Created by Hamza Ansari on 08/08/15.
//  Copyright (c) 2015 HamzaAnsari. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController, UITextFieldDelegate {

  @IBOutlet weak var passwordTextField: UITextField!
  
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
        // Do any additional setup after loading the view.
    }


  @IBAction func watchPasswordTapped() {
    if !passwordTextField.text.isEmpty{
      passwordTextField.secureTextEntry = !passwordTextField.secureTextEntry
    }
  }
  
  @IBAction func RegisterTapped() {
    if count(passwordTextField.text)>=4{
      if SSKeychain.setPassword(passwordTextField.text, forService: Keys.service , account: Keys.master){
        performSegueWithIdentifier("gotoAccounts", sender: nil)
      }
    }else{
      SwiftNotice.showNoticeWithText(NoticeType.info, text: "Too short!", autoClear: true)
    }
  }
  
}

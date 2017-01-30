//
//  RegisterViewController.swift
//  PasswordManager
//
//  Created by Hamza Ansari on 08/08/15.
//  Copyright (c) 2015 HamzaAnsari. All rights reserved.
//

import UIKit
import SwiftKeychainWrapper

class RegisterViewController: UIViewController, UITextFieldDelegate {

  @IBOutlet weak var passwordTextField: UITextField!
  
    override func viewDidLoad() {
        super.viewDidLoad()
      self.navigationController?.isNavigationBarHidden = true
      
      let keyView = UIImageView(frame:CGRect(x:0, y:0, width:24, height:30))
      keyView.image = UIImage(named: "key")
      keyView.contentMode = .center
      passwordTextField.leftView = keyView
      passwordTextField.leftViewMode = .always
      passwordTextField.becomeFirstResponder()
      passwordTextField.isSecureTextEntry = true
        // Do any additional setup after loading the view.
    }


  @IBAction func watchPasswordTapped() {
    if !passwordTextField.text!.isEmpty{
      passwordTextField.isSecureTextEntry = !passwordTextField.isSecureTextEntry
    }
  }
  
  @IBAction func RegisterTapped() {
    if passwordTextField.text!.characters.count>=4{
      if KeychainWrapper.standard.set(passwordTextField.text!, forKey: Keys.master){
        performSegue(withIdentifier: "gotoAccounts", sender: nil)
      }
    }else{
      SwiftNotice.showNoticeWithText(NoticeType.info, text: "Too short!", autoClear: true)
    }
  }
  
}

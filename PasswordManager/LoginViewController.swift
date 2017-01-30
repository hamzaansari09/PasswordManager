//
//  ViewController.swift
//  PasswordManager
//
//  Created by Hamza Ansari on 08/08/15.
//  Copyright (c) 2015 HamzaAnsari. All rights reserved.
//

import UIKit
import SwiftKeychainWrapper

class LoginViewController: UIViewController, UITextFieldDelegate {

  @IBOutlet weak var passwordTextField: UITextField!
  let password = KeychainWrapper.standard.string(forKey: Keys.master)

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
    passwordTextField.addTarget(self, action: #selector(LoginViewController.didChange(_:)), for: UIControlEvents.editingChanged)
  }
  
  //MARK: TextFieldDelegate
  func didChange(_ textField:UITextField){
    guard let password = password else {
        return
    }
    if textField.text == password{
      performSegue(withIdentifier: "gotoAccounts", sender: nil)
    }
  }
  
  @IBAction func watchPasswordTapped() {
    if !passwordTextField.text!.isEmpty{
      passwordTextField.isSecureTextEntry = !passwordTextField.isSecureTextEntry
    }
  }
}


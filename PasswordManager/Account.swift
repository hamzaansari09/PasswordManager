//
//  Account.swift
//  PasswordManager
//
//  Created by Hamza Ansari on 10/08/15.
//  Copyright (c) 2015 HamzaAnsari. All rights reserved.
//

import Foundation

struct Account {
  let title:String!
  let password:String!
  let username:String?
  let account:String?
  let website:String?
  let description:String?
}

func getAllAcounts()->[Account]{
  var accounts:[Account] = []
  if let savedAccount = NSUserDefaults.standardUserDefaults().arrayForKey("accounts"){
    for data in savedAccount{
    let account = data as! NSDictionary
      let password = SSKeychain.passwordForService(Keys.service, account: account["title"] as! String)
      let passAccount = Account(title: account["title"], password:password, username: account["username"], account: account["account"], website: account["web"], description: account["desc"])
    }
  }
  return account
}

//
//  Account.swift
//  PasswordManager
//
//  Created by Hamza Ansari on 10/08/15.
//  Copyright (c) 2015 HamzaAnsari. All rights reserved.
//

import Foundation
import CryptoSwift

fileprivate let secret = "6241540314417463"
fileprivate let iv = "8459203144123486"

class Account: SQLTable {
    
    var id = -1
    var title:String = ""
    var password:String = ""
    var username:String = ""
    var website:String = ""
    
    func updateAccount(title: String, password: String, username: String, website: String){
        self.title = title
        self.username = username
        self.website = website
        self.password = encrypt(password: password)
        save()
    }
    
    
    func encrypt(password: String)->String{
        do {
            let encryptedPass = try password.utf8.map{$0}.encrypt(cipher: AES(key: secret, iv: iv))
            return encryptedPass.toBase64() ?? ""
        } catch {
            print("Encrytion failed")
            return ""
        }
    }
    
    func decryptedPassword()->String?{
        let decrypted = try? password.decryptBase64ToString(cipher: AES(key: secret, iv: iv))
        return decrypted
    }
}

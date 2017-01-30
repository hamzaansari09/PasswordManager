//
//  AccountsViewController.swift
//  PasswordManager
//
//  Created by Hamza Ansari on 10/08/15.
//  Copyright (c) 2015 HamzaAnsari. All rights reserved.
//

import UIKit

class AccountsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var noAccountView: UIView!
    
    var accounts:[Account] = []
    var showPasswordRow: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.tableFooterView = UIView(frame: .zero)
        getAccounts()
    }
    
    func getAccounts(){
        accounts = Account.rows() as! [Account]
        showPasswordRow = nil
        tableView.reloadData()
        noAccountView.isHidden = !accounts.isEmpty
    }
    
    @IBAction func unwindToAccount(_ segue: UIStoryboardSegue){
        if segue.identifier == "exitToAccounts"{
            getAccounts()
        }
    }
}

extension AccountsViewController{
    //MARK: UITableViewDataSource
    
    func numberOfSectionsInTableView(_ tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return accounts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAtIndexPath indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! AccountTableViewCell
        let account = accounts[indexPath.row]
        cell.update(account: account)
        cell.showHideButton.addTarget(self, action: #selector(showHideTapped(_:)), for: .touchUpInside)
        if let row = showPasswordRow, indexPath.row == row{
            cell.show()
        }else{
            cell.show(false)
        }
        return cell
    }
    
    @IBAction func showHideTapped(_ sender: UIButton){
        
        let touchPoint = sender.convert(CGPoint.zero, to: self.tableView)
        guard let indexPath = tableView.indexPathForRow(at: touchPoint),
            let cell = tableView.cellForRow(at: indexPath) as? AccountTableViewCell
            else{
                return
        }
        
        if let row = showPasswordRow, row != indexPath.row{
            showPasswordRow = indexPath.row
            tableView.reloadRows(at: [IndexPath(row: row, section: 0)], with: .automatic)
        }
        if cell.passwordField.isSecureTextEntry{
            showPasswordRow = indexPath.row
            cell.show()
        }else{
            showPasswordRow = nil
            cell.show(false)
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            let account = accounts.remove(at: indexPath.row)
            _ = account.delete()
            if accounts.isEmpty{
                getAccounts()
            }else{
                tableView.deleteRows(at: [indexPath], with: .automatic)
            }
        }
    }


    //MARK: UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAtIndexPath indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAtIndexPath indexPath: IndexPath) -> CGFloat {
        return 81
    }
    
}

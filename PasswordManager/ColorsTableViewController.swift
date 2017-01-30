//
//  ColorsTableViewController.swift
//  PasswordManager
//
//  Created by Hamza Ansari on 25/01/17.
//  Copyright © 2017 HamzaAnsari. All rights reserved.
//

import UIKit

class ColorsTableViewController: UITableViewController {

    var selectedColorRow = 0
    let colors = Colors.brandColors
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colors.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.backgroundColor = colors[indexPath.row]
        if indexPath.row == selectedColorRow{
            cell.accessoryType = .checkmark
        }else{
            cell.accessoryType = .none
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedColorRow = indexPath.row
        performSegue(withIdentifier: "exitToAddAccount", sender: nil)
    }
}

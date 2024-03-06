//
//  ViewController.swift
//  INotes
//
//  Created by Karthiga on 05/03/24.
//

import UIKit

class TodolistViewController: UITableViewController {
    
    
    var items = ["today","work","tomorrow","new"]
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }

//MARK--tableview datasourse methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "todolistcell", for: indexPath)
        cell.textLabel?.text = items[indexPath.row]
        return cell
    }
    //MARK--tableview delegate methods
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark{
            
            tableView.cellForRow(at: indexPath)?.accessoryType == .none
        }else{
            tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark
        }
        tableView.deselectRow(at: indexPath, animated: true)
}

    //MARK--- add new item
    @IBAction func addaction(_ sender: Any) {
        var textfield = UITextField()
        let alert = UIAlertController(title: "add new inotes item", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "add item", style: .default) { (action)in
            //items.append(textfield.text)
            self.items.append(textfield.text!)
            self.tableView.reloadData()
            print(textfield.text)
        }
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "create new items"
            
            textfield = alertTextField
            //print(alertTextField.text)
        }
        alert.addAction(action)
        present(alert,animated: true,completion: nil)
    }
    
}

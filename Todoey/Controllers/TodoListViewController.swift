//
//  ViewController.swift
//  Todoey
//
//  Created by Zeyad Atef on 1/24/19.
//  Copyright © 2019 ZeyadAtef. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {
    
    let defaults = UserDefaults.standard
    
    var itemArray : [Item] = [Item]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let newItem = Item(itemTitle: "Find Mike")
        let newItem2 = Item(itemTitle: "Buy Eggos", doneStatus: true)
        let newItem3 = Item(itemTitle: "Destroy Demogorgon")
        
        itemArray.append(newItem)
        itemArray.append(newItem2)
        itemArray.append(newItem3)
        
        if let items = defaults.array(forKey: "TodoListArray") as? [Item] {
            itemArray = items
        }
    }
    
    //MARK - TableView Datasource Methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        let item = itemArray[indexPath.row]
        
        cell.textLabel?.text = item.title
        
        cell.accessoryType = item.done ? .checkmark : .none
        
        return cell
    }
    
    //MARK - TableView Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        itemArray[indexPath.row].done = !itemArray[indexPath.row].done

        tableView.reloadData()
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    //MARK - Add New Todo Item
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
    
        let alert = UIAlertController(title: "Add New Todoey Item", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            // What will happen when user clicks Add Item on UIAlert
            
            self.itemArray.append(Item(itemTitle: textField.text!))
            
            self.defaults.setValue(self.itemArray, forKey: "TodoListArray")
            
            self.tableView.reloadData()
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create New Item"
            textField = alertTextField
        }
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    
    }
    
    
    


}


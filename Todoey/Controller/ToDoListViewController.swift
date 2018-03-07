//
//  ViewController.swift
//  ToDoey
//
//  Created by Louis Menacho on 3/6/18.
//  Copyright © 2018 Louis Menacho. All rights reserved.
//

import UIKit

class ToDoListViewController: UITableViewController {
    
    var itemArray = [Item]()
    let defaults = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
        loadData()
    }
    
    
    //MARK: - TableView Datasource Methods
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        cell.textLabel?.text = itemArray[indexPath.row].title
        cell.accessoryType = itemArray[indexPath.row].done ? .checkmark : .none
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    
    //MARK: - TableView Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let cell = tableView.cellForRow(at: indexPath)!
        itemArray[indexPath.row].done = !itemArray[indexPath.row].done
        cell.accessoryType = itemArray[indexPath.row].done ? .checkmark : .none
        saveData()
        
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    //MARK: - Add New Items
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add New Todoey Item", message: "", preferredStyle: .alert )
        
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            let newItem = Item()
            newItem.title = textField.text!
            self.itemArray.append(newItem)
            self.saveData()
            self.tableView.reloadData()
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new item"
            textField = alertTextField
        }
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }
    
    
    //MARK: - Model Manipulation Methods
    func saveData() {
        var storedData = [[String:Bool]]()
        for item in itemArray {
            storedData.append([item.title : item.done])
        }
        print(storedData)
        defaults.set(storedData, forKey: "itemArray")
    }
    
    func loadData() {
        if let storedData = defaults.array(forKey: "itemArray") as? [[String:Bool]] {
            for data in storedData {
                for (key, value) in data {
                    let item = Item()
                    item.title = key
                    item.done = value
                    itemArray.append(item)
                    print(itemArray)
                }
            }
        }

    }
}


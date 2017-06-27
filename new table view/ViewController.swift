//
//  ViewController.swift
//  new table view
//
//  Created by Menachem Barber on 5/19/17.
//  Copyright © 2017 Menachem Barber. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var itemArray: NewItemArray!
    
    
//    let newItemArray = NewItemArray()
    
    @IBOutlet weak var segmentedControlOutlet: UISegmentedControl!
    
    @IBAction func segmentedControlAction(_ sender: UISegmentedControl) {
        catogorizeMyTable()
    }
    
    
    @IBOutlet weak var myTableView: UITableView!
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        myTableView.dataSource = self
        myTableView.delegate = self
        itemArray = NewItemArray()
        
        myTableView.rowHeight = UITableViewAutomaticDimension
        myTableView.estimatedRowHeight = 44
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.secondItemArray.count
    }
    
    
    
    
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myTableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! NewCellLabel
        let myItem = itemArray.secondItemArray[indexPath.row]
        
        cell.customCellLabel.text = myItem.name
        
        cell.customCellLabel.sizeToFit()
        
        
        if myItem.done {
        cell.accessoryType = .checkmark
            cell.customCellLabel.alpha = 0.1
        } else {
            cell.accessoryType = .none
            cell.customCellLabel.alpha = 1
        }
        
        return cell
        
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "segue1"?:
            if let row = myTableView.indexPathForSelectedRow?.row {
                let item = itemArray.secondItemArray[row]
                let secondViewController = segue.destination as! SecondViewController
                secondViewController.items = item
                secondViewController.itemsArray = itemArray
                secondViewController.segueIdentifier = segue.identifier!
                                
            }
        case "ItemSegue"?:
            
                let secondViewController = segue.destination as! SecondViewController
                
                
                print(itemArray.secondItemArray.count)
                secondViewController.itemsArray = itemArray
                   
        default:
            preconditionFailure("help")
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationItem.leftBarButtonItem = editButtonItem
        
              catogorizeMyTable()
        
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let item = itemArray.secondItemArray[indexPath.row]
            let title = "delete \(item.name)?"
            let message = "are you sure you want to delete this item?"
            let ac = UIAlertController(title: title, message: message, preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            ac.addAction(cancelAction)
            let deleteAction = UIAlertAction(title: "Delete", style: .destructive, handler: { (action) -> Void in
            self.itemArray.removeItem(item)
            self.myTableView.deleteRows(at: [indexPath], with: .automatic)
            
        })
            ac.addAction(deleteAction)
            present(ac, animated: true, completion: nil)
    }
    
    }
    
    
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        if editing {
        myTableView.setEditing(true, animated: true)
        } else {
            myTableView.setEditing(false, animated: true)
        }
        
        
    }
    
    
    
     func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        itemArray.moveItem(from: sourceIndexPath.row, to: destinationIndexPath.row)
    }

    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        var isItemSelected = itemArray.secondItemArray[indexPath.row].done
        var titleName = ""
        
        if isItemSelected == true {
            titleName = "deselect"
        } else {
            titleName = "select"
        }
        
        let selectButton = UITableViewRowAction(style: .normal, title: titleName) { (action, indexPath) in
            self.itemArray.secondItemArray[indexPath.row].done = !self.itemArray.secondItemArray[indexPath.row].done
            
            self.catogorizeMyTable()
        }
        if isItemSelected == true {
            selectButton.backgroundColor = UIColor.blue
        } else {
            selectButton.backgroundColor = UIColor.orange
        }

        
        let deleteButton = UITableViewRowAction(style: .destructive, title: "Delete") { (action, indexPath) in
            let item = self.itemArray.secondItemArray[indexPath.row]
            let title = "Delete \(item.name)?"
            let message = "Are you sure that you want to delete this item?"
            let alertController = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
            
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            
            alertController.addAction(cancelAction)
            let deleteAction = UIAlertAction(title: "Delete", style: .destructive, handler: { (action) in
                self.itemArray.removeItem(item)
                self.myTableView.deleteRows(at: [indexPath], with: .right)
            })
            alertController.addAction(deleteAction)
            self.present(alertController, animated: true, completion: nil)
        }
        
        
        
        return [selectButton, deleteButton]
            }
    
    func catogorizeMyTable() {
        
        switch segmentedControlOutlet.selectedSegmentIndex {
        case 0:
            
            itemArray.addToArray(category: "all")
            myTableView.reloadData()
        case 1:
            
            itemArray.addToArray(category: "notDone")
            myTableView.reloadData()
        case 2:
            itemArray.addToArray(category: "done")
            myTableView.reloadData()
            
        default:
            break
        }
    }

    
  
}


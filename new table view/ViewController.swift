//
//  ViewController.swift
//  new table view
//
//  Created by Menachem Barber on 5/19/17.
//  Copyright © 2017 Menachem Barber. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    var itemArray: NewItemArray!
    
//    let newItemArray = NewItemArray()
    
    
    
    
    @IBOutlet weak var myTableView: UITableView!
    
    
    
    @IBAction func addACell(_ sender: UIBarButtonItem) {
        
      let newItem = itemArray.createdItem()
        
        if let index = itemArray.newItemArray.index(of: newItem) {
            let indexPath = IndexPath(row: index, section: 0)
            myTableView.insertRows(at: [indexPath], with: .automatic)
        }
        
        
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        myTableView.dataSource = self
        itemArray = NewItemArray()
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.newItemArray.count
    }
    
    
    
    
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myTableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath)
        let myItem = itemArray.newItemArray[indexPath.row]
        cell.textLabel?.text = myItem.name
        return cell
        
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "segue1"?:
            if let row = myTableView.indexPathForSelectedRow?.row {
                let item = itemArray.newItemArray[row]
                let secondViewController = segue.destination as! SecondViewController
                secondViewController.items = item
            }
        case "ItemSegue"?:
            if let row = myTableView.indexPathForSelectedRow?.row {
                let item = itemArray.newItemArray[row]
                let secondViewController = segue.destination as! SecondViewController
                
                secondViewController.items = item
                secondViewController.itemsArray = itemArray
                
            }
            
        default:
            preconditionFailure("help")
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        myTableView.reloadData()
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

    
  
}


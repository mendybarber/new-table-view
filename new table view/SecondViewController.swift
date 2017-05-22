//
//  SecondViewController.swift
//  new table view
//
//  Created by Menachem Barber on 5/22/17.
//  Copyright © 2017 Menachem Barber. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UINavigationControllerDelegate {
    var items: NewItem! {
        didSet {
            navigationItem.title = items.name
            
        }
    }
    var itemsArray: NewItemArray!
    
    @IBOutlet weak var secondTextField: UITextField!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(itemsArray.newItemArray.count)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        items.name = secondTextField.text ?? ""
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

}

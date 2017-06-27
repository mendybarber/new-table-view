//
//  Item.swift
//  new table view
//
//  Created by Menachem Barber on 5/21/17.
//  Copyright © 2017 Menachem Barber. All rights reserved.
//

import UIKit

class NewItem: NSObject {
    
    var name: String = "hi"
    
    var done: Bool = false
    
    
     init(name: String) {
        
        self.name = name
        
           }
    convenience init(random: Bool = false) {
        if random {
            let randomName = "i am new"
            self.init(name: randomName)
        } else {
            self.init(name: "g")
        }
    }
         
    
    
    
}

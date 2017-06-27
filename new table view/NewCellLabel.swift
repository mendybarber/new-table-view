//
//  NewCellLabel.swift
//  new table view
//
//  Created by Menachem Barber on 6/25/17.
//  Copyright © 2017 Menachem Barber. All rights reserved.
//

import UIKit

class NewCellLabel: UITableViewCell {
    
    @IBOutlet weak var customCellLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        customCellLabel.adjustsFontForContentSizeCategory = true
        
    }
    
    
 
    
    
    
    
    
}

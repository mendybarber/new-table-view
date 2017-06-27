//
//  NewItemArray.swift
//  new table view
//
//  Created by Menachem Barber on 5/21/17.
//  Copyright © 2017 Menachem Barber. All rights reserved.
//

import UIKit

class NewItemArray {
    
    var newItemArray = [NewItem]()
    
    var secondItemArray = [NewItem]()
    
    func addToArray(category: String)  {
        secondItemArray.removeAll()
        for item in newItemArray {
            switch category {
            case "all":
                secondItemArray.append(item)
            case "notDone":
                if item.done == false {
                    secondItemArray.append(item)
                }
            case "done":
                    if item.done == true {
                        secondItemArray.append(item)
                }
            default:
                break
            }
        }
    }


   
    func removeItem(_ item: NewItem) {
        
        if let index = newItemArray.index(of: item) {
            newItemArray.remove(at: index)
        }
        if let index = secondItemArray.index(of: item) {
            secondItemArray.remove(at: index)
        }

    }
    func moveItem(from fromIndex: Int, to toIndex: Int) {
        if fromIndex == toIndex {
            return
        }
        let movedItem = newItemArray[fromIndex]
        newItemArray
            .remove(at: fromIndex)
        newItemArray.insert(movedItem, at: toIndex)
    }

    
}

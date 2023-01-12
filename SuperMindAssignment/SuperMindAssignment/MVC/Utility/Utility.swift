//
//  Utility.swift
//  SuperMindAssignment
//
//  Created by Abhijit Kotangale on 12/01/23.
//

import Foundation
import UIKit

// Global Veriable
var today = Date()
let dateFormate = DateFormatter()

class Utils {
    
    //MARK: Register Table View Cell
    static func registerCell(table:UITableView, identifier:String) {
        table.register(UINib(nibName: identifier, bundle: nil), forCellReuseIdentifier: identifier)
    }
    
    //MARK: Register Collection View Cell
    static func registerCollectionCell(collection:UICollectionView, identifier:String) {
        collection.register(UINib(nibName: identifier, bundle: nil), forCellWithReuseIdentifier: identifier)
    }
    
}

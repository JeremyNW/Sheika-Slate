//
//  ItemManager.swift
//  Sheika Slate
//
//  Created by Jeremy Warren on 9/16/21.
//

import Foundation
import UIKit

protocol ItemManagerDelegate {
    func didFetchItems(_ items: [Item])
    func didFetchImage(_ image: UIImage)
    func didFail(_ error: Error?)
}

class ItemManager {
    
    var delegate: ItemManagerDelegate?
    var items: [Item] = []
    
    func fetchItems(for category: String) {
        
        guard var url = URL(string: "https://botw-compendium.herokuapp.com/api/v2/category/") else {
            delegate?.didFail(nil)
            return
        }
        
        
        
        
        
    }
    
    func fetchImage(for item: Item) {
    
    }
    
}

//
//  ViewController.swift
//  Sheika Slate
//
//  Created by Jeremy Warren on 9/16/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var itemTableView: UITableView!
    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var categorySegmentedControl: UISegmentedControl!
    let manager = ItemManager()
    var items: [Item] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        itemTableView.delegate = self
        itemTableView.dataSource = self
        manager.delegate = self
        requestItems()
    }
    
    @IBAction func itemCategoryValueChanged(_ sender: UISegmentedControl) {
        requestItems()
    }
    
    @IBAction func descriptionButtonTapped(_ sender: Any) {
        guard let indexPath = itemTableView.indexPathForSelectedRow else { return }
        let item = items[indexPath.row]
        let alert = UIAlertController(title: item.name.capitalized , message: item.description, preferredStyle: .actionSheet)
        let okButton = UIAlertAction(title: "Dismiss", style: .cancel)
        alert.addAction(okButton)
        present(alert, animated: true)
    }
    
    func requestItems() {
        
        let index = categorySegmentedControl.selectedSegmentIndex
        let category = categorySegmentedControl.titleForSegment(at: index) ?? "Equipment"
        manager.fetchItems(for: category)
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "itemCell", for: indexPath)
        cell.textLabel?.text = items[indexPath.row].name.capitalized
    return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = items[indexPath.row]
        manager.fetchImage(for: item)
    }
    
}


extension ViewController:ItemManagerDelegate {
    func didFetchItems(_ items: [Item]) {
        DispatchQueue.main.async {
            self.items = items
            self.itemTableView.reloadData()
        }
    }
    
    func didFetchImage(_ image: UIImage) {
        DispatchQueue.main.async {
            self.itemImageView.image = image
        }
    }
    
    func didFail(_ error: Error?) {
        print(error as Any)
    }
}

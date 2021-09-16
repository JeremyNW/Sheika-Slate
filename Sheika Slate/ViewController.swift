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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        itemTableView.delegate = self
        itemTableView.dataSource = self
    }

    @IBAction func itemCategoryValueChanged(_ sender: UISegmentedControl) {
    }
    
    @IBAction func descriptionButtonTapped(_ sender: Any) {
    }
    
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        fatalError()
    }
    
    
}

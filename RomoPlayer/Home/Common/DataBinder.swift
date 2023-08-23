//
//  DataBinder.swift
//  RomoPlayer
//
//  Created by rouzbeh on 23.08.23.
//

import UIKit

protocol DataBinding: UITableViewDelegate, UITableViewDataSource {
    var numberOfSections: Int? { get }
    var delegate: DataBindingDelegation? { get set }
}
protocol DataBindingDelegation: AnyObject {
    func didSelect(_ data: CellDataConformable)
}

class DataBinder: NSObject, DataBinding {
   weak var delegate: DataBindingDelegation?
    var cellData: [CellDataConformable] = []
    var numberOfSections: Int?
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellData.count
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.didSelect(cellData[indexPath.row])
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
}

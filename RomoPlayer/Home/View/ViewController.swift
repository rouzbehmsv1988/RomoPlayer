//
//  ViewController.swift
//  RomoPlayer
//
//  Created by rouzbeh on 21.08.23.
//

import UIKit
import MusicKit



protocol HomeViewProtocol: AnyObject {
    func displayData(_ data: [SongItem])
}
class HomeViewController: UIViewController, HomeViewProtocol {
    var presenter: HomePresenterProtocol?
    lazy var tableView: UITableView = {
        let table = UITableView()
        table.backgroundColor = .gray
        return table
    }()
    
    lazy var seachTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .white
        textField.textColor = .darkText
        textField.layer.borderColor = UIColor.gray.cgColor
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 10
        textField.placeholder = "search text"
        return textField
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = presenter?.dataBinder
        tableView.dataSource = presenter?.dataBinder
        tableView.register(SongListRow.self, forCellReuseIdentifier: "SongListRow")
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.addConstraintsToEdges(of: view, insets: UIEdgeInsets(top: 120, left: 8, bottom: 8, right: 8))
        view.addSubview(seachTextField)
        seachTextField.translatesAutoresizingMaskIntoConstraints = false
        seachTextField.addLeading(to: view, constant: 8)
        seachTextField.addTrailing(to: view, constant: 8)
        seachTextField.addTop(to: view, constant: 60)
        seachTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        seachTextField.delegate = presenter?.dataBinder
        view.backgroundColor = .white
    }
    
    func displayData(_ data: [SongItem]) {
        presenter?.dataBinder?.cellData = data
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
        
    }
    
}

protocol CellDataConformable {}
protocol CellData {
    associatedtype Item = CellDataConformable
    var data: Item? { get set }
}


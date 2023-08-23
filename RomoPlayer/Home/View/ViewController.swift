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
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.fetchData()
        tableView.delegate = presenter?.dataBinder
        tableView.dataSource = presenter?.dataBinder
        tableView.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height)
        tableView.register(SongListRow.self, forCellReuseIdentifier: "SongListRow")
        view.addSubview(tableView)
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


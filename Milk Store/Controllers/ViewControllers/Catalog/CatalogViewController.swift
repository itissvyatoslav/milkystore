//
//  CatalogViewController.swift
//  Milk Store
//
//  Created by Святослав Шевченко on 07.01.2021.
//

import UIKit

class CatalogViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //MARK:- OUTLETS
    
    @IBOutlet weak var catalogTable: UITableView!
    
    let api = APIWorker.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
    }
    
    private func setView(){
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        catalogTable.tableFooterView = UIView(frame: .zero)
        self.title = "Каталог"
        view.backgroundColor = .white
        //print("Catalog loaded")
        catalogTable.delegate = self
        catalogTable.dataSource = self
        api.getCategoryes { (value, error) in
            if let body = value!["body"] as? [[String: Any]] {
                for number in 0..<body.count {
                    print(body)
                    self.catalog.append(Category(id: body[number]["id"] as? String ?? "unknown category", name: body[number]["name"] as? String ?? "unknown category"))
                }
                self.catalogTable.reloadData()
            }
        }
        
    }
    
    //MARK: - TABLEVIEW DELEGATE
    
    struct Category {
        var id: String
        var name: String
    }
    
    var catalog = [Category]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return catalog.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "catalog")
        cell.textLabel?.text = catalog[indexPath.row].name
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let vc = storyboard?.instantiateViewController(withIdentifier: "ProductsViewController") as! ProductsViewController
        vc.categoryID = catalog[indexPath.row].id
        vc.productName = catalog[indexPath.row].name
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

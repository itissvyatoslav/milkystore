//
//  ProductsViewController.swift
//  Milk Store
//
//  Created by Святослав Шевченко on 07.01.2021.
//

import UIKit

class ProductsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var productsTable: UITableView!
    @IBOutlet weak var productsCollection: UICollectionView!
    
    let api = APIWorker.shared
    
    var categoryID = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setPriceBar()
        setTable()
        setCollection()
        api.getProducts(id: categoryID) { (value, error) in
        }
    }
    
    //MARK:- OUTLETS PRICE BAR
    
    var productName = ""
    var adress = "точка на Борисова, 42"
    
    @IBOutlet weak var adressLabel: UILabel!
    @IBOutlet weak var productTypeLabel: UILabel!
    @IBOutlet weak var styleButton: UIButton!
    
    
    @IBOutlet weak var priceLeftConstraint: NSLayoutConstraint!
    @IBOutlet weak var firstSeparatorConstraint: NSLayoutConstraint!
    @IBOutlet weak var downRightConstraint: NSLayoutConstraint!
    @IBOutlet weak var secondSeparatorConstraint: NSLayoutConstraint!
    
    private func setPriceBar(){
        productTypeLabel.text = productName
        adressLabel.text = adress
        priceLeftConstraint.constant = UIScreen.main.bounds.width / 6 - 55
        firstSeparatorConstraint.constant = UIScreen.main.bounds.width / 3
        downRightConstraint.constant = UIScreen.main.bounds.width / 6 - 9
        secondSeparatorConstraint.constant = UIScreen.main.bounds.width / 3
        styleButton.setImage(UIImage(named: "collection"), for: .normal)
        productsCollection.isHidden = true
    }
    
    var isTableTapped = true
    
    @IBAction func upPricesTapped(_ sender: Any) {
    }
    
    @IBAction func downPricesTapped(_ sender: Any) {
    }
    
    @IBAction func changeStyleTapped(_ sender: Any) {
        isTableTapped = !isTableTapped
        productsCollection.isHidden = !productsCollection.isHidden
        if isTableTapped {
            styleButton.setImage(UIImage(named: "collection"), for: .normal)
        } else {
            styleButton.setImage(UIImage(named: "table"), for: .normal)
        }
    }
    
    @IBAction func backTapped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    //MARK: - TABLE DELEGATE
    
    struct ProductStruct {
        var name: String
        var descr: String
        var price1: Int
        var price2: Int
        var massa: Int
        var images: [UIImage]
    }
    
    var products = [ProductStruct(name: "Клубничный молочный коктейль", descr: "натуральные продукты, без красителей и ГМО\nгоден: 25 суток", price1: 28, price2: 336, massa: 300, images: []), ProductStruct(name: "Шоколадный молочный коктейль", descr: "натуральные продукты, без красителей и ГМО\nгоден: 25 суток", price1: 28, price2: 336, massa: 300, images: [])]
    
    private func setTable(){
        productsTable.delegate = self
        productsTable.dataSource = self
        let productCell = UINib(nibName: "CatalogProductCell",
                                  bundle: nil)
        self.productsTable.register(productCell,
                                forCellReuseIdentifier: "CatalogProductCell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CatalogProductCell") as! CatalogProductCell
        cell.nameLabel.text = products[indexPath.row].name
        cell.descrLabel.text = products[indexPath.row].descr
        cell.priceFirstLabel.text = "\(products[indexPath.row].price1) ₽/шт"
        cell.priceSecondLabel.text = "\(products[indexPath.row].price2) ₽/уп (12шт)"
        cell.massaLabel.text = "\(products[indexPath.row].massa) гр"
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 290
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "ProductViewController") as! ProductViewController
        vc.productType = self.productName
        vc.adress = self.adress
        vc.productID = indexPath.row
        self.navigationController?.pushViewController(vc, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    //MARK:- COLLECTION DELEGATE
    
    private func setCollection(){
        productsCollection.delegate = self
        productsCollection.dataSource = self
        let productItem = UINib(nibName: "CatalogProductItem",
                                  bundle: nil)
        self.productsCollection.register(productItem,
                                      forCellWithReuseIdentifier: "CatalogProductItem")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CatalogProductItem", for: indexPath) as! CatalogProductItem
        cell.nameLabel.text = products[indexPath.row].name
        cell.priceFirstLabel.text = "\(products[indexPath.row].price1) ₽/шт"
        cell.priceSecondLabel.text = "\(products[indexPath.row].price2) ₽/уп (12шт)"
        cell.backgroundColor = .white
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width/2 - 6, height: 330)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "ProductViewController") as! ProductViewController
        vc.productType = self.productName
        vc.adress = self.adress
        vc.productID = indexPath.item
        self.navigationController?.pushViewController(vc, animated: true)
        collectionView.deselectItem(at: indexPath, animated: true)
    }
}

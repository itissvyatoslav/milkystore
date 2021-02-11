//
//  ProductViewController.swift
//  Milk Store
//
//  Created by Святослав Шевченко on 08.01.2021.
//

import UIKit

class ProductViewController: UIViewController {
    
    //MARK:- OUTLETS
    
    @IBOutlet weak var adressLabel: UILabel!
    @IBOutlet weak var productTypeLabel: UILabel!
    
    @IBOutlet weak var sliderCollectionView: UICollectionView!
    @IBOutlet weak var pageView: UIPageControl!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceFirstLabel: UILabel!
    @IBOutlet weak var priceSecondLabel: UILabel!
    @IBOutlet weak var buyButton: UIButton!
    @IBOutlet weak var descrLabel: UILabel!
    
    struct ProductStruct {
        var name: String
        var descr: String
        var price1: Int
        var price2: Int
        var massa: Int
        var images: [UIImage]
    }
    
    var products = [ProductStruct(name: "Клубничный молочный коктейль", descr: "натуральные продукты, без красителей и ГМО\nгоден: 25 суток", price1: 28, price2: 336, massa: 300, images: []), ProductStruct(name: "Шоколадный молочный коктейль", descr: "натуральные продукты, без красителей и ГМО\nгоден: 25 суток", price1: 28, price2: 336, massa: 300, images: [])]
    
    var adress = ""
    var productType = ""
    
    var productID = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
    }
    
    private func setView() {
        buyButton.layer.cornerRadius = 21
        nameLabel.text = products[productID].name
        priceFirstLabel.text = "\(products[productID].price1)₽/шт"
        priceSecondLabel.text = "\(products[productID].price2)₽/уп (12шт)"
        descrLabel.text = "1"
        sliderCollectionView.delegate = self
        sliderCollectionView.dataSource = self
        pageView.numberOfPages = images.count
        pageView.currentPage = 0
        adressLabel.text = adress
        productTypeLabel.text = productType
    }
    
    @IBAction func backTapped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func buyTapped(_ sender: Any) {
        print("buy buy")
    }
    
    
    var images = [ UIImage(named: "Geo"),
                   UIImage(named: "Price") ]
}

extension ProductViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(images.count)
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "sliderCell", for: indexPath)
        if let vc = cell.viewWithTag(111) as? UIImageView {
            vc.image = images[indexPath.item]
        } else if let ab = cell.viewWithTag(222) as? UIPageControl {
            ab.currentPage = indexPath.item
        }
        return cell
    }
    
    
}

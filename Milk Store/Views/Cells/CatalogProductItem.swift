//
//  CatalogProductItem.swift
//  Milk Store
//
//  Created by Святослав Шевченко on 07.01.2021.
//

import UIKit

class CatalogProductItem: UICollectionViewCell {
    
    @IBOutlet weak var imageProduct: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceFirstLabel: UILabel!
    @IBOutlet weak var priceSecondLabel: UILabel!
    @IBOutlet weak var buyButton: UIButton!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        buyButton.layer.cornerRadius = 21
        // Initialization code
    }
    
    @IBAction func buyTapped(_ sender: Any) {
    }
    

}

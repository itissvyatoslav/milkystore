//
//  CatalogProductCell.swift
//  Milk Store
//
//  Created by Святослав Шевченко on 07.01.2021.
//

import UIKit

class CatalogProductCell: UITableViewCell {
    
    @IBOutlet weak var imageProduct: UIImageView!
    @IBOutlet weak var massaLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descrLabel: UILabel!
    @IBOutlet weak var priceFirstLabel: UILabel!
    @IBOutlet weak var priceSecondLabel: UILabel!
    @IBOutlet weak var buyButton: UIButton!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        buyButton.layer.cornerRadius = 21
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func buyProduct(_ sender: Any) {
    }
    
    
}

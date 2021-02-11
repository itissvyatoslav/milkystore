//
//  SettingsViewController.swift
//  Milk Store
//
//  Created by Святослав Шевченко on 26.01.2021.
//

import UIKit

class SettingsViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func backTapped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}

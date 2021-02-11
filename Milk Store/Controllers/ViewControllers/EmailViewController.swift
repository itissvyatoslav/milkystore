//
//  EmailViewController.swift
//  Milk Store
//
//  Created by Святослав Шевченко on 26.01.2021.
//

import UIKit

class EmailViewController: UIViewController {
    
    //MARK:- OUTLETS
    
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var emailView: UIView!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var mainButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
    }
    
    private func setView(){
        emailTF.delegate = self
        mainLabel.text = "Восстановление\nпароля"
        emailTF.text = "Почта"
        emailView.layer.cornerRadius = 10
        mainButton.layer.cornerRadius = 15
    }
    
    @IBAction func mainTapped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func backTapped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
}

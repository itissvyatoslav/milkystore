//
//  PasswordProfileViewController.swift
//  Milk Store
//
//  Created by Святослав Шевченко on 25.01.2021.
//

import UIKit

class PasswordProfileViewController: UIViewController {
    
    //MARK:- OUTLETS
    
    @IBOutlet weak var oldTF: UITextField!
    @IBOutlet weak var newTF: UITextField!
    @IBOutlet weak var new2TF: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        saveButton.layer.cornerRadius = 24.5
        newTF.delegate = self
        new2TF.delegate = self
        new2TF.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: .editingChanged)
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        if newTF.text == new2TF.text {
            new2TF.layer.borderWidth = 0
        } else {
            new2TF.layer.borderWidth = 0.5
            new2TF.layer.borderColor = CGColor(red: 1, green: 0, blue: 0, alpha: 1)
        }
    }
    
    @IBAction func saveTapped(_ sender: Any) {
        if newTF.text == new2TF.text {
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    @IBAction func backTapped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}

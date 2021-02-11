//
//  InfoProfileViewController.swift
//  Milk Store
//
//  Created by Святослав Шевченко on 25.01.2021.
//

import UIKit

class InfoProfileViewController: UIViewController{
    
    //MARK:- OUTLETS
    
    @IBOutlet weak var infoLabel: UILabel!
    
    @IBOutlet weak var loginTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var fioTF: UITextField!
    @IBOutlet weak var birthdayTF: UITextField!
    @IBOutlet weak var phoneTF: UITextField!
    
    var login = ""
    var email = ""
    var fio = ""
    var birthday = ""
    var phone = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginTF.delegate = self
        emailTF.delegate = self
        fioTF.delegate = self
        birthdayTF.delegate = self
        phoneTF.delegate = self
        setView()
    }
    
    private func setView(){
        loginTF.isEnabled = false
        emailTF.isEnabled = false
        fioTF.isEnabled = false
        birthdayTF.isEnabled = false
        phoneTF.isEnabled = false
        loginTF.text = login
        emailTF.text = email
        fioTF.text = fio
        birthdayTF.text = birthday
        phoneTF.text = phone
    }
    
    @IBAction func backTapped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }

}

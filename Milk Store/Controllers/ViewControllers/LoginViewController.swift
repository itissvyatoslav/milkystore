//
//  LoginViewController.swift
//  Milk Store
//
//  Created by Святослав Шевченко on 26.01.2021.
//

import UIKit

class LoginViewController: UIViewController {
    
    //MARK:- OUTLETS
    
    @IBOutlet weak var loginView: UIView!
    @IBOutlet weak var passwordView: UIView!
    
    @IBOutlet weak var loginTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    
    let api = APIWorker.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
    }
    
    private func setView(){
        print(api.token)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        loginView.layer.cornerRadius = 10
        passwordView.layer.cornerRadius = 10
        loginButton.layer.cornerRadius = 15
        loginTF.text = "Логин"
        passwordTF.text = "Пароль"
        loginTF.delegate = self
        passwordTF.delegate = self
        passwordTF.addTarget(self, action: #selector(self.textFieldDidBegin(_:)), for: .editingDidBegin)
    }
    
    @objc func textFieldDidBegin(_ textField: UITextField) {
        textField.isSecureTextEntry = true
    }
    
    
    @IBAction func loginTapped(_ sender: Any) {
        if loginTF.text != "" && passwordTF.text != "" {
            self.loadingAnimation(show: true)
            api.loginUser(login: loginTF.text!, pass: passwordTF.text!) { (error) in
                if error ==  nil {
                    let vc = self.storyboard?.instantiateViewController(identifier: "MainTabBarViewController") as! MainTabBarViewController
                    self.navigationController?.pushViewController(vc, animated: true)
                } else {
                    self.showAlertWithText(error!)
                }
                self.loadingAnimation(show: false)
            }
        }
    }
    
    @IBAction func emailTapped(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(identifier: "EmailViewController") as! EmailViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

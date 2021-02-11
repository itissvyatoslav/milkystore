//
//  CartViewController.swift
//  Milk Store
//
//  Created by Святослав Шевченко on 07.01.2021.
//

import UIKit

class CartViewController: UIViewController {
    
    //MARK:- OUTLETS
    
    @IBOutlet weak var cartTableView: UITableView!
    @IBOutlet weak var timeView: UIView!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var summLabel: UILabel!
    @IBOutlet weak var deleteButton: UIButton!
    @IBOutlet weak var sendButton: UIButton!
    @IBOutlet weak var bigLabel: UILabel!
    @IBOutlet weak var timeSubLabel: UILabel!
    @IBOutlet weak var summSubLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        cartTableView.isHidden = false
        timeView.isHidden = false
        timeLabel.isHidden = false
        summLabel.isHidden = false
        deleteButton.isHidden = false
        sendButton.isHidden = false
        timeSubLabel.isHidden = false
        summLabel.isHidden = false
        bigLabel.isHidden = true
    }
    
    private func setView(){
        self.tabBarItem.title = "Корзина"
        sendButton.layer.cornerRadius = 22.5
        deleteButton.layer.cornerRadius = 22.5
        deleteButton.layer.borderWidth = 1
        deleteButton.layer.borderColor = CGColor(red: 87/255, green: 194/255, blue: 238/255, alpha: 1)
        timeLabel.text = ""
        summLabel.text = ""
        timeView.layer.cornerRadius = 10
    }
    
    
    @IBAction func sendTapped(_ sender: Any) {
        let actionView = UIAlertController(title: nil, message: "Вы уверены, что хотите отправить заказ на подтверждение?", preferredStyle: .alert)
        let yesAction = UIAlertAction(title: "Да", style: .default) { [self] (UIAlertAction) in
            self.bigLabel.text = "Заказ отправлен на\nподтверждение"
            cartTableView.isHidden = true
            timeView.isHidden = true
            timeLabel.isHidden = true
            summLabel.isHidden = true
            deleteButton.isHidden = true
            sendButton.isHidden = true
            timeSubLabel.isHidden = true
            summSubLabel.isHidden = true
            bigLabel.isHidden = false
            self.dismiss(animated: true, completion: nil)
        }
        let noAction = UIAlertAction(title: "Нет", style: .cancel) { (UIAlertAction) in
            self.dismiss(animated: true, completion: nil)
        }
        actionView.addAction(yesAction)
        actionView.addAction(noAction)
        self.present(actionView, animated: true, completion: nil)
    }
    
    @IBAction func deleteTapped(_ sender: Any) {
        let actionView = UIAlertController(title: nil, message: "Вы уверены, что хотите удалить заказ?", preferredStyle: .alert)
        let yesAction = UIAlertAction(title: "Да", style: .default) { [self] (UIAlertAction) in
            self.bigLabel.text = "Пусто"
            cartTableView.isHidden = true
            timeView.isHidden = true
            timeLabel.isHidden = true
            summLabel.isHidden = true
            deleteButton.isHidden = true
            sendButton.isHidden = true
            timeSubLabel.isHidden = true
            summSubLabel.isHidden = true
            bigLabel.isHidden = false
            self.dismiss(animated: true, completion: nil)
        }
        let noAction = UIAlertAction(title: "Нет", style: .cancel) { (UIAlertAction) in
            self.dismiss(animated: true, completion: nil)
        }
        actionView.addAction(yesAction)
        actionView.addAction(noAction)
        self.present(actionView, animated: true, completion: nil)
    }
    
}

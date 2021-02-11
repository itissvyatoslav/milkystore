//
//  ProfileViewController.swift
//  Milk Store
//
//  Created by Святослав Шевченко on 07.01.2021.
//

import UIKit

class ProfileViewController: UIViewController {
    
    //MARK:- OUTLETS
    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var profileTable: UITableView!
    
    let cells = ["Информация", "Смена пароля", "Настройки", "Выход"]
    
    let api = APIWorker.shared
    
    var profileInfo: [String : Any]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
    }
    
    private func setView(){
        nameLabel.text = ""
        self.title = "Профиль"
        self.tabBarItem.title = "Профиль"
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        profileImage.layer.cornerRadius = 40
        getDataFromAPIs()
        setTable()
    }
    
    private func setTable() {
        profileTable.tableFooterView = UIView(frame: .zero)
        profileTable.delegate = self
        profileTable.dataSource = self
    }
    
    var login: String = ""
    var email: String = ""
    var name: String = ""
    var surname: String = ""
    var birth: String = ""
    var phone: String = ""
    
    private func getDataFromAPIs(){
        api.getProfile { (result, error) in
            if error ==  nil {
                self.profileInfo = result
                if let surname = result?["surname"] as? String {
                    self.nameLabel.text = surname
                    self.surname = surname
                }
                if let photo = result?["photo"] as? String {
                    self.getImage(photo)
                }
                if let login = result?["login"] as? String {
                    self.login = login
                }
                if let email = result?["email"] as? String {
                    self.email = email
                }
                if let name = result?["name"] as? String {
                    self.name = name
                }
                if let birth = result?["birthday"] as? String {
                    self.birth = birth
                }
                if let phone = result?["phone"] as? String {
                    self.phone = phone
                }
            } else {
                self.showAlertWithText(error!)
            }
        }
    }
    
    private func getImage(_ photo: String){
        if let url = URL(string: Constants.BASE_URL + photo){
            do {
                let data = try Data(contentsOf: url)
                self.profileImage.image = UIImage(data: data)
            } catch let err {
                print("Error: \(err.localizedDescription)")
            }
        }
    }
}

extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cells.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "profile")
        cell.textLabel?.text = cells[indexPath.row]
        if indexPath.row != cells.count - 1 {
            cell.accessoryType = .disclosureIndicator
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        switch indexPath.row {
        case 0:
            let vc = storyboard?.instantiateViewController(withIdentifier: "InfoProfileViewController") as! InfoProfileViewController
            vc.birthday = birth
            vc.email = email
            vc.login = login
            vc.fio = name + surname
            vc.phone = phone
            self.navigationController?.pushViewController(vc, animated: true)
        case 1:
            let vc = storyboard?.instantiateViewController(withIdentifier: "PasswordProfileViewController") as! PasswordProfileViewController
            self.navigationController?.pushViewController(vc, animated: true)
            break
        case 2:
            let vc = storyboard?.instantiateViewController(withIdentifier: "SettingsViewController") as! SettingsViewController
            self.navigationController?.pushViewController(vc, animated: true)
            break
        default:
            break
        }
    }
}

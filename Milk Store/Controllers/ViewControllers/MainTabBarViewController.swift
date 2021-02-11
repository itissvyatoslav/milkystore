//
//  MainTabBarViewController.swift
//  Milk Store
//
//  Created by Святослав Шевченко on 07.01.2021.
//

import UIKit

class MainTabBarViewController: UITabBarController, UITabBarControllerDelegate {
    
    var catalog: CatalogViewController!
    var cart: CartViewController!
    var messenger: MessengerViewController!
    var profile: ProfileViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(UserDefaults.standard.string(forKey: "token")!)
        self.delegate = self
        setTabBar()
    }
    
    private func setTabBar(){
        self.delegate = self
        catalog = CatalogViewController()
        cart = CartViewController()
        messenger = MessengerViewController()
        profile = ProfileViewController()
        catalog.tabBarItem.title = "Каталог"
        cart.tabBarItem.title = "Корзина"
        messenger.tabBarItem.title = "Диалоги"
        profile.tabBarItem.title = "Профиль"
    }
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        return true;
    }
}

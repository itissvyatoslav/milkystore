//
//  APIWorker.swift
//  Milk Store
//
//  Created by Святослав Шевченко on 27.01.2021.
//

import Foundation
import Alamofire

class APIWorker {
    
    static let shared = APIWorker()
    
    private init(){
        token = UserDefaults.standard.string(forKey: "token") ?? ""
    }
    
    var token = "" {
        didSet {
            UserDefaults.standard.set(token ,forKey: "token")
        }
    }
    
    func apiRequest(url: String, parametrs: [String: String], method: HTTPMethod, completion: @escaping ([String: Any]?, String?) -> ()) {
        AF.request(url, method: method, parameters: parametrs).responseJSON() { responseJSON in
            switch responseJSON.result {
            case .success(let value):
                if let result = value as? [String] {
                    completion(["array": result], nil)
                } else if let result = value as? String  {
                    completion(["token": result], nil)
                } else if let result = value as? [String: Any] {
                    completion(result, nil)
                } else if let result = value as? [[String: Any]] {
                    completion(["body": result], nil)
                } else {
                    print("!!!!!!!!!")
                    completion([:], nil)
                }
            case .failure(let error):
                if error.responseCode == nil {
                    completion(nil, "Нет подключения к интернету")
                } else {
                    completion(nil, "Ошибка сервера")
                }
            }
        }
    }
    
    func apiRequestWithToken(url: String, parametrs: [String: String]?, method: HTTPMethod, completion: @escaping ([String: Any]?, String?) -> ()) {
        AF.request(url, method: method, parameters: parametrs, headers: ["token" : token]).responseJSON() { responseJSON in
            print(responseJSON.request?.url)
            switch responseJSON.result {
            case .success(let value):
                print(value)
                if let result = value as? String  {
                    completion(["token": result], nil)
                } else if let result = value as? [String: Any] {
                    completion(result, nil)
                } else if let result = value as? [[String: Any]] {
                    completion(["body": result], nil)
                } else {
                    print("!!!!!!!!!")
                    completion([:], nil)
                }
            case .failure(let error):
                if error.responseCode == nil {
                    completion(nil, "Нет подключения к интернету")
                } else {
                    completion(nil, "Ошибка сервера")
                }
            }
        }
    }
    
    func loginUser(login: String, pass: String, completion: @escaping (String?) -> ()) {
        let url = Constants.BASE_URL + Constants.URL_LOGIN
        apiRequest(url: url, parametrs: ["login": login, "password": pass], method: .post) {(value, error) in
            if error != nil {
                completion(error)
            } else {
                if let newToken = value?["token"] as? String {
                    
                    self.token = newToken
                    completion(nil)
                } else {
                   completion("Неверный логин или пароль!")
                }
            }
        }
    }
    
    func checkEmail(email: String, completion: @escaping (String?) -> ()) {
        let url = Constants.BASE_URL + Constants.URL_EMAIL
        apiRequest(url: url, parametrs: ["email": email], method: .post) {(value, error) in
            if error != nil {
                completion(error)
            } else {
                if let _ = value?["token"] as? String {
                    completion("Письмо отправлено")
                } else {
                   completion("Пользователь с таким E-mail не существует!")
                }
            }
        }
    }
    
    func getProfile( completion: @escaping ([String: Any]?, String?) -> ()) {
        let url = Constants.BASE_URL + Constants.URL_PROFILE
        apiRequestWithToken(url: url, parametrs: nil, method: .get) {(value, error) in
            if error != nil {
                completion(nil, error)
            } else {
                completion(value, nil)
                if let _ = value?["photo"] as? String {
                    //completion(photo)
                } else {
                    completion(nil, "Пользователь не найден!")
                }
            }
        }
    }
    
    func getCategoryes( completion: @escaping ([String: Any]?, String?) -> ()) {
        let url = Constants.BASE_URL + Constants.URL_TYPES
        apiRequestWithToken(url: url, parametrs: nil, method: .get) {(value, error) in
            if error != nil {
                completion(nil, error)
            } else {
                completion(value, error)
            }
        }
    }
    
    func getProducts(id: String, completion: @escaping ([String: Any]?, String?) -> ()) {
        let url = Constants.BASE_URL + Constants.URL_PRODUCTS_FROM_ID + id
        apiRequestWithToken(url: url, parametrs: nil, method: .get) {(value, error) in
            if error != nil {
                completion(nil, error)
            } else {
                completion(value, error)
            }
        }
    }

}

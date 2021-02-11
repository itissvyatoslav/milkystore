//
//  Constants.swift
//  Milk Store
//
//  Created by Святослав Шевченко on 26.01.2021.
//

import Foundation

class Constants {
    
    public static let BASE_URL : String = "http://194.87.237.8:3000/"
    
    // LOGIN URLS
    
    public static let URL_LOGIN : String = "/api/auth/login"
    public static let URL_EMAIL : String = "/api/auth/email"
    
    // PROFILE URLS
    
    public static let URL_PROFILE : String = "/api/profile"
    public static let URL_PHOTO : String = "/api/profile/avatar"
    public static let URL_POINTS : String = "/api/points/owner"
    public static let URL_ADD_EDIT_POINT : String = "/api/point"
    public static let URL_ADD_EDIT_MANAGER : String = "/api/manager"
    
    // CATALOG URLS
    
    public static let URL_CATALOG : String = "/api/catalog/products"
    public static let URL_TYPES : String = "/api/product/types"
    public static let URL_PRODUCTS_FROM_ID : String = "/api/product/type/:"
    
    // CART
    
    public static let URL_GET_ORDER : String = "/api/order/:"
    public static let URL_POST_ORDER : String = "/api/order"
    
    //CHAT
    
    public static let URL_GET_CHATS : String = "/api/chats"
    public static let URL_GET_CHAT : String = "/api/chat/" // id в конце
    
}

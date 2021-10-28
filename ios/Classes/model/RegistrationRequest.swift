//
//  AuthorizationRequest.swift
//  etisalat
//
//  Created by Pro on 06/08/1943 Saka.
//

import Foundation

struct RegistrationRequest: Codable {
    let registration: Reg

    enum CodingKeys: String, CodingKey {
        case registration = "Registration"
    }
}


// MARK: - Registration
struct Reg: Codable{
    let currency, returnPath, transactionHint : String
    let orderId, store, terminal : String
    let channel, amount, customer : String
    let orderName, userName, password : String

    
    enum CodingKeys : String , CodingKey {
        case currency = "Currency"
        case returnPath = "ReturnPath"
        case transactionHint = "TransactionHint"
        case orderId = "OrderID"
        case store = "Store"
        case terminal = "Terminal"
        case channel = "Channel"
        case amount = "Amount"
        case customer = "Customer"
        case orderName = "OrderName"
        case userName = "UserName"
        case password = "Password"

    }
}


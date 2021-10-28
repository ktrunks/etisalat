//
//  AuthorizationRequest.swift
//  etisalat
//
//  Created by Pro on 06/08/1943 Saka.
//

import Foundation

struct AuthorizationRequest: Codable {
    let authorization: Authorization

    enum CodingKeys: String, CodingKey {
        case authorization = "Authorization"
    }
}

// MARK: - Authorization
struct Authorization: Codable {
    let customer, language, currency, orderName: String
    let orderID, channel, amount, transactionHint: String
    let cardNumber, expiryMonth, expiryYear, verifyCode: String
    let userName, password: String

    enum CodingKeys: String, CodingKey {
        case customer = "Customer"
        case language = "Language"
        case currency = "Currency"
        case orderName = "OrderName"
        case orderID = "OrderID"
        case channel = "Channel"
        case amount = "Amount"
        case transactionHint = "TransactionHint"
        case cardNumber = "CardNumber"
        case expiryMonth = "ExpiryMonth"
        case expiryYear = "ExpiryYear"
        case verifyCode = "VerifyCode"
        case userName = "UserName"
        case password = "Password"
    }
}

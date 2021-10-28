//
//  AuthorizationResponse.swift
//  etisalat
//
//  Created by Pro on 06/08/1943 Saka.
//

import Foundation

struct TransactionResponse: Codable {
    let transaction: Transaction

    enum CodingKeys: String, CodingKey {
        case transaction = "Transaction"
    }
}

// MARK: - Transaction
struct Transaction : Codable {
    let paymentPortal : String?
    let paymentPage : String?
    let responseCode : String?
    let responseClass : String?
    let responseDescription : String?
    let responseClassDescription : String?
    let transactionID : String?
    let balance : Balance?
    let amount : Amount?
    let fees : Fees?
    let payer : String?
    let uniqueID : String?

    enum CodingKeys: String, CodingKey {

        case paymentPortal = "PaymentPortal"
        case paymentPage = "PaymentPage"
        case responseCode = "ResponseCode"
        case responseClass = "ResponseClass"
        case responseDescription = "ResponseDescription"
        case responseClassDescription = "ResponseClassDescription"
        case transactionID = "TransactionID"
        case balance = "Balance"
        case amount = "Amount"
        case fees = "Fees"
        case payer = "Payer"
        case uniqueID = "UniqueID"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        paymentPortal = try values.decodeIfPresent(String.self, forKey: .paymentPortal)
        paymentPage = try values.decodeIfPresent(String.self, forKey: .paymentPage)
        responseCode = try values.decodeIfPresent(String.self, forKey: .responseCode)
        responseClass = try values.decodeIfPresent(String.self, forKey: .responseClass)
        responseDescription = try values.decodeIfPresent(String.self, forKey: .responseDescription)
        responseClassDescription = try values.decodeIfPresent(String.self, forKey: .responseClassDescription)
        transactionID = try values.decodeIfPresent(String.self, forKey: .transactionID)
        balance = try values.decodeIfPresent(Balance.self, forKey: .balance)
        amount = try values.decodeIfPresent(Amount.self, forKey: .amount)
        fees = try values.decodeIfPresent(Fees.self, forKey: .fees)
        payer = try values.decodeIfPresent(String.self, forKey: .payer)
        uniqueID = try values.decodeIfPresent(String.self, forKey: .uniqueID)
    }

}

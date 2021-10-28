//
//  FinalizationResponse.swift
//  etisalat
//
//  Created by Pro on 06/08/1943 Saka.
//

import Foundation


struct FinalizationResponse : Codable {
    let transaction : FinalTransaction?

    enum CodingKeys: String, CodingKey {

        case transaction = "Transaction"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        transaction = try values.decodeIfPresent(FinalTransaction.self, forKey: .transaction)
    }

}

struct FinalTransaction : Codable {
    let responseCode : String?
    let responseClass : String?
    let responseDescription : String?
    let responseClassDescription : String?
    let language : String?
    let approvalCode : String?
    let account : String?
    let balance : Balance?
    let orderID : String?
    let amount : Amount?
    let fees : Fees?
    let cardNumber : String?
    let payer : Payer?
    let cardToken : String?
    let cardBrand : String?
    let uniqueID : String?

    enum CodingKeys: String, CodingKey {

        case responseCode = "ResponseCode"
        case responseClass = "ResponseClass"
        case responseDescription = "ResponseDescription"
        case responseClassDescription = "ResponseClassDescription"
        case language = "Language"
        case approvalCode = "ApprovalCode"
        case account = "Account"
        case balance = "Balance"
        case orderID = "OrderID"
        case amount = "Amount"
        case fees = "Fees"
        case cardNumber = "CardNumber"
        case payer = "Payer"
        case cardToken = "CardToken"
        case cardBrand = "CardBrand"
        case uniqueID = "UniqueID"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        responseCode = try values.decodeIfPresent(String.self, forKey: .responseCode)
        responseClass = try values.decodeIfPresent(String.self, forKey: .responseClass)
        responseDescription = try values.decodeIfPresent(String.self, forKey: .responseDescription)
        responseClassDescription = try values.decodeIfPresent(String.self, forKey: .responseClassDescription)
        language = try values.decodeIfPresent(String.self, forKey: .language)
        approvalCode = try values.decodeIfPresent(String.self, forKey: .approvalCode)
        account = try values.decodeIfPresent(String.self, forKey: .account)
        balance = try values.decodeIfPresent(Balance.self, forKey: .balance)
        orderID = try values.decodeIfPresent(String.self, forKey: .orderID)
        amount = try values.decodeIfPresent(Amount.self, forKey: .amount)
        fees = try values.decodeIfPresent(Fees.self, forKey: .fees)
        cardNumber = try values.decodeIfPresent(String.self, forKey: .cardNumber)
        payer = try values.decodeIfPresent(Payer.self, forKey: .payer)
        cardToken = try values.decodeIfPresent(String.self, forKey: .cardToken)
        cardBrand = try values.decodeIfPresent(String.self, forKey: .cardBrand)
        uniqueID = try values.decodeIfPresent(String.self, forKey: .uniqueID)
    }

}

//
//  FinalizationRequest.swift
//  etisalat
//
//  Created by Pro on 06/08/1943 Saka.
//

import Foundation

struct FinalizationRequest: Codable {
    let finalization: Finalization

    enum CodingKeys: String, CodingKey {
        case finalization = "Authorization"
    }
}

// MARK: - Authorization
struct Finalization: Codable {
    let transactionID, customer : String
    let  userName, password : String

    enum CodingKeys: String, CodingKey {
        case transactionID = "TransactionID"
        case customer = "Customer"
        case userName = "UserName"
        case password = "Password"
    }
}

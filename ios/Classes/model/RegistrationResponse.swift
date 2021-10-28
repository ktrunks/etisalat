//
//  RegistrationResponse.swift
//  etisalat
//
//  Created by Pro on 06/08/1943 Saka.
//

import Foundation
struct RegistrationResponse : Codable {
    let transaction : Transaction?

    enum CodingKeys: String, CodingKey {

        case transaction = "Transaction"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        transaction = try values.decodeIfPresent(Transaction.self, forKey: .transaction)
    }

}

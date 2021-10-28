//
//  Balance.swift
//  etisalat
//
//  Created by Pro on 06/08/1943 Saka.
//

import Foundation

struct Balance : Codable {
    let value : String?

    enum CodingKeys: String, CodingKey {

        case value = "Value"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        value = try values.decodeIfPresent(String.self, forKey: .value)
    }

}

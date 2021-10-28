//
//  Payer.swift
//  etisalat
//
//  Created by Pro on 06/08/1943 Saka.
//

import Foundation
struct Payer : Codable {
    let information : String?

    enum CodingKeys: String, CodingKey {

        case information = "Information"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        information = try values.decodeIfPresent(String.self, forKey: .information)
    }

}

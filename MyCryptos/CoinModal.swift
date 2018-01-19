//
//  CoinModal.swift
//  MyCryptos
//
//  Created by Balaji on 09/01/18.
//  Copyright © 2018 Synchronoss. All rights reserved.
//

import Foundation

struct Coin: Codable {
    let id: String
    let symbol: String
    let name: String
    let rank: String
    let price_usd: String
    let price_btc: String
    let percent_change_24h: String
//    var market_cap_usd: String
//    var available_supply: String
//    var total_supply: String
//    "percent_change_1h": "0.04",
//    "percent_change_24h": "-0.3",
//    "percent_change_7d": "-0.57",
//    "last_updated": "1472762067"
    enum CodingKeys : String, CodingKey {
        case id
        case symbol
        case name
        case rank
        case price_usd
        case price_btc
        case percent_change_24h
    }
}

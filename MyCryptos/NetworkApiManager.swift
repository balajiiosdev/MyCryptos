//
//  NetworkApiManager.swift
//  MyCryptos
//
//  Created by Balaji on 09/01/18.
//  Copyright © 2018 Synchronoss. All rights reserved.
//

import Foundation

class NetworkApi {
    func getCoins(completion: @escaping (([Coin]?) -> Void)) {
        guard let url = URL(string: "https://api.coinmarketcap.com/v1/ticker/") else {
            return
        }
        let session = URLSession(configuration: URLSessionConfiguration.default)
        session.dataTask(with: url) {  data, response, error in
            self.parse(data: data, response: response, error: error, completion: completion)
        }.resume()
    }

    func parse(data: Data?, response: URLResponse?, error: Error?, completion: (([Coin]?) -> Void)) {
        guard let jsonData = data, error == nil else {
            return
        }
        let decoder = JSONDecoder()
        guard let coins = try? decoder.decode([Coin].self, from: jsonData) else {
            return
        }
        let sortedCoins = coins.sorted { coin1, coin2 -> Bool in
            guard let coin1Rank = Int(coin1.rank), let coin2Rank = Int(coin2.rank) else {
                return false
            }
            return coin1Rank < coin2Rank
        }
        let lessThan1DollarCoins = sortedCoins.filter { coin -> Bool in
            if let coinPriceUSD = Double(coin.price_usd), coinPriceUSD < Double(1.0) {
                return true
            } else {
                return false
            }
        }

        let topGainers = lessThan1DollarCoins.sorted { coin1, coin2 -> Bool in
            guard let coin1PercentChange = Double(coin1.percent_change_24h),
                let coin2PercentChange = Double(coin2.percent_change_24h) else {
                return false
            }
            return coin1PercentChange > coin2PercentChange
        }
        print(topGainers.description)
        completion(topGainers)
    }
}


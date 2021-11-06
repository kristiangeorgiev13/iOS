//
//  SingleAddressModel.swift
//  The Bitcoin explorer
//
//  Created by Kristian Georgiev on 6.11.21.
//

import Foundation

struct SingleAddressModel: Codable {
    var hash160: String?
    var address: String?
    var total_received: Int?
    var total_sent: Int?
    var final_balance: Int?
    var txs: [String]?
}
//Single Address
//https://blockchain.info/rawaddr/$bitcoin_address
//Address can be base58 or hash160
//Optional limit parameter to show n transactions e.g. &limit=50 (Default: 50, Max: 50)
//Optional offset parameter to skip the first n transactions e.g. &offset=100 (Page 2 for limit 50)

//hash160": "660d4ef3a743e3e696ad990364e555c271ad504b",
//  "address": "1AJbsFZ64EpEfS5UAjAfcUG8pH8Jn3rn1F",
//  "n_tx": 17,
//  "n_unredeemed": 2,
//  "total_received": 1031350000,
//  "total_sent": 931250000,
//  "final_balance": 100100000,
//  "txs": [
//    "--Array of Transactions--"
//  ]

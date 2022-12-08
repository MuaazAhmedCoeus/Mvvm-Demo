//
//  CurrencyModel.swift
//  DemoMVVM
//
//  Created by Muaaz on 06/12/2022.
//

import Foundation

class CurrencyModel: Decodable {
    var rates = [CurrencyDetails]()
    
    init(data: [CurrencyDetails]) {
        self.rates = data
    }
}

class CurrencyDetails: Decodable {
    var code: String?
    var name: String?
    var currency_name: String?
    var currency_code: String?
    var rate: Double?

    init(code: String, name: String,currency_name: String?, currency_code: String?, rate: Double? ) {
        self.code = code
        self.name = name
        self.currency_name = currency_name
        self.currency_code = currency_code
        self.rate = rate
    }
}

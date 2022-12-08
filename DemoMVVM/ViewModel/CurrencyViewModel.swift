//
//  CurrencyViewModel.swift
//  DemoMVVM
//
//  Created by Muaaz on 06/12/2022.
//

import UIKit

class CurrencyViewModel {

    var currencyDetails : [CurrencyDetails]? = nil

    func getCurrencyDetail(urlStr: String ,completion: @escaping() -> ()) {
        Service.sharedInstance.serverCall(urlString: urlStr) { dataResponse in
            guard let currency : CurrencyModel = Service.sharedInstance.decodeData(from: dataResponse) else {return}
            self.currencyDetails = currency.rates
            completion()
        }
    }
}




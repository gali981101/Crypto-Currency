//
//  CryptoViewModel.swift
//  CryptoCurrency
//
//  Created by Terry Jason on 2023/8/30.
//

import Foundation

// MARK: Struct

struct CryptoListViewModel {
    let cryptoCurrencyList: [CryptoCurrency]
}

struct CryptoViewModel {
    let cryptoCurrency: CryptoCurrency
}


// MARK: Extension

extension CryptoListViewModel {
    
    func numberOfRowInSection() -> Int {
        return self.cryptoCurrencyList.count
    }
    
    func cryptoAtIndex(_ index: Int) -> CryptoViewModel {
        return CryptoViewModel(cryptoCurrency: self.cryptoCurrencyList[index])
    }
    
}

extension CryptoViewModel {
    
    var name: String {
        return self.cryptoCurrency.currency
    }
    
    var price: String {
        return self.cryptoCurrency.price
    }
    
}

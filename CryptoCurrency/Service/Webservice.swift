//
//  Webservice.swift
//  CryptoCurrency
//
//  Created by Terry Jason on 2023/8/30.
//

import Foundation

class Webservice {
    
    func downloadCurrencies(url: URL, completion: @escaping ([CryptoCurrency]?)->()) {
        
        URLSession.shared.dataTask(with: url) { [self] data, response, error in
            resultHandle(data: data, res: response, error: error, completion: completion)
        }.resume()
        
    }
    
}


extension Webservice {
    
    private func resultHandle(data: Data?, res: URLResponse?, error: Error?, completion: @escaping ([CryptoCurrency]?)->()) {
        if let error = error {
            errorHandle(error: error, completion: completion)
        } else if let data = data {
            dataHandle(data: data, completion: completion)
        }
    }
    
    private func errorHandle(error: Error, completion: @escaping ([CryptoCurrency]?)->()) {
        print(error.localizedDescription)
        completion(nil)
    }
    
    private func dataHandle(data: Data, completion: @escaping ([CryptoCurrency]?)->()) {
        let cryptoList = try? JSONDecoder().decode([CryptoCurrency].self, from: data)
        
        print(cryptoList ?? "什麼都沒有")
        
        if let cryptoList = cryptoList {
            completion(cryptoList)
        }
    }
    
}


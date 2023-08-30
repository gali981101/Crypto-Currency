//
//  ViewController.swift
//  CryptoCurrency
//
//  Created by Terry Jason on 2023/8/30.
//

import UIKit

class ViewController: UIViewController {

    private var cryptoListViewModel: CryptoListViewModel!
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpAll()
    }

}


// MARK: Setting

extension ViewController {
    
    private func setUpAll() {
        tableViewSet()
        getData()
    }
    
}

// MARK: TableView Delegate

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    private func tableViewSet() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.cryptoListViewModel == nil ?  0 : self.cryptoListViewModel.numberOfRowInSection()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CryptoCell", for: indexPath) as! CryptoTableViewCell
        
        let cryptoViewModel = self.cryptoListViewModel.cryptoAtIndex(indexPath.row)
        
        cell.currencyText.text = cryptoViewModel.name
        cell.priceText.text = cryptoViewModel.price
        
        return cell
    }
    
}


// MARK: Networking

extension ViewController {
    
    private func getData() {
        let url = "https://raw.githubusercontent.com/atilsamancioglu/K21-JSONDataSet/master/crypto.json"
        
        Webservice().downloadCurrencies(url: URL(string: url)!) { [self] currencies in
            currenciesCheck(currencies: currencies)
        }
    }
    
    private func currenciesCheck(currencies: [CryptoCurrency]?) {
        if let currencies = currencies {
            self.cryptoListViewModel = CryptoListViewModel(cryptoCurrencyList: currencies)
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
}
















































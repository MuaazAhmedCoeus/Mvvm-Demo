//
//  CurrencyDetailsVC.swift
//  DemoMVVM
//
//  Created by Muaaz on 06/12/2022.
//

import UIKit

class CurrencyDetailsVC: UIViewController {

    @IBOutlet weak var currencyTV: UITableView!
    
    let priceVM = CurrencyViewModel()
    let activityIndicator = UIActivityIndicatorView()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        setInitials()
        fetchCurrencyRates()
    }
    
    func setInitials() {
        self.title = "Currency Rates"
        let nib = UINib(nibName: CurrencyTVCell.id, bundle: nil)
        currencyTV.register(nib, forCellReuseIdentifier: CurrencyTVCell.id)
        self.currencyTV.delegate = self
        self.currencyTV.dataSource = self
        activityIndicator.frame = self.view.frame
        self.view.addSubview(activityIndicator)
        activityIndicator.hidesWhenStopped = true
        activityIndicator.isHidden = true
    }
    
    func fetchCurrencyRates() {
        activityIndicator.isHidden = false
        priceVM.getCurrencyDetail(urlStr: Constants.urlString) { [weak self] in
            guard let self = self else {return}
            DispatchQueue.main.async {
                self.activityIndicator.isHidden = true
                self.currencyTV.reloadData()
            }
        }
    }

}

extension CurrencyDetailsVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return priceVM.currencyDetails?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CurrencyTVCell", for: indexPath) as! CurrencyTVCell
        
        let info = priceVM.currencyDetails?[indexPath.row]
        cell.setCellData(info: info)
        
        return cell
        
    }
    
}

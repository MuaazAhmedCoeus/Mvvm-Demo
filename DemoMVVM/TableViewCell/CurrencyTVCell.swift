//
//  CurrencyTVCell.swift
//  DemoMVVM
//
//  Created by Muaaz on 07/12/2022.
//

import UIKit

class CurrencyTVCell: UITableViewCell {

    @IBOutlet weak var contryNameLbl: UILabel!
    @IBOutlet weak var contryCodeLbl: UILabel!
    @IBOutlet weak var currencyNameLbl: UILabel!
    @IBOutlet weak var currencyCodeLbl: UILabel!
    @IBOutlet weak var currencyRateLbl: UILabel!
    @IBOutlet weak var containerView: UIView!
        
    override func awakeFromNib() {
        super.awakeFromNib()
        self.containerView.addShadow()
    }
    
    func setCellData(info: CurrencyDetails?) {
        self.contryNameLbl.text = info?.name
        self.contryCodeLbl.text = info?.currency_code
        self.currencyNameLbl.text = info?.currency_name
        self.currencyCodeLbl.text = info?.currency_code
        self.currencyRateLbl.text = String(format: "%.2f", info?.rate ?? 00)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}

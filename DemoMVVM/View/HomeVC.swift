//
//  HomeVC.swift
//  DemoMVVM
//
//  Created by Muaaz on 06/12/2022.
//
import Foundation
import UIKit

class HomeVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("This is a VC")
        // Do any additional setup after loading the view.
    }

    @IBAction func nextAction(_ sender: Any) {
        self.pushVC(storyboard: .Main, vc: CurrencyDetailsVC.id)
    }
    
}


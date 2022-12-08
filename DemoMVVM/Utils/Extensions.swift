//
//  Extensions.swift
//  DemoMVVM
//
//  Created by Muaaz on 06/12/2022.
//

import Foundation
import UIKit

extension UIViewController {
    
    func getVC(storyboard: storyboards, vc: String) -> UIViewController {
        print("Storyboard: ",storyboard.rawValue, "VC: ", vc)
        let storyBoard: UIStoryboard = UIStoryboard(name: storyboard.rawValue, bundle: nil)
        let controller = storyBoard.instantiateViewController(withIdentifier: vc)
        return controller
    }
    
    func pushVC(vc: UIViewController) {
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func openVC(storyboard: storyboards, vc: String) {
        print("Storyboard: ",storyboard.rawValue, "VC: ", vc)
        let storyBoard: UIStoryboard = UIStoryboard(name: storyboard.rawValue, bundle: nil)
        let controller = storyBoard.instantiateViewController(withIdentifier: vc)
        if self.navigationController != nil {
            self.navigationController?.pushViewController(controller, animated: true)
        } else {
            self.present(controller, animated: true)
        }
    }

    func pushVC(storyboard: storyboards, vc: String) {
        print("Storyboard: ",storyboard.rawValue, "VC: ", vc)
        let storyBoard: UIStoryboard = UIStoryboard(name: storyboard.rawValue, bundle: nil)
        let controller = storyBoard.instantiateViewController(withIdentifier: vc)
        self.navigationController?.pushViewController(controller, animated: true)
    }
}

extension NSObject {
    class var id: String {
        return String(describing: self)
    }
}

extension UIView {
    func addShadow() {
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOffset = CGSize(width: 1, height: 1)
        self.layer.shadowOpacity = 1
        self.layer.cornerRadius = 4
        
    }
}

extension String {
}

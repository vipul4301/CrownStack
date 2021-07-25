//
//  Helper.swift
//  CrownStack
//
//  Created by Vipul Kumar on 24/07/21.
//

import Foundation
import UIKit

func print_debug <T> (object:T) {
    print(object)
}


extension UIViewController {
    func showAlert(withMessage : String) {
        DispatchQueue.main.async {
            
            let alert = UIAlertController.init(title: "Alert", message: withMessage, preferredStyle: .alert)
            let action = UIAlertAction.init(title: "Ok", style: .default) { (UIAlertAction) in
            }
            alert.addAction(action)
            self.present(alert, animated: true, completion: nil)
        }
    }
}


///Alert messages and title
struct Messages {
    static let title = "Alert"
    static let networkError = "Network Error"
    static let menuNotFount = "Content list is not found"
}

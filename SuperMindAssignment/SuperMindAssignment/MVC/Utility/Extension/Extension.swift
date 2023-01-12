//
//  Extension.swift
//  SuperMindAssignment
//
//  Created by Abhijit Kotangale on 11/01/23.
//

import Foundation
import UIKit

extension UIViewController {
    
    func singleAlert(title: String?, message: String?, button: String?){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: button, style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func alertVC(title: String?, message: String?, actionTitles:[String?], actions:[((UIAlertAction) -> Void)?]) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
           for (index, title) in actionTitles.enumerated() {
               let action = UIAlertAction(title: title, style: .default, handler: actions[index])
               alert.addAction(action)
           }
        self.present(alert, animated: true, completion: nil)
    }
    
    //MARK: Keyboard dissmiss
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
} //End Main Class

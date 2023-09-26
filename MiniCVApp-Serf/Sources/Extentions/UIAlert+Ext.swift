//
//  UIAlert+Ext.swift
//  MiniCVApp-Serf
//
//  Created by Dmitry Dorodniy on 01.09.2023.
//

import UIKit

extension UIViewController {
    /// Present UIAlertController with "OK" button
    func showAlert(withTitle title: String, message: String, action: @escaping (String) -> ()) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addTextField { textField in
            textField.placeholder = "Введите название"
        }
        
        let cancelAction = UIAlertAction(title: "Oтмена", style: .cancel)
        let addAction = UIAlertAction(title: "Добавить", style: .default) { _ in
            if let textField = alertController.textFields?.first, let text = textField.text, !text.isEmpty {
                action(text)
            }
        }
        
        alertController.addAction(cancelAction)
        alertController.addAction(addAction)
        
        self.present(alertController, animated: true)
    }
}
    

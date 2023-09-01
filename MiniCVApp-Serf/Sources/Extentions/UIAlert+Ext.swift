//
//  UIAlert+Ext.swift
//  MiniCVApp-Serf
//
//  Created by Dmitry Dorodniy on 01.09.2023.
//

import UIKit

extension UIViewController {
    /// Present UIAlertController with "OK" button
    func showAlert(withTitle title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addTextField { textField in
            textField.placeholder = "Введите название"
        }
        alertController.addAction(UIAlertAction(title: "Oтмена", style: .cancel))
        alertController.addAction(UIAlertAction(title: "Добавить", style: .default) { _ in
            if let textField = alertController.textFields?.first, let text = textField.text {
                print("Добавлено: \(text)")
            }
        })
        self.present(alertController, animated: true)
    }
}
    

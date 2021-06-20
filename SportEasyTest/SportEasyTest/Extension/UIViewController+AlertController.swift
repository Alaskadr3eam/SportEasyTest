//
//  UIViewController+AlertController.swift
//  SportEasyTest
//
//  Created by Clément Martin on 20/06/2021.
//

import UIKit

extension UIViewController {
    // MARK: - Alerts popup
    func alertUser(title:String, message:String, completionOnAgree: (() -> Swift.Void)? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("retry", comment: ""), style: .default, handler: { action in
            if completionOnAgree != nil {
                completionOnAgree!()
            }
        }))
        alert.addAction(UIAlertAction(title: NSLocalizedString("ok", comment: ""), style: .cancel))

        self.present(alert, animated: true, completion: nil)
    }
}

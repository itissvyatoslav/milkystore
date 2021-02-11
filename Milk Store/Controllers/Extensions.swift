//
//  Extensions.swift
//  Milk Store
//
//  Created by Святослав Шевченко on 26.01.2021.
//

import UIKit
import NVActivityIndicatorView

// KEYBOARD DISMISS

extension UIViewController: UITextFieldDelegate {
    
    func showAlertWithText(_ text: String) {
        let alertWindow = UIAlertController(title: nil, message: text, preferredStyle: .alert)
        let closeAction = UIAlertAction(title: "Закрыть", style: .cancel) { (UIAlertAction) in
            self.dismiss(animated: true, completion: nil)
        }
        alertWindow.addAction(closeAction)
        self.present(alertWindow, animated: true, completion: nil)
    }
    
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:)))
        view.addGestureRecognizer(tap)
        
        self.view.endEditing(true)
        return false
    }
}

// LOADING ANIMATION

extension UIViewController {
    func loadingAnimation(show: Bool) {
        if show {
            if self.view.subviews.first(where: {$0.tag == 2}) == nil {
                let loadingView = NVActivityIndicatorView(frame: CGRect(origin: .zero, size: CGSize(width: 30, height: 30)), type: .lineSpinFadeLoader, color: UIColor(red: 87/255, green: 194/255, blue: 238/255, alpha: 1), padding: nil)
                loadingView.center = self.view.center
                loadingView.tag = 2
                self.view.addSubview(loadingView)
                loadingView.alpha = 0.0
                loadingView.startAnimating()
                UIView.animate(withDuration: 0.3) {
                    loadingView.alpha = 1.0
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                    loadingView.center = self.view.center
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.02) {
                    loadingView.center = self.view.center
                }
            }
        } else {
            if let loadingView = self.view.subviews.first(where: {$0.tag == 2}) as? NVActivityIndicatorView {
                UIView.animate(withDuration: 0.3) {
                    loadingView.alpha = 0.0
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                    loadingView.removeFromSuperview()
                }
            }
        }
    }
}

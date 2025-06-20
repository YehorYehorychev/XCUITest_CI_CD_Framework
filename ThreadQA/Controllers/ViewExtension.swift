import Foundation
import UIKit


extension UIViewController
{
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func showAlert(title: String, message: String, okButton: String = "ok"){
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let actionDone = UIAlertAction(title: okButton, style: .default, handler: nil)
        alert.addAction(actionDone)
        
        self.present(alert, animated: true, completion: nil)
    }
    
    func showIndicator(message: String){
        let backgroundView = UIView(frame: self.view.frame)
        backgroundView.alpha = 0.4
        backgroundView.backgroundColor = UIColor.black
        self.view.addSubview(backgroundView)
        
        let baseView = UIView(frame: CGRect(x: 20, y: self.view.frame.height/2-50, width: self.view.frame.width-40, height: 100))
        baseView.layer.borderWidth = 1.0
        baseView.layer.borderColor = UIColor.red.cgColor
        baseView.layer.cornerRadius = 12.0
        self.view.addSubview(baseView)
        
        let indicator = UIActivityIndicatorView(style: .large)
        indicator.startAnimating()
        indicator.frame = CGRect(x: 20, y: baseView.frame.height/2-15, width: 30, height: 30)
        
        baseView.addSubview(indicator)
        
        let msg = UILabel(frame: CGRect(x: 50, y: 50, width: baseView.frame.width-60, height: 80))
        msg.text = message
        
        
        msg.textAlignment = .center
        baseView.addSubview(msg)
        
        backgroundView.tag = 1001
        baseView.tag = 1002
        
    }
    
    func hideIndicator() {
        self.view.viewWithTag(1001)?.removeFromSuperview()
        self.view.viewWithTag(1002)?.removeFromSuperview()
    }
}

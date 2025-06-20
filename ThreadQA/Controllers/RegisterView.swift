import UIKit

class RegisterViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var firstName: UITextField!
    
    @IBOutlet weak var lastName: UITextField!
    
    @IBOutlet weak var email: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    @IBOutlet weak var clickButton: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        self.password.delegate = self
        self.email.delegate = self
        self.lastName.delegate = self
        self.firstName.delegate = self
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
           self.view.endEditing(true)
           return false
    }
    
    @IBAction func register(_ sender: UIButton) {
        
        let providedEmailAddress = email.text
        
        let isEmailAddressValid = isValidEmailAddress(emailAddressString: providedEmailAddress!)
        
        if isEmailAddressValid
        {
            print("valid")
        } else {
            print("not valid")
        }
        
        
        if (!password.text!.isEmpty && !lastName.text!.isEmpty && !firstName.text!.isEmpty && clickButton.isEnabled == true && isValidEmailAddress(emailAddressString: providedEmailAddress!)){
            let alertController = UIAlertController(title: "Welcome!", message: "You are now registered", preferredStyle: .alert)
            let OKAction = UIAlertAction(title: "OK", style: .default) { (action:UIAlertAction!) in
                print("Ok button tapped");
            }
            alertController.addAction(OKAction)
            self.present(alertController, animated: true, completion:nil)
            
        } else {
            let alert = UIAlertController(title: "Alert!", message: "You cannot register!", preferredStyle: .alert)
            
            let cancelAction = UIAlertAction(title: "cancel", style: .destructive, handler: nil)
            alert.addAction(cancelAction)
            self.present(alert, animated: true, completion: nil)
        }
        
    }
    
    @IBAction func onOff(_ sender: UISwitch) {
        if (sender.isOn == true){
            clickButton.isEnabled = true
        } else {
            clickButton.isEnabled = false
        }
        
    }
    
    func isValidEmailAddress(emailAddressString: String) -> Bool {
        var returnValue = true
        let emailRegEx = "[A-Z0-9a-z.-_]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,3}"
        
        do {
            let regex = try NSRegularExpression(pattern: emailRegEx)
            let nsString = emailAddressString as NSString
            let results = regex.matches(in: emailAddressString, range: NSRange(location: 0, length: nsString.length))
            if results.count == 0
            {
                returnValue = false
            }
            
        } catch let error as NSError {
            print("invalid regex: \(error.localizedDescription)")
            returnValue = false
        }
        return  returnValue
    }
    
    @IBAction func goBack(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}

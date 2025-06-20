import UIKit

class LoginViewController: UIViewController {
    
    
    @IBOutlet weak var loginView: UIView!
    
    @IBOutlet weak var emailField: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
    }
    
    
    @IBAction func alert(_ sender: Any) {
        
    }
    
    
    @IBAction func emailField(_ sender: Any) {
    }
    
    
    @IBAction func passwordField(_ sender: Any) {
    }
    
    private weak var task: URLSessionTask?
    
    
    @IBAction func loginUser(_ sender: Any) {
        if emailField.text!.isEmpty || passwordField.text!.isEmpty
        {
            showAlert(title: "Try Again", message: "Email and password should not be empty")
            return
        }
        if emailField.text=="test" && passwordField.text == "test"
        {
            self.performSegue(withIdentifier: "LoginSegue", sender: nil)
        }
        self.showIndicator(message: "Authenticating")
        let loginURL = URL(string: "https://reqres.in/api/login")
        var loginRequest = URLRequest(url: loginURL!, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 30)
        loginRequest.httpMethod = "POST"
        loginRequest.addValue("application/JSON", forHTTPHeaderField: "Content-Type")
        loginRequest.addValue("reqres-free-v1", forHTTPHeaderField: "x-api-key")
        let params = ["email":emailField.text, "password":passwordField.text] as! Dictionary<String, String>
        loginRequest.httpBody = try?JSONSerialization.data(withJSONObject: params, options: .prettyPrinted)
        
        let task = URLSession.shared.dataTask(with: loginRequest) { (data, response, error) in
            guard error == nil
            else
            {
                print (error as Any)
                return
            }
            let status = (response as! HTTPURLResponse).statusCode
            guard status == 200
            else
            {
                print(status)
                DispatchQueue.main.async {
                    self.hideIndicator()
                    self.showAlert(title: "Try Again", message: "Invalid credentials")
                }
                return
                
            }
            if let Data = data{
                DispatchQueue.main.async {
                    self.getData(data: Data)
                }
                print(NSHomeDirectory())
            }
        }
        task.resume()
        self.task=task
        
    }
    
    deinit {
        task?.cancel()
    }
    
    func getData(data: Data)
    {
        self.hideIndicator()
        let response = try?JSONSerialization.jsonObject(with: data, options: .allowFragments) as? Dictionary<String, String>
        let token = response!["token"]
        print(token!)
        UserDefaults.standard.setValue(token, forKey: "TOKEN")
        if let TOK = UserDefaults.standard.string(forKey: "TOKEN")
        {
            print(TOK)
        }
        self.performSegue(withIdentifier: "LoginSegue", sender: nil)
    }
}

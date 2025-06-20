import UIKit

protocol AddUserProtocolDelegate: AnyObject {
    func CancelAddingUser(_ controller:
                          AddNewUserViewController)
    
    func AddNewUser(_ controller: AddNewUserViewController, user: User)
    
}

class AddNewUserViewController: UIViewController {
    
    
    @IBOutlet weak var firstName: UITextField!
    
    @IBOutlet weak var lastName: UITextField!
    
    @IBOutlet weak var email: UITextField!
    
    weak var addUserDelegate: AddUserProtocolDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func cancelAddUser(_ sender: Any) {
        addUserDelegate?.CancelAddingUser(self)
    }
    @IBAction func saveUser(_ sender: Any) {
        let ricardo = "https://sun9-4.userapi.com/impf/c845520/v845520202/157733/UhKurHnVKbo.jpg?size=1280x720&quality=96&sign=cf130366ea3300715112346c970e907c&type=album"
        let user = User(image: ricardo, first: firstName.text!, last: lastName.text!, myEmail: email.text!)
        addUserDelegate?.AddNewUser(self, user: user)
    }
}

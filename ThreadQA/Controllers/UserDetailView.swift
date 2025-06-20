
import UIKit

class UserDetailViewController: UIViewController {
    
    var user: User?
    
    @IBOutlet weak var cardView: UIView!
    
    @IBOutlet weak var userImage: UIImageView!
    
    @IBOutlet weak var userName: UILabel!
    
    @IBOutlet weak var userEmail: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "User Detail"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        cardView.layer.cornerRadius = 12
        cardView.layer.borderColor = UIColor(cgColor: #colorLiteral(red: 0.06274509804, green: 0.4470588235, blue: 0.7294117647, alpha: 1).cgColor).cgColor
        cardView.layer.borderWidth = 2.0
        
        self.userImage.layer.cornerRadius=self.userImage.frame.size.width/2
        self.userImage.clipsToBounds = true
        self.userImage.layer.borderColor = UIColor(cgColor: #colorLiteral(red: 0.06274509804, green: 0.4470588235, blue: 0.7294117647, alpha: 1).cgColor).cgColor
        self.userImage.layer.borderWidth = 2
        
        self.navigationController?.navigationBar.tintColor = UIColor.systemGreen
        
    }
    override func viewDidAppear(_ animated: Bool) {
        userName.text = user!.first_name + "" + user!.last_name
        userEmail.text = user!.email
        userImage.image = Downloader.downloadImageWithURL(url: user!.avatar)
    }
}

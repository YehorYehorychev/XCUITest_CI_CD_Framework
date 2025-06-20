import UIKit

class Downloader{
    class func downloadImageWithURL(url: String) -> UIImage{
        let data = NSData(contentsOf: NSURL(string: url)! as URL)
        return UIImage(data: data! as Data)!
    }
}

class HomeViewController: UIViewController, UITableViewDataSource,UITableViewDelegate, AddUserProtocolDelegate {
    
    var users = [User]()
    
    @IBOutlet weak var userView: UITableView!
    let itemsPerBatch = 15
    var currentRow: Int = 1
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Home Page"
        userView.dataSource = self
        userView.delegate = self
        getUsersList()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(users.count)
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "User", for: indexPath) as! HomeTableViewCell
        cell.userName.text = "\(users[indexPath.row].first_name)  \(users[indexPath.row].last_name)"
        cell.userEmail.text = users[indexPath.row].email
        cell.userImage.image = Downloader.downloadImageWithURL(url: users[indexPath.row].avatar)
        cell.userImage.layer.cornerRadius=cell.userImage.frame.size.width/2
        cell.userImage.clipsToBounds = true
        cell.userImage.layer.borderColor = UIColor(cgColor: #colorLiteral(red: 0.06274509804, green: 0.4470588235, blue: 0.7294117647, alpha: 1).cgColor).cgColor
        cell.userImage.layer.borderWidth = 2
        return cell
    }
    
    func getUsersList()
    {
        if !Utilities.isNetworkAvailable()
        {
            showAlert(title: "No network", message: "No Network. Please check your connection.")
        }
        showIndicator(message: "getting users")
        
        let userURL = URL(string: BASE_URL + USERS)!
        let userRequest = URLRequest(url: userURL, cachePolicy: .reloadIgnoringLocalAndRemoteCacheData, timeoutInterval: 30)
        
        URLSession.shared.dataTask(with: userRequest){
            (data, response, error) in
            guard let Data = data, error==nil
            else
            {
                print(error as Any)
                return
            }
            if let httpStatus = (response as? HTTPURLResponse)
            {
                if(httpStatus.statusCode != 200)
                {
                    print(httpStatus.statusCode)
                    return
                }
            }
            DispatchQueue.main.async
            {
                self.extractData(data: Data)
            }
        }.resume()
        
    }
    
    func extractData(data: Data){
        print("Got data!")
        hideIndicator()
        let users = try? JSONDecoder().decode(Result.self, from: data)
        self.users = users!.data
        userView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue .identifier == "UserDetailSegue"
        {
            let userDetailViewController = segue.destination as!
            UserDetailViewController
            
            let indexPath = userView.indexPathForSelectedRow
            
            let userToSendToSecondView = users[indexPath!.row]
            
            userDetailViewController.user = userToSendToSecondView
        }
        
        if segue.identifier == "AddUserSegue"
        {
            let addUserController = segue.destination as!
            AddNewUserViewController
            addUserController.addUserDelegate = self
        }
    }
    func CancelAddingUser(_ controller: AddNewUserViewController) {
        controller.dismiss(animated: true, completion: nil)
    }
    func AddNewUser(_ controller: AddNewUserViewController, user: User) {
        users.insert(user, at: 0)
        userView.reloadData()
        controller.dismiss(animated: true, completion: nil)
    }
}

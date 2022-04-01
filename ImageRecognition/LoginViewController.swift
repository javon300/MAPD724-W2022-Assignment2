//Author Name: Aishwarya Shrestha
//Student ID: 301138662
//Email ID: ashres15@my.centennialcollege.ca

//Author Name: Keshav Dulal
//Student ID: 301209947
//Email ID: kdulal1@my.centennialcollege.ca

//Author Name: Poojan Jitendrakumar Patel
//Student ID: 301228811
//Email ID: ppate821@my.centennialcollege.ca

//Author Name: Matthew Maxwell
//Student ID: 301200258
//Email ID: mmaxwel7@my.centennialcollege.ca

import UIKit
import FirebaseAuth


class LoginViewController: UIViewController {

    @IBOutlet weak var registerTf: UITextField!
    @IBOutlet weak var passwordTv: UITextField!
    @IBOutlet weak var emailTv: UITextField!
    @IBOutlet weak var loginBtn: UIButton!
    private var email: String = ""
    private var passworrd: String = ""
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    
    
    @IBAction func loginBtnPressed(_ sender: Any)
    {
        //get password and email from user
        email = emailTv.text! as String
        passworrd = passwordTv.text! as String
        
        //varify user in firebase
        loginUser(email: email, password: passworrd)
    }
    
    
    func loginUser(email: String, password: String)
    {
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
          guard let strongSelf = self else { return }
        }
        print("user signedInsuccessfully")
    }
}

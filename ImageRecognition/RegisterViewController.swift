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

class RegisterViewController: UIViewController
{
    //variable declacrations
    @IBOutlet weak var registerBtn: UIButton!
    @IBOutlet weak var passwordTv: UITextField!
    @IBOutlet weak var emailTv: UITextField!
    
    var email: String = ""
    var password: String = ""
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    
    //button action
    @IBAction func registerBtnPressed(_ sender: Any)
    {
        //get password and email from user
        email = emailTv.text! as String
        password = passwordTv.text! as String
        
        //varify user in firebase
        registerUser(email: email, password: password)
    }
    
    //function that connects to firebase
    func registerUser(email: String, password: String)
    {
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
          // ...
        }
    }
}

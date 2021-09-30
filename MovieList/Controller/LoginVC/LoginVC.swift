//
//  LoginVC.swift
//  MovieList
//
//  Created by Jaavion Davis on 9/27/21.
//

import UIKit

class LoginVC: UIViewController {
    @IBOutlet var emailTextField:UITextField!
    @IBOutlet var passwordTextField:UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        emailTextField.placeholder = "email"
        passwordTextField.placeholder = "password"
    }
    
    @IBAction func clickMovieLogin (_sender: UIButton!) {
        let story = UIStoryboard.init(name: "Main", bundle: nil);
        let loginVC = story.instantiateViewController(identifier: "MovieVC")
        if emailValidation(emailTextField.text!) == false {
            print("email needs to be longer");
        } else if passwordValidation(passwordTextField.text!) == false {
            print("password needs to be longer");
        } else {
            self.navigationController?.pushViewController(loginVC, animated:true);
        }
    func emailValidation(_ email:String) -> Bool {
        if emailTextField.text!.count > 6 {
            return true
        };
        return false
    }
    func passwordValidation(_ password:String) -> Bool {
        if passwordTextField.text!.count > 6 {
            return true
        }
        return false
        }
   }

}

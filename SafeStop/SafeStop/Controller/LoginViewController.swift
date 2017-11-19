//
//  LoginViewController.swift
//  SafeStop
//
//  Created by Jacky on 11/19/17.
//  Copyright © 2017 Goaloop. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var userPhoneNumberTextField: UITextField!
    @IBOutlet weak var userPasswordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func loginButtonTapped(_ sender: Any) {
        
        let userPhoneNumber = userPhoneNumberTextField.text
        let userPassword = userPasswordTextField.text
        
        let userPhoneNumbeStored = UserDefaults.standard.string(forKey: "userPhoneNumber")
        let userPasswordStored = UserDefaults.standard.string(forKey:"userPassword")
        if (userPhoneNumbeStored == userPhoneNumber) {
            if  (userPasswordStored == userPassword) {
                UserDefaults.standard.set(true, forKey: "isUserLoggedIn")
                UserDefaults.standard.synchronize()
                self.dismiss(animated: true, completion: nil)
            }
        }
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

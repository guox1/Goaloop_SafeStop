//
//  RegisterPageViewController.swift
//  SafeStop
//
//  Created by Jacky on 11/19/17.
//  Copyright © 2017 Goaloop. All rights reserved.
//

import UIKit

class RegisterPageViewController: UIViewController {

    @IBOutlet weak var userPhoneNumberTextField: UITextField!
    @IBOutlet weak var userPasswordTextField: UITextField!
    @IBOutlet weak var repeatPasswordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func registerButtonTapped(_ sender: Any) {
        let userPhoneNumber = userPhoneNumberTextField.text
        let userPassword = userPasswordTextField.text
        let userRepeatPassword = repeatPasswordTextField.text
        
        if (userPhoneNumber == "" || userPassword == "" || userRepeatPassword == ""){
            //Display alert message
            displayMyAlertMessage(userMessage: "All fields are required")
            
            return
        }
        
        if (userPassword != userRepeatPassword) {
            //Display alert message
            displayMyAlertMessage(userMessage: "Passwords do not match")
            
            return
        }
        
        //Srote Data here for now (Later in server side)
        UserDefaults.standard.set(userPhoneNumber, forKey:"userPhoneNumber")
        UserDefaults.standard.set(userPassword, forKey:"userPassword")
        UserDefaults.standard.synchronize()
        
        
        
        var myAlert = UIAlertController(title:"Alert", message:"Registration is successful. Thank you!", preferredStyle: UIAlertControllerStyle.alert)
        let okAction = UIAlertAction(title:"Ok", style:UIAlertActionStyle.default) {
            action in
            self.dismiss(animated: true, completion:nil)
        }
        myAlert.addAction(okAction)
        self.present(myAlert, animated:true, completion:nil)
    }
    
    func displayMyAlertMessage(userMessage:String) {
        var myAlert = UIAlertController(title:"Alert", message:userMessage, preferredStyle: UIAlertControllerStyle.alert)
        let okAction = UIAlertAction(title:"Ok", style:UIAlertActionStyle.default, handler:nil)
        myAlert.addAction(okAction)
        self.present(myAlert, animated:true, completion:nil)
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

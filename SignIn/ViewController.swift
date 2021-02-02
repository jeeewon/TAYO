//
//  ViewController.swift
//  SignIn
//
//  Created by 정효주 on 2021/01/31.
//

import UIKit
import Firebase
import GoogleSignIn

class ViewController: UIViewController {
    @IBAction func signin(_ sender: Any) {
        GIDSignIn.sharedInstance().signIn()
    }
    
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBAction func button(_ sender: Any) {
        Auth.auth().createUser(withEmail: email.text!, password: password.text!) {(user, error) in
        
            if(error != nil){return}
            
            let alert = UIAlertController(title: "알림", message: "회원가입완료", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "확인", style: UIAlertAction.Style.default, handler: nil))
           
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        GIDSignIn.sharedInstance()?.presentingViewController = self
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        //Dispose of any resources that can be recreated.
    }

}


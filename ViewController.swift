//
//  ViewController.swift
//  login2
//
//  Created by Temp on 20/02/23.
//

import UIKit
import KeychainSwift

class ViewController: UIViewController {

    @IBOutlet var paswordTF: UITextField!
    @IBOutlet var loginTF: UITextField!
    
    @IBOutlet var regTF: UIButton!
    @IBOutlet var loginBT: UIButton!
    
    var login: String = ""
    var password1: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        regTF.layer.cornerRadius = 10
        loginTF.layer.cornerRadius = 10

    }

    @IBAction func register(_ sender: Any) {
        saveData()
    }
    
    func saveData(){
        login = loginTF.text ?? ""
        password1 = paswordTF.text ?? ""
        
        let keyChain = KeychainSwift()
        keyChain.set(login, forKey: "login")
        keyChain.set(password1, forKey: "password")

    }
    
    @IBAction func login(_ sender: Any) {
        
        let keyChain = KeychainSwift()
        keyChain.get("login")
        keyChain.get("password")
      
        
        if loginTF.text == login  && paswordTF.text == password1 {
            performSegue(withIdentifier: "login", sender: nil)
        }else{
            let alert = UIAlertController(title: "error", message: "some error", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default)
            alert.addAction(action)
            present(alert, animated: true)
        }
                
    }
    
    
}


//
//  LoginVC.swift
//  MagicFinmart
//
//  Created by Admin on 11/12/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit

class LoginVC: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var emailTf: ACFloatingTextfield!
    @IBOutlet weak var passwordTf: ACFloatingTextfield!
    
    let aTextField = ACFloatingTextfield()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //--<textField>--
        aTextField.delegate = self
        
    }
    
    func getRandomColor() -> UIColor{
        return UIColor.init(red: 0/255.0, green: 125/255.0, blue: 213/255.0, alpha: 1)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func loginSubmitBtnCliked(_ sender: Any)
    {
//        let MainfinMart : MainfinMartVC! = storyboard?.instantiateViewController(withIdentifier: "stbMainfinMartVC") as? MainfinMartVC
//        self.addChild(MainfinMart)
//        self.view.addSubview(MainfinMart.view)
        let KYDrawer : KYDrawerController = self.storyboard?.instantiateViewController(withIdentifier: "stbKYDrawerController") as! KYDrawerController
        present(KYDrawer, animated: true, completion: nil)
    }
    
    @IBAction func signupBtnCliked(_ sender: Any)
    {
        let ViewC : ViewController = self.storyboard?.instantiateViewController(withIdentifier: "stbViewController") as! ViewController
        self.addChild(ViewC)
        self.view.addSubview(ViewC.view)
        
    }
    
    @IBAction func forgetpassBtnCliked(_ sender: Any)
    {
        let forgtPass : forgtPassVC = self.storyboard?.instantiateViewController(withIdentifier: "stbforgtPassVC") as! forgtPassVC
        self.addChild(forgtPass)
        self.view.addSubview(forgtPass.view)
    }
    
    
}

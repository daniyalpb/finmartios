//
//  changePasswrdVC.swift
//  MagicFinmart
//
//  Created by Admin on 27/12/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit

class changePasswrdVC: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var oldpassTf: ACFloatingTextfield!
    @IBOutlet weak var newpassTf: ACFloatingTextfield!
    @IBOutlet weak var confirmpassTf: ACFloatingTextfield!
    
    let aTextField = ACFloatingTextfield()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //--<textField>--
        aTextField.delegate = self

    }

    //--<textfieldAnimation>--
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
    
    @IBAction func slidemenuBtnCliked(_ sender: Any)
    {
        if let drawerController = navigationController?.parent as? KYDrawerController {
            drawerController.setDrawerState(.opened, animated: true)
        }
        
    }
    

}

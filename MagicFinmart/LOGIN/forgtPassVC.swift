//
//  forgtPassVC.swift
//  MagicFinmart
//
//  Created by Admin on 13/12/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit

class forgtPassVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func removeViewBtnCliked(_ sender: Any)
    {
        let Login : LoginVC = self.storyboard?.instantiateViewController(withIdentifier: "stbLoginVC") as! LoginVC
        self.addChild(Login)
        self.view.addSubview(Login.view)
    }
    


}

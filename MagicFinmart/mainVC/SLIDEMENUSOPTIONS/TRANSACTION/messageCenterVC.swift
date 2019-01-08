//
//  messageCenterVC.swift
//  MagicFinmart
//
//  Created by Admin on 27/12/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit

class messageCenterVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func backBtnCliked(_ sender: Any)
    {
        let KYDrawer : KYDrawerController = self.storyboard?.instantiateViewController(withIdentifier: "stbKYDrawerController") as! KYDrawerController
        present(KYDrawer, animated: true, completion: nil)
    }
    
}

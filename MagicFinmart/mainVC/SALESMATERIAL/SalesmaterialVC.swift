//
//  SalesmaterialVC.swift
//  MagicFinmart
//
//  Created by Admin on 14/12/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit

class SalesmaterialVC: UIViewController,UITableViewDataSource,UITableViewDelegate {
   
    @IBOutlet weak var salesMTView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func salesMaterialBackBtn(_ sender: Any)
    {
        let MainfinMart : MainfinMartVC = self.storyboard?.instantiateViewController(withIdentifier: "stbMainfinMartVC") as! MainfinMartVC
        self.addChild(MainfinMart)
        self.view.addSubview(MainfinMart.view)
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 80
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = salesMTView.dequeueReusableCell(withIdentifier: "cell") as! salesmaterialTVCell
        
        let borderColor = UIColor.gray
        cell.salescellView.layer.cornerRadius=2;
        cell.salescellView.layer.borderWidth=1.0;
        cell.salescellView.layer.borderColor=borderColor.cgColor;
        
        return cell
        
    }
    
  
    
    

}

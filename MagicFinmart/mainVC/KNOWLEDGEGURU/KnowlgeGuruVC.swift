//
//  KnowlgeGuruVC.swift
//  MagicFinmart
//
//  Created by Admin on 14/12/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit

class KnowlgeGuruVC: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var knowtableArray = ["LOANS","INSURANCE","OTHER PRODUCTS"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func knowguruBackBtn(_ sender: Any)
    {
        let MainfinMart : MainfinMartVC = self.storyboard?.instantiateViewController(withIdentifier: "stbMainfinMartVC") as! MainfinMartVC
        self.addChild(MainfinMart)
        self.view.addSubview(MainfinMart.view)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return knowtableArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! knowGuruTVCell
        
        let borderColor = UIColor.gray
        cell.knowguruTView.layer.cornerRadius=2;
        cell.knowguruTView.layer.borderWidth=1.0;
        cell.knowguruTView.layer.shadowColor=borderColor.cgColor;
        cell.knowguruTView.layer.borderColor=borderColor.cgColor;
        
        cell.knowguruCellLbl.text = knowtableArray[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    

    

}

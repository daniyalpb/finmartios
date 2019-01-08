//
//  multiselctionTVC.swift
//  MagicFinmart
//
//  Created by Admin on 13/12/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit

class multiselctionTVC: UIViewController,UITableViewDelegate,UITableViewDataSource {
  

    @IBOutlet weak var slectnTV: UITableView!
    
    var tableArray = ["abdc","sfff","jjjj","kkllk","kjkj","jkjjjk","abdc","sfff","jjjj","kkllk","kjkj","jkjjjk"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return tableArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = slectnTV.dequeueReusableCell(withIdentifier: "cell") as! multiselctionTVCell
        
        cell.tableLbl.text! = tableArray[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        slectnTV.cellForRow(at: indexPath)?.accessoryType = UITableViewCell.AccessoryType.checkmark
    }
    
    @IBAction func tableCancelBtnCliked(_ sender: Any)
    {
        self.willMove(toParent: nil)
        self.view.removeFromSuperview()
        self.removeFromParent()
    }
    
}

//
//  MainfinMartVC.swift
//  MagicFinmart
//
//  Created by Admin on 13/12/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit

class MainfinMartVC: UIViewController,UITableViewDataSource,UITableViewDelegate {
   
    @IBOutlet weak var salesmaterialView: UIView!
    @IBOutlet weak var pendingcasesView: UIView!
    @IBOutlet weak var knowguruView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //border
        let borderColor = UIColor.black
        salesmaterialView.layer.borderWidth=1.0;
        salesmaterialView.layer.borderColor=borderColor.cgColor;
        pendingcasesView.layer.borderWidth=1.0;
        pendingcasesView.layer.borderColor=borderColor.cgColor;
        knowguruView.layer.borderWidth=1.0;
        knowguruView.layer.borderColor=borderColor.cgColor;
        
    }
    
    @IBAction func finmartMenuBtn(_ sender: Any)
    {
        if let drawerController = navigationController?.parent as? KYDrawerController {
            drawerController.setDrawerState(.opened, animated: true)
        }
    }
   
    @IBAction func salesmaterialBtnCliked(_ sender: Any)
    {
        let Salesmaterial : SalesmaterialVC = self.storyboard?.instantiateViewController(withIdentifier: "stbSalesmaterialVC") as! SalesmaterialVC
        self.addChild(Salesmaterial)
        self.view.addSubview(Salesmaterial.view)
    }
    
    @IBAction func pendingcasesBtnCliked(_ sender: Any)
    {
        let Pendingcases : PendingcasesVC = self.storyboard?.instantiateViewController(withIdentifier: "stbPendingcasesVC") as! PendingcasesVC
        self.addChild(Pendingcases)
        self.view.addSubview(Pendingcases.view)
    }
    
    @IBAction func knowguruBtnCliked(_ sender: Any)
    {
        let KnowlgeGuru : KnowlgeGuruVC = self.storyboard?.instantiateViewController(withIdentifier: "stbKnowlgeGuruVC") as! KnowlgeGuruVC
        self.addChild(KnowlgeGuru)
        self.view.addSubview(KnowlgeGuru.view)
    }
    
    //tableView Datasource+Delegates
    func numberOfSections(in tableView: UITableView) -> Int
    {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        if(section == 0)
        {
            return 2
        }
        else if(section == 1)
        {
            return 2
        }
        else if(section == 2)
        {
            return 2
        }
        else{
            return 0
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! MainfinmartTVCell
        
        let borderColor = UIColor.gray
        cell.inTView.layer.borderWidth=1.0;
        cell.inTView.layer.borderColor=borderColor.cgColor;

        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView:UIView =  UIView()
        headerView.backgroundColor = UIColor.gray
        
        let label = UILabel()
        label.frame = CGRect.init(x: 5, y: 10, width: 200, height: 30)
        let label2 = UILabel()
        label2.frame = CGRect.init(x: view.frame.maxY, y: 10, width: 200, height: 30)
        if(section == 0)
        {
           label.text = "INSURANCE"
           label2.text = "POWERED BY"
        }
        else if(section == 1)
        {
            label.text = "LOANS"
            label2.text = "POWERED BY"
        }
        else if(section == 2)
        {
            label.text = "MORE SERVICES"
        }
        
//        label.font = UIFont().futuraPTMediumFont(16) // my custom font
        label.font = UIFont.boldSystemFont(ofSize: 16)
//        label.textColor = UIColor.charcolBlackColour() // my custom colour
        label.textColor = UIColor.white
        headerView.addSubview(label)
        label2.font = UIFont.italicSystemFont(ofSize: 16)
        //        label.textColor = UIColor.charcolBlackColour() // my custom colour
        label2.textColor = UIColor.white
        headerView.addSubview(label2)

        
        return headerView
    }
    
    // endtableView Datasource+Delegates
    

}


//
//  commonQuotesVC.swift
//  MagicFinmart
//
//  Created by Admin on 28/02/19.
//  Copyright © 2019 Ashwini. All rights reserved.
//

import UIKit

class commonQuotesVC: UIViewController,UITableViewDelegate,UITableViewDataSource {
   
    var fromScreen = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
   
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! commonQuotesTVCell
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    
    
    @IBAction func addquoteBtnCliked(_ sender: Any)
    {
        
    }
    
    @IBAction func addplusBtnCliked(_ sender: Any)
    {
        let MotorInsurance : MotorInsuranceVCS = self.storyboard?.instantiateViewController(withIdentifier: "stbMotorInsuranceVCS") as! MotorInsuranceVCS
        if(fromScreen == "gethomeLoanInput")
        {
            MotorInsurance.fromScreen = "hLoan"
        }
        else if(fromScreen == "getpersonalLoanInput"){
           
            MotorInsurance.fromScreen = "pLoan"
         }
        else{
            MotorInsurance.fromScreen = "lp"
        }
        present(MotorInsurance, animated: true, completion: nil)
        
    }
    
    
    

}

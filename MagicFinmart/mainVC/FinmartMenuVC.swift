//
//  FinmartMenuVC.swift
//  MagicFinmart
//
//  Created by Admin on 15/12/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit

class FinmartMenuVC: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    var myaccountItems = ["Profile", "Change Password", "Loan Agreement"]
    var transactionsItems = ["Transaction History","Message Centre"]
    var earningtoolsItmes = ["MPS","Income Calculator","Income Potential"]
    var leadsItems = ["Motor Insurance","Loans(Share Data)","Sync Contacts"]
    var pospItems = ["Enrol as POSP","Add Users"]
    var requestItems = ["Offline Quotes","Request Policy by CRN"]
    var otherutilitiesItems = ["WHAT'S NEW","HELP & FEEDBACK","TRAINING","LEAD DETAILS","LOG-OUT"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func menuViewBtnCliked(_ sender: Any)
    {
        UIView.animate(withDuration: 0.3, animations: { () -> Void in
            self.view.frame = CGRect(x: -UIScreen.main.bounds.size.width, y: 0, width: UIScreen.main.bounds.size.width,height: UIScreen.main.bounds.size.height)
            self.view.layoutIfNeeded()
            self.view.backgroundColor = UIColor.clear
        }, completion: { (finished) -> Void in
            self.view.removeFromSuperview()
            self.removeFromParent()
        })
    }
    
    @IBAction func menuhomeBtnCliked(_ sender: Any)
    {
        let KYDrawer : KYDrawerController = self.storyboard?.instantiateViewController(withIdentifier: "stbKYDrawerController") as! KYDrawerController
        present(KYDrawer, animated: true, completion: nil)
    }
    
    //-----<tableView Datasource+Deleagtes>-----
    func numberOfSections(in tableView: UITableView) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(section == 0){
            return myaccountItems.count
        }
        else if(section == 1){
            return transactionsItems.count
        }
        else if(section == 2){
            return earningtoolsItmes.count
        }
        else if(section == 3){
            return leadsItems.count
        }
        else if(section == 4){
            return pospItems.count
        }
        else if(section == 5){
            return requestItems.count
        }
        else if(section == 6){
            return otherutilitiesItems.count
        }
        else{
            return 0
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        cell.textLabel?.textColor = UIColor.gray
        if(indexPath.section == 0){
            cell.textLabel?.text = myaccountItems[indexPath.row]
        }
        else if(indexPath.section == 1){
            cell.textLabel?.text = transactionsItems[indexPath.row]
        }
        else if(indexPath.section == 2){
            cell.textLabel?.text = earningtoolsItmes[indexPath.row]
        }
        else if(indexPath.section == 3){
            cell.textLabel?.text = leadsItems[indexPath.row]
        }
        else if(indexPath.section == 4){
            cell.textLabel?.text = pospItems[indexPath.row]
        }
        else if(indexPath.section == 5){
            cell.textLabel?.text = requestItems[indexPath.row]
        }
        else if(indexPath.section == 6){
            cell.textLabel?.text = otherutilitiesItems[indexPath.row]
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView:UIView =  UIView()
        headerView.backgroundColor = UIColor.white
        
        let label = UILabel()
        label.frame = CGRect.init(x: 15, y: 10, width: 200, height: 30)
        if(section == 0)
        {
            label.text = "MY ACCOUNT"
        }
        else if(section == 1)
        {
            label.text = "TRANSACTIONS"
        }
        else if(section == 2)
        {
            label.text = "EARNING TOOLS"
        }
        else if(section == 3)
        {
            label.text = "LEADS"
        }
        else if(section == 4)
        {
            label.text = "POSP"
        }
        else if(section == 5)
        {
            label.text = "REQUEST"
        }
        else if(section == 6)
        {
            label.text = "OTHER UTILITIES"
        }
        
        //        label.font = UIFont().futuraPTMediumFont(16) // my custom font
        label.font = UIFont.boldSystemFont(ofSize: 16)
        //        label.textColor = UIColor.charcolBlackColour() // my custom colour
        label.textColor = UIColor.gray
        headerView.addSubview(label)
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerView:UIView =  UIView()
        footerView.backgroundColor = UIColor.lightGray
        
        return footerView
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 1
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if(indexPath.section == 0)
        {
            if(indexPath.row == 0)
            {
                let profile : profileVC = self.storyboard?.instantiateViewController(withIdentifier: "stbprofileVC") as! profileVC
                present(profile, animated: true, completion: nil)
            }
            else if(indexPath.row == 1)
            {
                let changePasswrd : changePasswrdVC = self.storyboard?.instantiateViewController(withIdentifier: "stbchangePasswrdVC") as! changePasswrdVC
                present(changePasswrd, animated: true, completion: nil)
            }
            else if(indexPath.row == 2)
            {
                let loanAgrmnt : loanAgrmntVC = self.storyboard?.instantiateViewController(withIdentifier: "stbloanAgrmntVC") as! loanAgrmntVC
                present(loanAgrmnt, animated: true, completion: nil)
            }
        }
        else if(indexPath.section == 1)
        {
            if(indexPath.row == 0)
            {
                let transctionHistory : transctionHistoryVC = self.storyboard?.instantiateViewController(withIdentifier: "stbtransctionHistoryVC") as! transctionHistoryVC
                present(transctionHistory, animated: true, completion: nil)
            }
            else if(indexPath.row == 1)
            {
                let messageCenter : messageCenterVC = self.storyboard?.instantiateViewController(withIdentifier: "stbmessageCenterVC") as! messageCenterVC
                present(messageCenter, animated: true, completion: nil)
            }
        }
        else if(indexPath.section == 2)
        {
            if(indexPath.row == 0)
            {
                let mpsV : mpsVC = self.storyboard?.instantiateViewController(withIdentifier: "stbmpsVC") as! mpsVC
                present(mpsV, animated: true, completion: nil)
            }
            else if(indexPath.row == 1)
            {
                let incmCalculatr : incmCalculatrVC = self.storyboard?.instantiateViewController(withIdentifier: "stbincmCalculatrVC") as! incmCalculatrVC
                present(incmCalculatr, animated: true, completion: nil)
            }
            else if(indexPath.row == 2)
            {
                let incmPotential : incmPotentialVC = self.storyboard?.instantiateViewController(withIdentifier: "stbincmPotentialVC") as! incmPotentialVC
                present(incmPotential, animated: true, completion: nil)
            }
        }
        else if(indexPath.section == 3)
        {
            if(indexPath.row == 0)
            {
                let motorInsurance : motorInsuranceVC = self.storyboard?.instantiateViewController(withIdentifier: "stbmotorInsuranceVC") as! motorInsuranceVC
                present(motorInsurance, animated: true, completion: nil)
            }
            else if(indexPath.row == 1)
            {
                let loans_shareData : loans_shareData_VC = self.storyboard?.instantiateViewController(withIdentifier: "stbloans_shareData_VC") as! loans_shareData_VC
                present(loans_shareData, animated: true, completion: nil)
            }
            else if(indexPath.row == 2)
            {
                let syncContacts : syncContactsVC = self.storyboard?.instantiateViewController(withIdentifier: "stbsyncContactsVC") as! syncContactsVC
                present(syncContacts, animated: true, completion: nil)
            }
        }
        else if(indexPath.section == 4)
        {
            if(indexPath.row == 0)
            {
                let enrolasPOSP : enrolasPOSPVC = self.storyboard?.instantiateViewController(withIdentifier: "stbenrolasPOSPVC") as! enrolasPOSPVC
                present(enrolasPOSP, animated: true, completion: nil)
            }
            else if(indexPath.row == 1)
            {
                let addUsers : addUsersVC = self.storyboard?.instantiateViewController(withIdentifier: "stbaddUsersVC") as! addUsersVC
                present(addUsers, animated: true, completion: nil)
            }
        }
        else if(indexPath.section == 5)
        {
            if(indexPath.row == 0)
            {
                let offlineQuotes : offlineQuotesVC = self.storyboard?.instantiateViewController(withIdentifier: "stbofflineQuotesVC") as! offlineQuotesVC
                present(offlineQuotes, animated: true, completion: nil)
            }
            else if(indexPath.row == 1)
            {
                let reqpolicy : reqpolicyVC = self.storyboard?.instantiateViewController(withIdentifier: "stbreqpolicyVC") as! reqpolicyVC
                present(reqpolicy, animated: true, completion: nil)
            }
        }
        else if(indexPath.section == 6)
        {
            if(indexPath.row == 0)
            {
                let whatsNew : whatsNewVC = self.storyboard?.instantiateViewController(withIdentifier: "stbwhatsNewVC") as! whatsNewVC
                present(whatsNew, animated: true, completion: nil)
            }
            else if(indexPath.row == 1)
            {
                let helpnfeedback : helpnfeedbackVC = self.storyboard?.instantiateViewController(withIdentifier: "stbhelpnfeedbackVC") as! helpnfeedbackVC
                present(helpnfeedback, animated: true, completion: nil)
            }
            else if(indexPath.row == 2)
            {
                let training : trainingVC = self.storyboard?.instantiateViewController(withIdentifier: "stbtrainingVC") as! trainingVC
                present(training, animated: true, completion: nil)
            }
            else if(indexPath.row == 3)
            {
                let leadDetails : leadDetailsVC = self.storyboard?.instantiateViewController(withIdentifier: "stbleadDetailsVC") as! leadDetailsVC
                present(leadDetails, animated: true, completion: nil)
            }
            if(indexPath.row == 4)
            {
                let Login : LoginVC = self.storyboard?.instantiateViewController(withIdentifier: "stbLoginVC") as! LoginVC
                present(Login, animated: true, completion: nil)
            }
        }
    }
    //-----<end tableView Datasource+Deleagtes>-----
    
    
}



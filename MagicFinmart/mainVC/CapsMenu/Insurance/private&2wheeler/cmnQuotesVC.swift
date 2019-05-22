//
//  cmnQuotesVC.swift
//  MagicFinmart
//
//  Created by Ashwini on 08/02/19.
//  Copyright © 2019 Ashwini. All rights reserved.
//

import UIKit
import CustomIOSAlertView
import TTGSnackbar

class cmnQuotesVC: UIViewController,UITableViewDelegate,UITableViewDataSource,cellbtnDelegate,cellDELETEDelegate,UITextFieldDelegate {
  
    @IBOutlet weak var quotesTV: UITableView!
    @IBOutlet weak var searchTF: ACFloatingTextfield!
    
    var frstNameArr = [String]()
    var lastNameArr = [String]()
    var vehicleIdArr = [String]()
    var crnArr = [String]()
    var qdateArr = [String]()
    var qVehicleRequestIDArr = [String]()
    var vehicleRequestID = ""
  
    var searchActive : Bool = false
    var filtered:[String] = []
    var Message = ""
    var fromScreen = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print("vehicleIdArr=",vehicleIdArr)
        print("qVehicleRequestIDArr=",qVehicleRequestIDArr)
        searchTF.addTarget(self, action: #selector(cmnQuotesVC.textFieldDidChange(_:)),
                           for: UIControl.Event.editingChanged)
    }
    
    @objc func textFieldDidChange(_ textField: UITextField)
    {
        // filter tableViewData with textField.text
        let searchText  = searchTF.text!
        filtered = lastNameArr.filter({ (text) -> Bool in
            let tmp: NSString = text as NSString
            let range = tmp.range(of: searchText, options: NSString.CompareOptions.caseInsensitive)
            return range.location != NSNotFound
        })
        if(searchTF.text!.count >= 2){
            searchActive = true;
        } else {
            searchActive = false;
        }
        
        self.quotesTV.reloadData()
        
    }


    //--<tableViewDelegates+Datasource>--
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return frstNameArr.count
        if(searchActive){
            return filtered.count
        } else {
            return lastNameArr.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! cmnquotesTVCell
    
        if(searchActive){
            cell.qlstName1.text = filtered[indexPath.row].uppercased()
        } else {
            cell.qlstName1.text = lastNameArr[indexPath.row].uppercased()
        }
        cell.qName1.text! = frstNameArr[indexPath.row].uppercased()
//        cell.qlstName1.text! = lastNameArr[indexPath.row].uppercased()
        cell.qName2.text! = vehicleIdArr[indexPath.row]
        cell.crnNoLbl.text! = crnArr[indexPath.row]
        cell.qdateLbl.text! = qdateArr[indexPath.row]
        
        //--menuoptions--
        cell.delegate = self
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    

    func btnoptionTapped(cell: cmnquotesTVCell)
    {
        //Get the indexpath of cell where button was tapped
        let indexPath = self.quotesTV.indexPath(for: cell)
        print("indexPath!.row",indexPath!.row)
        //here I want to execute the UIActionSheet
        let actionsheet = UIAlertController(title: nil, message: nil, preferredStyle: UIAlertController.Style.actionSheet)
        actionsheet.addAction(UIAlertAction(title: "CALL", style: UIAlertAction.Style.default, handler: { (action) -> Void in
        }))
        actionsheet.addAction(UIAlertAction(title: "SMS", style: UIAlertAction.Style.default, handler: { (action) -> Void in
            print("SMS")
            let myWebsite = NSURL(string:"SMS")
            let shareAll = [myWebsite as Any]
            let activityViewController = UIActivityViewController(activityItems: shareAll, applicationActivities: nil)
            activityViewController.popoverPresentationController?.sourceView = self.view
            self.present(activityViewController, animated: true, completion: nil)
        }))
        actionsheet.addAction(UIAlertAction(title: "DELETE", style: UIAlertAction.Style.default, handler: { (action) -> Void in
            print("DELETE")
            //--menuoptions--
            self.btnDELETETapped(cell: cell)
        }))
        actionsheet.addAction(UIAlertAction(title: "CANCEL", style: UIAlertAction.Style.cancel, handler: { (action) -> Void in
        }))
        self.present(actionsheet, animated: true, completion: nil)
   
    }
    
    func btnDELETETapped(cell: cmnquotesTVCell)
    {
        //Get the indexpath of cell where button was tapped
        let indexPath = self.quotesTV.indexPath(for: cell)
        print("indexPath!.row",indexPath!.row)
        vehicleRequestID = qVehicleRequestIDArr[indexPath!.row]
        deletevehiclerequestAPI()
        if(Message == "Record deleted successfully.")
        {
            lastNameArr.remove(at: (indexPath?.row)!)
            self.quotesTV!.reloadData()
        }
    }
    
    
    @IBAction func searchBtnCliked(_ sender: Any)
    {
        
    }
    
    @IBAction func addQuoteBtnCliked(_ sender: Any)
    {
        let MotorInsurance : MotorInsuranceVCS = self.storyboard?.instantiateViewController(withIdentifier: "stbMotorInsuranceVCS") as! MotorInsuranceVCS
        MotorInsurance.fromScreen = "addQuotes"
        present(MotorInsurance, animated: true, completion: nil)
    }
    
    @IBAction func addquotesBtnCliked(_ sender: Any)
    {
        let MotorInsurance : MotorInsuranceVCS = self.storyboard?.instantiateViewController(withIdentifier: "stbMotorInsuranceVCS") as! MotorInsuranceVCS
        if(fromScreen == "gettwowhlrInput"){
            MotorInsurance.fromScreen = "twoWhlr"
        }
        else{
            MotorInsurance.fromScreen = "addQuotes"
        }
        present(MotorInsurance, animated: true, completion: nil)
    }
    
    
    //---<APICALL>---
    func deletevehiclerequestAPI()
    {
        let alertView:CustomIOSAlertView = FinmartStyler.getLoadingAlertViewWithMessage("Please Wait...")
        if let parentView = self.navigationController?.view
        {
            alertView.parentView = parentView
        }
        else
        {
            alertView.parentView = self.view
        }
        alertView.show()
        
        let params: [String: AnyObject] = ["VehicleRequestID":vehicleRequestID as AnyObject]
        
        print("params",params)
        let url = "/api/delete-vehicle-request"
        
        FinmartRestClient.sharedInstance.authorisedPost(url, parameters: params, onSuccess: { (userObject, metadata) in
            alertView.close()
            
            self.view.layoutIfNeeded()
            
            let jsonData = userObject as? NSArray
            print("jsonData=",jsonData!)
            self.Message = ((jsonData![0] as AnyObject).value(forKey: "Message") as AnyObject) as! String
            
            self.quotesTV!.reloadData()
            TTGSnackbar.init(message: "Record deleted successfully.", duration: .long).show()
            
        }, onError: { errorData in
            alertView.close()
            let snackbar = TTGSnackbar.init(message: errorData.errorMessage, duration: .long)
            snackbar.show()
        }, onForceUpgrade: {errorData in})
        
    }

    
}

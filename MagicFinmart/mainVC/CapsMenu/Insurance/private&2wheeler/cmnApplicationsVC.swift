//
//  cmnApplicationsVC.swift
//  MagicFinmart
//
//  Created by Admin on 08/02/19.
//  Copyright © 2019 Ashwini. All rights reserved.
//

import UIKit

class cmnApplicationsVC: UIViewController,UITableViewDataSource,UITableViewDelegate,appcellbtnDelegate,UITextFieldDelegate {
    
    @IBOutlet weak var applisearchTf: ACFloatingTextfield!
    @IBOutlet weak var applictnTV: UITableView!
    
    var frstNameArray = [String]()
    var lstNameArray = [String]()
    var crnArray = [String]()
    var quoteDateArray = [String]()
    var registNoArray = [String]()
    var appstatusArray = [String]()
    var appstatusperArray = [String]()
    var imagesArray = [String]()
    
    var searchActive : Bool = false
    var filtered:[String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        applisearchTf.addTarget(self, action: #selector(cmnApplicationsVC.textFieldDidChange(_:)),
                           for: UIControl.Event.editingChanged)
    }
    
    
    @objc func textFieldDidChange(_ textField: UITextField)
    {
        // filter tableViewData with textField.text
        let searchText  = applisearchTf.text!
        filtered = lstNameArray.filter({ (text) -> Bool in
            let tmp: NSString = text as NSString
            let range = tmp.range(of: searchText, options: NSString.CompareOptions.caseInsensitive)
            return range.location != NSNotFound
        })
        if(applisearchTf.text!.count >= 2)
        {
            searchActive = true;
        } else {
            searchActive = false;
        }
        
        self.applictnTV.reloadData()
        
    }
    
    //tableViewDatasource+Delegates
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(searchActive){
            return filtered.count
        } else {
            return lstNameArray.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! cmnapplictnTVCell
      
        cell.titleNameLbl.text! = frstNameArray[indexPath.row].uppercased()
//        cell.titlelstNameLbl.text! = lstNameArray[indexPath.row].uppercased()
        if(searchActive){
            cell.titlelstNameLbl.text = filtered[indexPath.row].uppercased()
        } else {
            cell.titlelstNameLbl.text = lstNameArray[indexPath.row].uppercased()
        }
        cell.appstatusPerLbl.text! = appstatusperArray[indexPath.row]+"%"
        cell.vehicleNoLbl.text! = registNoArray[indexPath.row]
        cell.appDateLbl.text! = quoteDateArray[indexPath.row]
        cell.appNoLbl.text! = crnArray[indexPath.row]
        
        //--<show percentage on progressView>--
        let counter:Int = 0
        let value = appstatusperArray[indexPath.row]
        let value1:Float = Float(value)!/100.0
        print("value1",value1)
        let animated = counter != 0
        cell.progressView.setProgress(value1, animated: animated)
        
        //loadimages
        print("imagesArray=",imagesArray)
        
        if let imageURL = URL(string: imagesArray[indexPath.row]) {
            DispatchQueue.global().async {
                let data = try? Data(contentsOf: imageURL)
                if let data = data {
                    let image = UIImage(data: data)
                    DispatchQueue.main.async {
                        cell.imgView.image = image
                    }
                }
            }
        }
        
        //--menuoptions--
        cell.delegate = self
     
        return cell
        
    }
  
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 175
    }

    
    func btnoptionTapped(cell: cmnapplictnTVCell)
    {
        //Get the indexpath of cell where button was tapped
        let indexPath = self.applictnTV.indexPath(for: cell)
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
        actionsheet.addAction(UIAlertAction(title: "CANCEL", style: UIAlertAction.Style.cancel, handler: { (action) -> Void in
        }))
        self.present(actionsheet, animated: true, completion: nil)
        
    }
    
    
}

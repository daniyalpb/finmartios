//
//  motorInsurancecapsVC.swift
//  MagicFinmart
//
//  Created by Admin on 11/01/19.
//  Copyright © 2019 Ashwini. All rights reserved.
//

import UIKit
import CustomIOSAlertView
import TTGSnackbar

class motorInsurancecapsVC: UIViewController,SelectedDateDelegate,getPickerDataDelegate {
   
    @IBOutlet weak var inputFirstView: UIView!
    @IBOutlet weak var inputFirstViewHeight: NSLayoutConstraint!//372
    @IBOutlet weak var newvehicleView: UIView!
    @IBOutlet weak var companyView: UIView!
    @IBOutlet weak var regisnoView: UIView!
    @IBOutlet weak var getQuotesView: UIView!
    @IBOutlet weak var getQuotesViewHeight: NSLayoutConstraint!
    @IBOutlet weak var existingNCBView: UIView!
    @IBOutlet weak var exixtingNCBViewHeight: NSLayoutConstraint!//100
    @IBOutlet weak var getQuotesBtn: UIButton!
    @IBOutlet weak var yesBtn: UIButton!
    @IBOutlet weak var noBtn: UIButton!
    @IBOutlet weak var regdateTf: ACFloatingTextfield!
    @IBOutlet weak var expirydateTf: ACFloatingTextfield!
    @IBOutlet weak var compreLbl: UILabel!
    @IBOutlet weak var fuelTypLbl: UILabel!
    @IBOutlet weak var monthLbl: UILabel!
    @IBOutlet weak var yearLbl: UILabel!
    @IBOutlet weak var varientLbl: UILabel!
    @IBOutlet weak var makemodelTf: ACFloatingTextfield!
    @IBOutlet weak var rtoTf: ACFloatingTextfield!
    @IBOutlet weak var prentinsurerLbl: UILabel!
    
    var inSubArray = ["Comprehensive Plan (1 Yr)","T.P.Only (1 Yr)"]
    var fueltypeArray = ["Fuel Type"]
    var varientArray = ["Variant"]
    var monthArray = ["JAN","FEB","MAR","APR","MAY","JUN","JUL","AUG","SEP","OCT","NOV","DEC"]
    var yearArray = ["2019","2018","2017","2016","2015","2014","2013","2012","2011","2010","2009","2008","2007","2006","2005","2004"]
    var rtoArray = [String]()
    var makemodelArray = [String]()
    var presentinsurerArray = ["Select","Bajaj","Bharti","Cholamandalam","Future Gen","HDFC","ICICI","IFFCO","Kotak","Liberty Videocon","Magma","National","New India","Oriental","Raheja","Reliance","SBI General","Shriram","Sundaram","Tata AIG","Uinited","Universal Sompo"]
    
    var date = ""
    var fromScreen = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //--<CornerRadius+Border>--
        let borderColor = UIColor.lightGray
        newvehicleView.layer.cornerRadius=4.0
        newvehicleView.layer.borderWidth=1.0;
        newvehicleView.layer.borderColor=borderColor.cgColor;
        newvehicleView.layer.shadowColor=borderColor.cgColor;
        companyView.layer.cornerRadius=4.0
        companyView.layer.borderWidth=1.0;
        companyView.layer.borderColor=borderColor.cgColor;
        companyView.layer.shadowColor=borderColor.cgColor;
        regisnoView.layer.cornerRadius=4.0
        regisnoView.layer.borderWidth=1.0;
        regisnoView.layer.borderColor=borderColor.cgColor;
        regisnoView.layer.shadowColor=borderColor.cgColor;
        getQuotesView.layer.cornerRadius=4.0
        getQuotesView.layer.borderWidth=1.0;
        getQuotesView.layer.borderColor=borderColor.cgColor;
        getQuotesView.layer.shadowColor=borderColor.cgColor;
        let borderColr = UIColor.darkGray
        existingNCBView.layer.cornerRadius=2.0
        existingNCBView.layer.borderWidth=1.0;
        existingNCBView.layer.borderColor=borderColr.cgColor;
        existingNCBView.layer.shadowColor=borderColr.cgColor;
        let borderColrr = UIColor.init(red: 0/225.0, green: 125/225.0, blue: 213/225.0, alpha: 1)
        self.noBtn.layer.cornerRadius=2.0;
        self.noBtn.layer.borderWidth=2.0;
        self.noBtn.layer.borderColor=borderColrr.cgColor;
        self.yesBtn.layer.cornerRadius=2.0;
        self.yesBtn.layer.borderWidth=2.0;
        self.yesBtn.layer.borderColor=borderColr.cgColor;
        
        //--<HideViews>--
        inputFirstView.isHidden = false
        inputFirstViewHeight.constant = 372
        getQuotesView.isHidden = true
        getQuotesViewHeight.constant = 0
        getQuotesBtn.isHidden = true
        existingNCBView.isHidden = false
        exixtingNCBViewHeight.constant = 100
        
    }
    
    @IBAction func ClickHereBtnCliked(_ sender: Any)
    {
        inputFirstView.isHidden = true
        inputFirstViewHeight.constant = 0
        getQuotesView.isHidden = false
        getQuotesViewHeight.constant = 610
        getQuotesBtn.isHidden = false
        
        //--<apiCall>--
        gvehicledetailsAPI()
        getcityvehicleAPI()
    }
    
    //--<dropdown>--
    @IBAction func inSubDropBtnCliked(_ sender: Any)
    {
        self.view.endEditing(true)
        let Picker : PickerViewVC! = storyboard?.instantiateViewController(withIdentifier: "stbPickerViewVC") as? PickerViewVC
        Picker.fromScreen = "insuranceSubtype"
        Picker.pickerData = ["Select"]+inSubArray
//        Picker.pickerIdData = sourceIdArray
        self.addChild(Picker)
        self.view.addSubview(Picker.view)
        Picker.pickerdelegate = self
    }
    
    @IBAction func fyeltypeDropBtnCliked(_ sender: Any)
    {
        self.view.endEditing(true)
        let Picker : PickerViewVC! = storyboard?.instantiateViewController(withIdentifier: "stbPickerViewVC") as? PickerViewVC
        Picker.fromScreen = "fueltype"
        Picker.pickerData = ["Select"]+fueltypeArray
        //        Picker.pickerIdData = sourceIdArray
        self.addChild(Picker)
        self.view.addSubview(Picker.view)
        Picker.pickerdelegate = self
    }
    
    @IBAction func varientBtnCliked(_ sender: Any)
    {
        self.view.endEditing(true)
        let Picker : PickerViewVC! = storyboard?.instantiateViewController(withIdentifier: "stbPickerViewVC") as? PickerViewVC
        Picker.fromScreen = "variant"
        Picker.pickerData = ["Select"]+varientArray
        //        Picker.pickerIdData = sourceIdArray
        self.addChild(Picker)
        self.view.addSubview(Picker.view)
        Picker.pickerdelegate = self
    }
    
    @IBAction func monthDropBtnCliked(_ sender: Any)
    {
        self.view.endEditing(true)
        let Picker : PickerViewVC! = storyboard?.instantiateViewController(withIdentifier: "stbPickerViewVC") as? PickerViewVC
        Picker.fromScreen = "month"
        Picker.pickerData = ["Select"]+monthArray
        //        Picker.pickerIdData = sourceIdArray
        self.addChild(Picker)
        self.view.addSubview(Picker.view)
        Picker.pickerdelegate = self
    }
    
    @IBAction func yearDropBtnCliked(_ sender: Any)
    {
        self.view.endEditing(true)
        let Picker : PickerViewVC! = storyboard?.instantiateViewController(withIdentifier: "stbPickerViewVC") as? PickerViewVC
        Picker.fromScreen = "year"
        Picker.pickerData = ["Select"]+yearArray
        //        Picker.pickerIdData = sourceIdArray
        self.addChild(Picker)
        self.view.addSubview(Picker.view)
        Picker.pickerdelegate = self
    }
    
    @IBAction func makemodelDropBtnCliked(_ sender: Any)
    {
        self.view.endEditing(true)
        let Picker : PickerViewVC! = storyboard?.instantiateViewController(withIdentifier: "stbPickerViewVC") as? PickerViewVC
        Picker.fromScreen = "makeModel"
        Picker.pickerData = ["Select"]+makemodelArray
        //        Picker.pickerIdData = sourceIdArray
        self.addChild(Picker)
        self.view.addSubview(Picker.view)
        Picker.pickerdelegate = self
    }
    
    @IBAction func rtodropBtnCliked(_ sender: Any)
    {
        self.view.endEditing(true)
        let Picker : PickerViewVC! = storyboard?.instantiateViewController(withIdentifier: "stbPickerViewVC") as? PickerViewVC
        Picker.fromScreen = "RTO"
        Picker.pickerData = ["Select"]+rtoArray
        //        Picker.pickerIdData = sourceIdArray
        self.addChild(Picker)
        self.view.addSubview(Picker.view)
        Picker.pickerdelegate = self
    }
    
    @IBAction func preinsurDropBtnCliked(_ sender: Any)
    {
        self.view.endEditing(true)
        let Picker : PickerViewVC! = storyboard?.instantiateViewController(withIdentifier: "stbPickerViewVC") as? PickerViewVC
        Picker.fromScreen = "presentinsurer"
        Picker.pickerData = presentinsurerArray
        //        Picker.pickerIdData = sourceIdArray
        self.addChild(Picker)
        self.view.addSubview(Picker.view)
        Picker.pickerdelegate = self
    }
    
    func getPickerDataValue(pickerSelectedData: String, fromScreen: String, pickerSelectedId: String) {
        switch fromScreen
        {
        case "insuranceSubtype":
            self.compreLbl.text = pickerSelectedData
//            self.sourceId = pickerSelectedId
            break
        case "fueltype":
            self.fuelTypLbl.text = pickerSelectedData
            //            self.sourceId = pickerSelectedId
            break
        case "variant":
            self.varientLbl.text = pickerSelectedData
            //            self.sourceId = pickerSelectedId
            break
        case "month":
            self.monthLbl.text = pickerSelectedData
            //            self.sourceId = pickerSelectedId
            break
        case "year":
            self.yearLbl.text = pickerSelectedData
            //            self.sourceId = pickerSelectedId
            break
        case "makeModel":
            self.makemodelTf.text = pickerSelectedData
            //            self.sourceId = pickerSelectedId
            break
        case "RTO":
            self.rtoTf.text = pickerSelectedData
            //            self.sourceId = pickerSelectedId
            break
        case "presentinsurer":
            self.prentinsurerLbl.text = pickerSelectedData
            //            self.sourceId = pickerSelectedId
            break
        default:
            break
        }
        
    }
   
    @IBAction func regdateBtnCliked(_ sender: Any)
    {
        self.view.endEditing(true)
        let DatePicker : DatePickerVC = storyboard?.instantiateViewController(withIdentifier: "stbDatePickerVC") as! DatePickerVC
        self.addChild(DatePicker)
        self.view.addSubview(DatePicker.view)
        DatePicker.dateDelegate = self
        date = "registration"
    }
    
    @IBAction func expirydateBtnçliked(_ sender: Any)
    {
        self.view.endEditing(true)
        let DatePicker : DatePickerVC = storyboard?.instantiateViewController(withIdentifier: "stbDatePickerVC") as! DatePickerVC
        self.addChild(DatePicker)
        self.view.addSubview(DatePicker.view)
        DatePicker.dateDelegate = self
        date = "expire"
    }
    
    func getDateData(currDate: String, fromScreen: String) {
        if(date == "registration")
        {
            regdateTf.text = currDate
            regdateTf.textColor = UIColor.black
        }else{
            expirydateTf.text = currDate
            expirydateTf.textColor = UIColor.black
        }
    }
    
    func getintData(indata: Int) {
        
    }
    
    @IBAction func yesBtnCliked(_ sender: Any)
    {
        let borderColrr = UIColor.init(red: 0/225.0, green: 125/225.0, blue: 213/225.0, alpha: 1)
        self.yesBtn.layer.cornerRadius=2.0;
        self.yesBtn.layer.borderWidth=2.0;
        self.yesBtn.layer.borderColor=borderColrr.cgColor;
        existingNCBView.isHidden = true
        exixtingNCBViewHeight.constant = 0
        let borderColrrr = UIColor.gray
        self.noBtn.layer.cornerRadius=2.0;
        self.noBtn.layer.borderWidth=2.0;
        self.noBtn.layer.borderColor=borderColrrr.cgColor;
    }
    
    @IBAction func noBtnCliked(_ sender: Any)
    {
        let borderColrr = UIColor.init(red: 0/225.0, green: 125/225.0, blue: 213/225.0, alpha: 1)
        self.noBtn.layer.cornerRadius=2.0;
        self.noBtn.layer.borderWidth=2.0;
        self.noBtn.layer.borderColor=borderColrr.cgColor;
        existingNCBView.isHidden = false
        exixtingNCBViewHeight.constant = 100
        let borderColrrr = UIColor.gray
        self.yesBtn.layer.cornerRadius=2.0;
        self.yesBtn.layer.borderWidth=2.0;
        self.yesBtn.layer.borderColor=borderColrrr.cgColor;
    }
    
    
    @IBAction func getQuotesBtnCliked(_ sender: Any)
    {
        
    }
    
    
    //---<APICALL>---
    func gvehicledetailsAPI()
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
        
        let params: [String: AnyObject] = ["ProductId":"1" as AnyObject]
        
        let url = "/api/vehicle-details"
        
        FinmartRestClient.sharedInstance.authorisedPost(url, parameters: params, onSuccess: { (userObject, metadata) in
            alertView.close()
            
            self.view.layoutIfNeeded()
            
            let jsonData = userObject as? NSArray
            print("jsonData=",jsonData!)
            let Make_Name = jsonData?.value(forKey: "Make_Name") as AnyObject
            print("Make_Name= ", Make_Name)
            let Model_Name = jsonData?.value(forKey: "Model_Name") as AnyObject
            print("Model_Name= ", Model_Name)
            self.makemodelArray = Make_Name as! [String]
            
        }, onError: { errorData in
            alertView.close()
            let snackbar = TTGSnackbar.init(message: errorData.errorMessage, duration: .long)
            snackbar.show()
        }, onForceUpgrade: {errorData in})
        
    }
    
    func getcityvehicleAPI()
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
        
        let params: [String: AnyObject] = [:]
        
        let url = "/api/get-city-vehicle"
        
        FinmartRestClient.sharedInstance.authorisedPost(url, parameters: params, onSuccess: { (userObject, metadata) in
            alertView.close()
            
            self.view.layoutIfNeeded()
            
            let jsonData = userObject as? NSArray
            print("jsonData=",jsonData!)
            let RTO_City = jsonData?.value(forKey: "RTO_City") as AnyObject
            print("RTO_City= ", RTO_City)
            let VehicleCity_RTOCode = jsonData?.value(forKey: "VehicleCity_RTOCode") as AnyObject
            print("VehicleCity_RTOCode= ", VehicleCity_RTOCode)
            self.rtoArray = RTO_City as! [String]
            
        }, onError: { errorData in
            alertView.close()
            let snackbar = TTGSnackbar.init(message: errorData.errorMessage, duration: .long)
            snackbar.show()
        }, onForceUpgrade: {errorData in})
        
    }
    

}

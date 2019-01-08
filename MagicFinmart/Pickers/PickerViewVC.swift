//
//  PickerViewVC.swift
//  MagicFinmart
//
//  Created by Admin on 12/12/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit

protocol getPickerDataDelegate
{
    func getPickerDataValue(pickerSelectedData: String, fromScreen: String, pickerSelectedId:String)
}

class PickerViewVC: UIViewController,UIPickerViewDataSource,UIPickerViewDelegate {
    
    var pickerdelegate : getPickerDataDelegate?
    var selectedOption = ""
    var selectedId = "0"
    var fromScreen = ""
    var txt = ""
    var pickerData = [String]()
    var pickerIdData = [String]()
    var selectedIndex2 = 0
    var selectedIndex = 0
    var selectedIndexpath = ""
    var selectedIndexpath2 = ""

    @IBOutlet weak var pickerView: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func pickerOkBtnCliked(_ sender: Any)
    {
        if(selectedOption == "")
        {
            let alert = UIAlertController(title: "Alert", message: "Please select from the below options", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }else{
            self.pickerdelegate?.getPickerDataValue(pickerSelectedData:selectedOption, fromScreen: fromScreen, pickerSelectedId: selectedId)
            if(txt != "")
            {
                self.willMove(toParent: nil)
                self.view.removeFromSuperview()
            }
            if(fromScreen == "source")
            {
                self.willMove(toParent: nil)
                self.view.removeFromSuperview()
                self.removeFromParent()
            }
            
        }
        
    }
    
    @IBAction func pickerCancelBtnCliked(_ sender: Any)
    {
        self.willMove(toParent: nil)
        self.view.removeFromSuperview()
        self.removeFromParent()
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        print("pickerData==",pickerData)
        
        if(fromScreen == "source")
        {
            return pickerData.count
        }
        else{
            //            return pickerData.count - 1
            return pickerData.count
        }
        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
    {
        var val : String = ""
        val = pickerData[row]
        
        return val
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        let val = pickerData[row]
       
        selectedOption = val
        
        if(fromScreen != "source")
        {
            let iD = pickerIdData[row]
            
            selectedId = iD
        }else{
            selectedId = "0"
        }
        
        
        if(fromScreen == "fromaddress" || fromScreen == "fromderivativetaxreturn" || fromScreen == "fromderivativebankstatement"){
            selectedIndex2 = row
            print("selectedIndex2=",selectedIndex2)
            selectedIndexpath2 = pickerData[row] 
            print("selectedIndexpath2=",selectedIndexpath2)
            
        }else{
            selectedIndex = row
            print("selectedIndex=",selectedIndex)
            selectedIndexpath = pickerData[row] 
            print("selectedIndexpath=",selectedIndexpath)
        }
        
        pickerView.reloadAllComponents()
        
    }
    
    
    
}

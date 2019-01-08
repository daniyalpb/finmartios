//
//  ViewController.swift
//  MagicFinmart
//
//  Created by Admin on 10/12/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate,SelectedDateDelegate, getPickerDataDelegate {
    
    let aTextField = ACFloatingTextfield()

    @IBOutlet weak var persnlBtn: UIButton!
    @IBOutlet weak var profBtn: UIButton!
    @IBOutlet weak var persnlTfView: UIView!
    @IBOutlet weak var persnlTfViewHeight: NSLayoutConstraint!//600
    @IBOutlet weak var profTfView: UIView!
    @IBOutlet weak var profTfViewHeight: NSLayoutConstraint!//380
    @IBOutlet weak var maleBtn: UIButton!
    @IBOutlet weak var femaleBtn: UIButton!
    //textfield
    @IBOutlet weak var firstNameTf: ACFloatingTextfield!
    @IBOutlet weak var lastNameTf: ACFloatingTextfield!
    @IBOutlet weak var dobTf: ACFloatingTextfield!
    @IBOutlet weak var mob1Tf: ACFloatingTextfield!
    @IBOutlet weak var mob2Tf: ACFloatingTextfield!
    @IBOutlet weak var emailTf: ACFloatingTextfield!
    @IBOutlet weak var confEmailTf: ACFloatingTextfield!
    @IBOutlet weak var pincodeTf: ACFloatingTextfield!
    @IBOutlet weak var cityTf: ACFloatingTextfield!
    @IBOutlet weak var stateTf: ACFloatingTextfield!
    @IBOutlet weak var referrCodeTf: ACFloatingTextfield!
    @IBOutlet weak var sourceLbl: UILabel!
    
    var sourceArray = ["Fin-Mart","Campaign sm","Campaign- Nochiket"]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        //hideViews
        persnlTfView.isHidden = true
        persnlTfViewHeight.constant = 0
        profTfView.isHidden = true
        profTfViewHeight.constant = 0
        //border
        let borderColor = UIColor.gray
        self.maleBtn.layer.cornerRadius=2.0;
        self.maleBtn.layer.borderWidth=2.0;
        self.maleBtn.layer.borderColor=borderColor.cgColor;
        self.femaleBtn.layer.cornerRadius=2.0;
        self.femaleBtn.layer.borderWidth=2.0;
        self.femaleBtn.layer.borderColor=borderColor.cgColor;
        //--<textField>--
        aTextField.delegate = self
        
    }
    
    @IBAction func regiBackBtnCliked(_ sender: Any)
    {
        self.willMove(toParent: nil)
        self.view.removeFromSuperview()
        self.removeFromParent()
    }
    
    func getRandomColor() -> UIColor{
        return UIColor.init(red: 0/255.0, green: 125/255.0, blue: 213/255.0, alpha: 1)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    //---<ButtonCliked>---
    @IBAction func persnlBtnCliked(_ sender: Any)
    {
        if(persnlBtn.tag == 1){
            persnlTfView.isHidden = false
            persnlTfViewHeight.constant = 600
            persnlBtn.tag = 0
        }
        else{
            persnlTfView.isHidden = true
            persnlTfViewHeight.constant = 0
            persnlBtn.tag = 1
        }
        
    }
    
    @IBAction func profBtnCliked(_ sender: Any)
    {
        if(profBtn.tag == 1){
            profTfView.isHidden = false
            profTfViewHeight.constant = 380
            profBtn.tag = 0
        }
        else{
            profTfView.isHidden = true
            profTfViewHeight.constant = 0
            profBtn.tag = 1
        }
        
    }
   
    @IBAction func dobBtnCliked(_ sender: Any)
    {
        self.view.endEditing(true)
        let DatePicker : DatePickerVC = storyboard?.instantiateViewController(withIdentifier: "stbDatePickerVC") as! DatePickerVC
        self.addChild(DatePicker)
        self.view.addSubview(DatePicker.view)
        DatePicker.dateDelegate = self
    }
    
    func getDateData(currDate: String, fromScreen: String) {
        print(currDate)
        dobTf.text = currDate
        dobTf.textColor = UIColor.black
    }
    
    @IBAction func maleBtnCliked(_ sender: Any)
    {
        let borderColor = UIColor.init(red: 0/255.0, green: 125/255.0, blue: 213/255.0, alpha: 1)
        self.maleBtn.layer.cornerRadius=2.0;
        self.maleBtn.layer.borderWidth=2.0;
        self.maleBtn.layer.borderColor=borderColor.cgColor;
        let borderColorr = UIColor.gray
        self.femaleBtn.layer.cornerRadius=2.0;
        self.femaleBtn.layer.borderWidth=2.0;
        self.femaleBtn.layer.borderColor = borderColorr.cgColor
        
    }
    
    @IBAction func femaleBtnCliked(_ sender: Any)
    {
        let borderColor = UIColor.init(red: 0/255.0, green: 125/255.0, blue: 213/255.0, alpha: 1)
        self.femaleBtn.layer.cornerRadius=2.0;
        self.femaleBtn.layer.borderWidth=2.0;
        self.femaleBtn.layer.borderColor=borderColor.cgColor;
        let borderColorr = UIColor.gray
        self.maleBtn.layer.cornerRadius=2.0;
        self.maleBtn.layer.borderWidth=2.0;
        self.maleBtn.layer.borderColor = borderColorr.cgColor
        
    }
    
    @IBAction func sourceLblBtnCliked(_ sender: Any)
    {
        self.view.endEditing(true)
        let Picker : PickerViewVC! = storyboard?.instantiateViewController(withIdentifier: "stbPickerViewVC") as? PickerViewVC
        Picker.fromScreen = "source"
        Picker.pickerData = sourceArray
        self.addChild(Picker)
        self.view.addSubview(Picker.view)
        Picker.pickerdelegate = self
    }
    
    func getPickerDataValue(pickerSelectedData: String, fromScreen: String, pickerSelectedId: String) {
        switch fromScreen
        {
        case "source":
            self.sourceLbl.text = pickerSelectedData
            break
      
        default:
            break
            
        }
        
    }
    
    @IBAction func lifedropDownBtn(_ sender: Any)
    {
        let multiselctionTV : multiselctionTVC! = storyboard?.instantiateViewController(withIdentifier: "stbmultiselctionTVC") as? multiselctionTVC
        self.addChild(multiselctionTV)
        self.view.addSubview(multiselctionTV.view)
    }
    
    @IBAction func genrldropDownBtn(_ sender: Any)
    {
        let multiselctionTV : multiselctionTVC! = storyboard?.instantiateViewController(withIdentifier: "stbmultiselctionTVC") as? multiselctionTVC
        self.addChild(multiselctionTV)
        self.view.addSubview(multiselctionTV.view)
    }
    
    @IBAction func healthdropDownBtn(_ sender: Any)
    {
        let multiselctionTV : multiselctionTVC! = storyboard?.instantiateViewController(withIdentifier: "stbmultiselctionTVC") as? multiselctionTVC
        self.addChild(multiselctionTV)
        self.view.addSubview(multiselctionTV.view)
    }
    
    
    @IBAction func submitBtnCliked(_ sender: Any)
    {
        
        
    }
    
    
}


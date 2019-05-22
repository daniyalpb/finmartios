//
//  homeLinputPageVC.swift
//  MagicFinmart
//
//  Created by Admin on 20/02/19.
//  Copyright © 2019 Ashwini. All rights reserved.
//

import UIKit

class homeLinputPageVC: UIViewController {

    @IBOutlet weak var homeinputView: UIView!
    @IBOutlet weak var maleBtn: UIButton!
    @IBOutlet weak var femaleBtn: UIButton!
    @IBOutlet weak var salariedBtn: UIButton!
    @IBOutlet weak var selfempBtn: UIButton!
    @IBOutlet weak var addoapplicantBtn: UIButton!
    @IBOutlet weak var addcoapplicantLbl: UILabel!
    @IBOutlet weak var addMaleBtn: UIButton!
    @IBOutlet weak var addFemaleBtn: UIButton!
    @IBOutlet weak var addsalariedBtn: UIButton!
    @IBOutlet weak var addselfempBtn: UIButton!
    @IBOutlet weak var selfemphiddnView: UIView!
    @IBOutlet weak var selfemphiddnViewHeight: NSLayoutConstraint!//110
    @IBOutlet weak var coApplicantView: UIView!
    @IBOutlet weak var coApplicantViewHeight: NSLayoutConstraint!//390
    
    var Gender = "M"
    var occupation = "Salaried"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let borderColor = UIColor.lightGray
        homeinputView.layer.cornerRadius=2.0;
        homeinputView.layer.borderWidth=1.0;
        homeinputView.layer.borderColor=borderColor.cgColor;
        coApplicantView.layer.cornerRadius=2.0;
        coApplicantView.layer.borderWidth=1.0;
        coApplicantView.layer.borderColor=borderColor.cgColor;
        
        btnColorChangeBlue(Btn:maleBtn)
        btnColorChangeGray(Btn:femaleBtn)
        btnColorChangeBlue(Btn:salariedBtn)
        btnColorChangeGray(Btn:selfempBtn)
        btnColorChangeGray(Btn:addMaleBtn)
        btnColorChangeBlue(Btn:addFemaleBtn)
        btnColorChangeBlue(Btn:addsalariedBtn)
        btnColorChangeGray(Btn:addselfempBtn)
        
        coApplicantView.isHidden = true
        coApplicantViewHeight.constant = 0
   
    }
    
    @IBAction func maleBtnCliked(_ sender: Any)
    {
        btnColorChangeBlue(Btn:maleBtn)
        btnColorChangeGray(Btn:femaleBtn)
        self.Gender = "M"
    }
    
    @IBAction func femaleBtnCliked(_ sender: Any)
    {
        btnColorChangeBlue(Btn:femaleBtn)
        btnColorChangeGray(Btn:maleBtn)
        self.Gender = "F"
    }
    
    @IBAction func salariedBtnCliked(_ sender: Any)
    {
        btnColorChangeBlue(Btn:salariedBtn)
        btnColorChangeGray(Btn:selfempBtn)
        occupation = "Salaried"
    }
    
    @IBAction func selfempBtnCliked(_ sender: Any)
    {
        btnColorChangeBlue(Btn:selfempBtn)
        btnColorChangeGray(Btn:salariedBtn)
//        occupation = "Salaried"
    }
    
    @IBAction func addcoapplicntBtnCliked(_ sender: Any)
    {
        if(coApplicantView.isHidden){
            let img = UIImage(named: "black-check-box-with-white-check (2).png")
            addoapplicantBtn.setImage(img , for: .normal)
            coApplicantView.isHidden = false
            coApplicantViewHeight.constant = 390
            addcoapplicantLbl.backgroundColor = UIColor.init(red: 0/225.0, green: 125/225.0, blue: 213/225.0, alpha: 1)
        }
        else{
            let img = UIImage(named: "check-box-empty.png")
            addoapplicantBtn.setImage(img , for: .normal)
            coApplicantView.isHidden = true
            coApplicantViewHeight.constant = 0
            addcoapplicantLbl.backgroundColor = UIColor.darkGray
        }
        
    }
    
    @IBAction func addMaleBtnCliked(_ sender: Any)
    {
        btnColorChangeBlue(Btn:addMaleBtn)
        btnColorChangeGray(Btn:addFemaleBtn)
    }
    
    @IBAction func addFemaleBtnCliked(_ sender: Any)
    {
        btnColorChangeBlue(Btn:addFemaleBtn)
        btnColorChangeGray(Btn:addMaleBtn)
    }
    
    @IBAction func addsalariedBtnCliked(_ sender: Any)
    {
        btnColorChangeBlue(Btn:addsalariedBtn)
        btnColorChangeGray(Btn:addselfempBtn)
    }
    
    @IBAction func addSelfempBtnCliked(_ sender: Any)
    {
        btnColorChangeBlue(Btn:addselfempBtn)
        btnColorChangeGray(Btn:addsalariedBtn)
    }
    
    
    
    //----<buttonColor>----
    func btnColorChangeBlue(Btn:UIButton)
    {
        let borderColr = UIColor.init(red: 0/225.0, green: 125/225.0, blue: 213/225.0, alpha: 1)
        Btn.layer.cornerRadius=2.0;
        Btn.layer.borderWidth=1.0;
        Btn.layer.borderColor=borderColr.cgColor;
        Btn.setTitleColor(UIColor.init(red: 0/225.0, green: 125/225.0, blue: 213/225.0, alpha: 1), for: UIControl.State.normal)
    }
    
    func btnColorChangeGray(Btn:UIButton)
    {
        let borderColr = UIColor.gray
        Btn.layer.cornerRadius=2.0;
        Btn.layer.borderWidth=1.0;
        Btn.layer.borderColor=borderColr.cgColor;
        Btn.setTitleColor(UIColor.gray, for: .normal)
    }
    
    
}

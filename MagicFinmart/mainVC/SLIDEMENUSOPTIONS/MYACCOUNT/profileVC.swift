//
//  profileVC.swift
//  MagicFinmart
//
//  Created by Admin on 21/12/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit

class profileVC: UIViewController,UITextFieldDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate {

    @IBOutlet weak var myaccountImgeView: UIImageView!
    @IBOutlet weak var myprofileView: UIView!
    @IBOutlet weak var myprofileViewHeight: NSLayoutConstraint!//200
    @IBOutlet weak var addressView: UIView!
    @IBOutlet weak var addressViewHeight: NSLayoutConstraint!//310
    @IBOutlet weak var bankdetailsView: UIView!
    @IBOutlet weak var bankdetailsViewHeight: NSLayoutConstraint!//410
    @IBOutlet weak var docdetailsView: UIView!
    @IBOutlet weak var docdetailsViewHeight: NSLayoutConstraint!//180
    @IBOutlet weak var pospinfoView: UIView!
    @IBOutlet weak var pospinfoViewHeight: NSLayoutConstraint!//200
    @IBOutlet weak var aboutme1View: UIView!
    @IBOutlet weak var aboutmeViewHeight: NSLayoutConstraint!//400
    @IBOutlet weak var aboutme2View: UIView!
    @IBOutlet weak var notisettingView: UIView!
    @IBOutlet weak var notisettingViewHeight: NSLayoutConstraint!//50
    
    @IBOutlet weak var designationTf: ACFloatingTextfield!
    @IBOutlet weak var mobilenotoshareTf: ACFloatingTextfield!
    @IBOutlet weak var emailtoshareTf: ACFloatingTextfield!
    @IBOutlet weak var address1Tf: ACFloatingTextfield!
    @IBOutlet weak var address2Tf: ACFloatingTextfield!
    @IBOutlet weak var address3Tf: ACFloatingTextfield!
    @IBOutlet weak var pincodeTf: ACFloatingTextfield!
    @IBOutlet weak var cityTf: ACFloatingTextfield!
    @IBOutlet weak var stateTf: ACFloatingTextfield!
    @IBOutlet weak var savingBtn: UIButton!
    @IBOutlet weak var currentBtn: UIButton!
    
    let aTextField = ACFloatingTextfield()
    var imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker.delegate = self

        //--<textField>--
        aTextField.delegate = self
        
        //--<cornerradius>--
//        myaccountImgeView.layer.cornerRadius = 64
        self.view.layoutIfNeeded()
        
        //--<borderView>--
        let borderColor = UIColor(red: 0/255, green: 51/255, blue: 91/255, alpha: 1.0)
        myprofileView.layer.borderWidth=1.0;
        myprofileView.layer.borderColor=borderColor.cgColor;
        addressView.layer.borderWidth=1.0;
        addressView.layer.borderColor=borderColor.cgColor;
        bankdetailsView.layer.borderWidth=1.0;
        bankdetailsView.layer.borderColor=borderColor.cgColor;
        docdetailsView.layer.borderWidth=1.0;
        docdetailsView.layer.borderColor=borderColor.cgColor;
        pospinfoView.layer.borderWidth=1.0;
        pospinfoView.layer.borderColor=borderColor.cgColor;
        aboutme1View.layer.borderWidth=1.0;
        aboutme1View.layer.borderColor=borderColor.cgColor;
        notisettingView.layer.borderWidth=1.0;
        notisettingView.layer.borderColor=borderColor.cgColor;
        let borderColor2 = UIColor.gray
        aboutme2View.layer.borderWidth=1.0;
        aboutme2View.layer.borderColor=borderColor2.cgColor;
        aboutme2View.layer.shadowColor=borderColor2.cgColor
        savingBtn.layer.cornerRadius=2.0;
        savingBtn.layer.borderWidth=2.0;
        savingBtn.layer.borderColor=borderColor2.cgColor;
        currentBtn.layer.cornerRadius=2.0;
        currentBtn.layer.borderWidth=2.0;
        currentBtn.layer.borderColor=borderColor2.cgColor;
        
        //--<viewHidden>--
        myprofileView.isHidden = true
        myprofileViewHeight.constant = 0
        addressView.isHidden = true
        addressViewHeight.constant = 0
        bankdetailsView.isHidden = true
        bankdetailsViewHeight.constant = 0
        docdetailsView.isHidden = true
        docdetailsViewHeight.constant = 0
        pospinfoView.isHidden = true
        pospinfoViewHeight.constant = 0
        aboutme1View.isHidden = true
        aboutmeViewHeight.constant = 0
        notisettingView.isHidden = true
        notisettingViewHeight.constant = 0
        
        
    }
    
    //--<roundImageView>--
    override func viewDidLayoutSubviews()
    {
        myaccountImgeView.layer.cornerRadius = myaccountImgeView.frame.size.width/2
        myaccountImgeView.clipsToBounds = true
    }
    
    //--<textfieldAnimation>--
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
    
    @IBAction func myaccountBackBtn(_ sender: Any)
    {
        let KYDrawer : KYDrawerController = self.storyboard?.instantiateViewController(withIdentifier: "stbKYDrawerController") as! KYDrawerController
        present(KYDrawer, animated: true, completion: nil)
    }
    
    //---<buttonsClicks>---
    @IBAction func myprofileBtnCliked(_ sender: Any)
    {
        myprofileView.isHidden = false
        myprofileViewHeight.constant = 200
        addressView.isHidden = true
        addressViewHeight.constant = 0
        bankdetailsView.isHidden = true
        bankdetailsViewHeight.constant = 0
        docdetailsView.isHidden = true
        docdetailsViewHeight.constant = 0
        pospinfoView.isHidden = true
        pospinfoViewHeight.constant = 0
        aboutme1View.isHidden = true
        aboutmeViewHeight.constant = 0
        notisettingView.isHidden = true
        notisettingViewHeight.constant = 0
    }
    
    @IBAction func addressBtnCliked(_ sender: Any)
    {
        myprofileView.isHidden = true
        myprofileViewHeight.constant = 0
        addressView.isHidden = false
        addressViewHeight.constant = 310
        bankdetailsView.isHidden = true
        bankdetailsViewHeight.constant = 0
        docdetailsView.isHidden = true
        docdetailsViewHeight.constant = 0
        pospinfoView.isHidden = true
        pospinfoViewHeight.constant = 0
        aboutme1View.isHidden = true
        aboutmeViewHeight.constant = 0
        notisettingView.isHidden = true
        notisettingViewHeight.constant = 0
    }
    
    @IBAction func bankdetailsBtnClick(_ sender: Any)
    {
        myprofileView.isHidden = true
        myprofileViewHeight.constant = 0
        addressView.isHidden = true
        addressViewHeight.constant = 0
        bankdetailsView.isHidden = false
        bankdetailsViewHeight.constant = 410
        docdetailsView.isHidden = true
        docdetailsViewHeight.constant = 0
        pospinfoView.isHidden = true
        pospinfoViewHeight.constant = 0
        aboutme1View.isHidden = true
        aboutmeViewHeight.constant = 0
        notisettingView.isHidden = true
        notisettingViewHeight.constant = 0
    }
    
    @IBAction func docuploadBtnCliked(_ sender: Any)
    {
        myprofileView.isHidden = true
        myprofileViewHeight.constant = 0
        addressView.isHidden = true
        addressViewHeight.constant = 0
        bankdetailsView.isHidden = true
        bankdetailsViewHeight.constant = 0
        docdetailsView.isHidden = false
        docdetailsViewHeight.constant = 180
        pospinfoView.isHidden = true
        pospinfoViewHeight.constant = 0
        aboutme1View.isHidden = true
        aboutmeViewHeight.constant = 0
        notisettingView.isHidden = true
        notisettingViewHeight.constant = 0
    }
    
    @IBAction func pospBtnClicked(_ sender: Any)
    {
        myprofileView.isHidden = true
        myprofileViewHeight.constant = 0
        addressView.isHidden = true
        addressViewHeight.constant = 0
        bankdetailsView.isHidden = true
        bankdetailsViewHeight.constant = 0
        docdetailsView.isHidden = true
        docdetailsViewHeight.constant = 0
        pospinfoView.isHidden = false
        pospinfoViewHeight.constant = 200
        aboutme1View.isHidden = true
        aboutmeViewHeight.constant = 0
        notisettingView.isHidden = true
        notisettingViewHeight.constant = 0
    }
    
    @IBAction func aboutmeBtnCliked(_ sender: Any)
    {
        myprofileView.isHidden = true
        myprofileViewHeight.constant = 0
        addressView.isHidden = true
        addressViewHeight.constant = 0
        bankdetailsView.isHidden = true
        bankdetailsViewHeight.constant = 0
        docdetailsView.isHidden = true
        docdetailsViewHeight.constant = 0
        pospinfoView.isHidden = true
        pospinfoViewHeight.constant = 0
        aboutme1View.isHidden = false
        aboutmeViewHeight.constant = 400
        notisettingView.isHidden = true
        notisettingViewHeight.constant = 0
    }
    
    @IBAction func notisettingBtnCliked(_ sender: Any)
    {
        myprofileView.isHidden = true
        myprofileViewHeight.constant = 0
        addressView.isHidden = true
        addressViewHeight.constant = 0
        bankdetailsView.isHidden = true
        bankdetailsViewHeight.constant = 0
        docdetailsView.isHidden = true
        docdetailsViewHeight.constant = 0
        pospinfoView.isHidden = true
        pospinfoViewHeight.constant = 0
        aboutme1View.isHidden = true
        aboutmeViewHeight.constant = 0
        notisettingView.isHidden = false
        notisettingViewHeight.constant = 50
    }
    
    //---<accessCamera>---
    @IBAction func cameraBtnCliked(_ sender: Any)
    {
        let alert = UIAlertController(title: "Choose Image", message: nil, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Camera", style: .default, handler: { _ in
            self.openCamera()
        }))
        
        alert.addAction(UIAlertAction(title: "Gallery", style: .default, handler: { _ in
            self.openGallary()
        }))
        
        alert.addAction(UIAlertAction.init(title: "Cancel", style: .cancel, handler: nil))
        
        /*If you want work actionsheet on ipad
         then you have to use popoverPresentationController to present the actionsheet,
         otherwise app will crash on iPad */
        switch UIDevice.current.userInterfaceIdiom {
        case .pad:
            alert.popoverPresentationController?.sourceView = sender as? UIView
            alert.popoverPresentationController?.sourceRect = (sender as AnyObject).bounds
            alert.popoverPresentationController?.permittedArrowDirections = .up
        default:
            break
        }
        
        self.present(alert, animated: true, completion: nil)
    }
    
    func openCamera()
    {
        if(UIImagePickerController .isSourceTypeAvailable(UIImagePickerController.SourceType.camera))
        {
            imagePicker.sourceType = UIImagePickerController.SourceType.camera
            imagePicker.allowsEditing = true
            self.present(imagePicker, animated: true, completion: nil)
        }
        else
        {
            let alert  = UIAlertController(title: "Warning", message: "You don't have camera", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func openGallary()
    {
        imagePicker.sourceType = UIImagePickerController.SourceType.photoLibrary
        imagePicker.allowsEditing = true
        self.present(imagePicker, animated: true, completion: nil)
    }
    
    
    //MARK: - ImagePicker delegate
    @objc func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        
        myaccountImgeView.image = pickedImage
//        myaccountImgeView.layer.cornerRadius = 64
        self.view.layoutIfNeeded()
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
        
    }

    
}

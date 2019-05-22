//
//  MotorInsuranceVC.swift
//  MagicFinmart
//
//  Created by Admin on 11/01/19.
//  Copyright © 2019 Ashwini. All rights reserved.
//

import UIKit

class MotorInsuranceVC: UIViewController {

    var CAPSMenu : CAPSPageMenu?
    
    @IBOutlet weak var motorinsuranceView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        capsMenu()
    }
    
    
    //-------<capsMenu>--------
    func capsMenu()
    {
        var controllerArray : [UIViewController] = []
        let storyboardName: String = "Main"
        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
        
        let controller1: motorInsurancecapsVC = storyboard.instantiateViewController(withIdentifier: "stbmotorInsurancecapsVC") as! motorInsurancecapsVC
        controller1.title = "INPUT"
        
        let controller2: motorInsurancecapsVC = storyboard.instantiateViewController(withIdentifier: "stbmotorInsurancecapsVC") as! motorInsurancecapsVC
        controller2.title = "QUOTE"
        
        let controller3: motorInsurancecapsVC = storyboard.instantiateViewController(withIdentifier: "stbmotorInsurancecapsVC") as! motorInsurancecapsVC
        controller2.title = "APPLY"
        
        controllerArray = [controller1, controller2, controller3]
        
        let parameters : [CAPSPageMenuOption] = [
            
            .scrollMenuBackgroundColor(UIColor(red: CGFloat(0.00 / 255.0), green: CGFloat(51.0 / 255.0), blue: CGFloat(91.0 / 255.0), alpha: CGFloat(1))),
            .viewBackgroundColor(UIColor(red: CGFloat(31.00 / 255.0), green: CGFloat(74.0 / 255.0), blue: CGFloat(132.0 / 255.0), alpha: CGFloat(1))),
            .selectionIndicatorColor(UIColor.white),
            
            .addBottomMenuHairline(true),
            .centerMenuItems(true),
            .bottomMenuHairlineColor(UIColor.white),
            .menuItemFont(UIFont.init(name: "HelveticaNeue", size: 15)!),
            .menuHeight(50.0),
            .menuItemWidth(0),
            .selectedMenuItemLabelColor(UIColor.white),
            .unselectedMenuItemLabelColor(UIColor.white),
            .selectionIndicatorHeight(4),
            .useMenuLikeSegmentedControl(true),
            .menuItemWidthBasedOnTitleTextWidth(false),
            .hideTopMenuBar(false)
        ]
        
        
        self.CAPSMenu = CAPSPageMenu(viewControllers: controllerArray, frame: CGRect(x: 0.0, y: 0.0, width: self.motorinsuranceView.frame.size.width, height: self.motorinsuranceView.frame.size.height), pageMenuOptions: parameters)
        
        self.motorinsuranceView.addSubview((self.CAPSMenu?.view)!)
        
    }
    //-------<end capsMenu>--------
    

    @IBAction func backBtnCliked(_ sender: Any)
    {
        let KYDrawer : KYDrawerController = self.storyboard?.instantiateViewController(withIdentifier: "stbKYDrawerController") as! KYDrawerController
        present(KYDrawer, animated: true, completion: nil)
    }
    
}

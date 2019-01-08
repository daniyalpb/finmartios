//
//  PendingcasesVC.swift
//  MagicFinmart
//
//  Created by Admin on 14/12/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit

class PendingcasesVC: UIViewController {

    var CAPSMenu : CAPSPageMenu?
    
    @IBOutlet weak var pendingcasesView: UIView!
    
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
        
        let controller1: pendingcasescapsVC = storyboard.instantiateViewController(withIdentifier: "stbpendingcasescapsVC") as! pendingcasescapsVC
        controller1.title = "INSURANCE"
        
        
        let controller2: pendingcasescapsVC = storyboard.instantiateViewController(withIdentifier: "stbpendingcasescapsVC") as! pendingcasescapsVC
        controller2.title = "LOAN"
        
        controllerArray = [controller1, controller2]
        
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
        
        
        self.CAPSMenu = CAPSPageMenu(viewControllers: controllerArray, frame: CGRect(x: 0.0, y: 0.0, width: self.pendingcasesView.frame.size.width, height: self.pendingcasesView.frame.size.height), pageMenuOptions: parameters)
        
        self.pendingcasesView.addSubview((self.CAPSMenu?.view)!)
        
        
    }
    //-------<end capsMenu>--------
    

    @IBAction func pendingcasesBackBtn(_ sender: Any)
    {
        let MainfinMart : MainfinMartVC = self.storyboard?.instantiateViewController(withIdentifier: "stbMainfinMartVC") as! MainfinMartVC
        self.addChild(MainfinMart)
        self.view.addSubview(MainfinMart.view)
    }
    
}

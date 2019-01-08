//
//  DatePickerVC.swift
//  MagicFinmart
//
//  Created by Admin on 12/12/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit

protocol SelectedDateDelegate
{
    func getDateData(currDate: String, fromScreen: String)
}


class DatePickerVC: UIViewController {
    
    var dateDelegate : SelectedDateDelegate?
    var fromScreen = ""

    @IBOutlet weak var datePicker: UIDatePicker!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func dateOkBtnCliked(_ sender: Any)
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        let curDate = dateFormatter.string(from: datePicker.date)
        print("curDate== ", curDate)
        if(curDate != "")
        {
            self.dateDelegate?.getDateData(currDate: curDate, fromScreen: fromScreen)
        }
        self.willMove(toParent: nil)
        self.view.removeFromSuperview()
        self.removeFromParent()
    }
    
    @IBAction func dateCancelBtnCliked(_ sender: Any)
    {
        self.willMove(toParent: nil)
        self.view.removeFromSuperview()
        self.removeFromParent()
    }
    
}

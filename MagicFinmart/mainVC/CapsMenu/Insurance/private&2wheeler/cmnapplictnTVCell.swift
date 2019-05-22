//
//  cmnapplictnTVCell.swift
//  MagicFinmart
//
//  Created by Admin on 11/02/19.
//  Copyright © 2019 Ashwini. All rights reserved.
//

import UIKit

//1. delegate method
protocol appcellbtnDelegate: AnyObject {
    func btnoptionTapped(cell: cmnapplictnTVCell)
}

class cmnapplictnTVCell: UITableViewCell {

    //2.
    weak var delegate: appcellbtnDelegate?
    
    @IBOutlet weak var appliCellView: UIView!
    @IBOutlet weak var titleView: UIView!
    @IBOutlet weak var cellImgView: UIView!
    @IBOutlet weak var appNumberView: UIView!
    @IBOutlet weak var vehicleNoView: UIView!
    @IBOutlet weak var titleNameLbl: UILabel!
    @IBOutlet weak var titlelstNameLbl: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var appNoLbl: UILabel!
    @IBOutlet weak var vehicleNoLbl: UILabel!
    @IBOutlet weak var appDateLbl: UILabel!
    @IBOutlet weak var appstatusPerLbl: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let borderColor = UIColor.lightGray
        appliCellView.layer.cornerRadius=2;
        appliCellView.layer.borderWidth=1.0;
        appliCellView.layer.shadowColor=borderColor.cgColor;
        appliCellView.layer.borderColor=borderColor.cgColor;
        titleView.layer.cornerRadius=2;
        titleView.layer.borderWidth=0.5;
        titleView.layer.borderColor=borderColor.cgColor;
        cellImgView.layer.cornerRadius=2;
        cellImgView.layer.borderWidth=0.5;
        cellImgView.layer.borderColor=borderColor.cgColor;
        appNumberView.layer.cornerRadius=2;
        appNumberView.layer.borderWidth=0.5;
        appNumberView.layer.borderColor=borderColor.cgColor;
        vehicleNoView.layer.cornerRadius=2;
        vehicleNoView.layer.borderWidth=0.5;
        vehicleNoView.layer.borderColor=borderColor.cgColor;
        
    }
    
    
    @IBAction func appliOptionBtnCliked(_ sender: Any)
    {
        //4. call delegate method
        //check delegate is not nil with `?`
        delegate?.btnoptionTapped(cell: self)
    }
    


}

//
//  commonApplictnTVCell.swift
//  MagicFinmart
//
//  Created by Admin on 28/02/19.
//  Copyright © 2019 Ashwini. All rights reserved.
//

import UIKit

class commonApplictnTVCell: UITableViewCell {

    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var titleView: UIView!
    @IBOutlet weak var cellImgView: UIView!
    @IBOutlet weak var loanamountView: UIView!
    @IBOutlet weak var appnmberView: UIView!
    @IBOutlet weak var aimgView: UIImageView!
    @IBOutlet weak var firstNLbl: UILabel!
    @IBOutlet weak var lastNLbl: UILabel!
    @IBOutlet weak var loanAmountLbl: UILabel!
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var progressLbl: UILabel!
    @IBOutlet weak var appNumLbl: UILabel!
    @IBOutlet weak var appDateLbl: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let borderColor = UIColor.lightGray
        cellView.layer.cornerRadius=2;
        cellView.layer.borderWidth=1.0;
        cellView.layer.shadowColor=borderColor.cgColor;
        cellView.layer.borderColor=borderColor.cgColor;
        titleView.layer.cornerRadius=2;
        titleView.layer.borderWidth=0.5;
        titleView.layer.borderColor=borderColor.cgColor;
        cellImgView.layer.cornerRadius=2;
        cellImgView.layer.borderWidth=0.5;
        cellImgView.layer.borderColor=borderColor.cgColor;
        loanamountView.layer.cornerRadius=2;
        loanamountView.layer.borderWidth=0.5;
        loanamountView.layer.borderColor=borderColor.cgColor;
        appnmberView.layer.cornerRadius=2;
        appnmberView.layer.borderWidth=0.5;
        appnmberView.layer.borderColor=borderColor.cgColor;
        
    }

    

}

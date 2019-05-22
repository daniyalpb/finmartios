//
//  reqpolicyTVCell.swift
//  MagicFinmart
//
//  Created by Admin on 04/02/19.
//  Copyright © 2019 Ashwini. All rights reserved.
//

import UIKit

class reqpolicyTVCell: UITableViewCell {

    @IBOutlet weak var reqpolicycellView: UIView!
    @IBOutlet weak var cellLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let borderColor = UIColor.lightGray
        reqpolicycellView.layer.cornerRadius=2.0;
        reqpolicycellView.layer.borderWidth=1.0;
        reqpolicycellView.layer.borderColor=borderColor.cgColor;    }

  
}

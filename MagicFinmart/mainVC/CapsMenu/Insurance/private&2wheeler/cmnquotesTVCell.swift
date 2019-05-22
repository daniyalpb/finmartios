//
//  cmnquotesTVCell.swift
//  MagicFinmart
//
//  Created by Admin on 08/02/19.
//  Copyright © 2019 Ashwini. All rights reserved.
//

import UIKit

//1. delegate method
protocol cellbtnDelegate: AnyObject {
    func btnoptionTapped(cell: cmnquotesTVCell)
}
protocol cellDELETEDelegate: AnyObject {
    func btnDELETETapped(cell: cmnquotesTVCell)
}

class cmnquotesTVCell: UITableViewCell {

    //2.
    weak var delegate: cellbtnDelegate?
    weak var deletedelegate: cellDELETEDelegate?
    
    @IBOutlet weak var qName1: UILabel!
    @IBOutlet weak var qlstName1: UILabel!
    @IBOutlet weak var qName2: UILabel!
    @IBOutlet weak var crnNoLbl: UILabel!
    @IBOutlet weak var qdateLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBAction func optionBtnCliked(_ sender: Any)
    {
        //4. call delegate method
        //check delegate is not nil with `?`
        delegate?.btnoptionTapped(cell: self)
        deletedelegate?.btnDELETETapped(cell: self)
    }
    
}

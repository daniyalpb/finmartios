//
//  AttendanceModel.swift
//  OutdoorAttendance
//
//  Created by Altamash on 16/07/17.
//  Copyright © 2017 Altamash. All rights reserved.
//

import UIKit

class AttendanceModel: NSObject {
    var date: String
    var type: String
    var location: String
    var city : String
    
    init(date: String, type: String,location: String,city : String) {
        self.date = date
        self.type = type
        self.location=location
        self.city = city
    }

}

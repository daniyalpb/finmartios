//
//  LoginAPI.swift
//  OutdoorAttendance
//
//  Created by Altamash on 14/07/17.
//  Copyright © 2017 Altamash. All rights reserved.
//

import UIKit

class LoginAPI: NSObject {
    
    static let LOGIN_BASE_ENDPOINT : String = "/AttendanceDetails.svc"
    static let USERS_LOGIN : String = LOGIN_BASE_ENDPOINT+"/Login"
    
    static let USERS_ATTENDANCE_REGISTRATION : String = LOGIN_BASE_ENDPOINT+"/EmployeeSwipeDetails"
    
    static let USERS_SWIPE_DETAIL : String = LOGIN_BASE_ENDPOINT+"/EmployeeSwipeReport"

    static let USERS_DISPLAY_LOCATION : String = LOGIN_BASE_ENDPOINT+"/GetGeoLocation"
    
    static let USERS_ATTENDANCE_DATA : String = LOGIN_BASE_ENDPOINT+"/dsplyRBAttendanceData"
    static let USERS_FORGOT_PASSWORD : String = LOGIN_BASE_ENDPOINT+"/Forgotpassword"
    
    static let USERS_UPDATE_EMPLOYEE_PROFILE : String = LOGIN_BASE_ENDPOINT+"/UpdateEmployeeProfile"
    static let USERS_CHANGE_PASSSWORD : String = LOGIN_BASE_ENDPOINT+"/ChangePassword"
    
    
    static let USERS_ATTENDANCE_EMPLOYEE_SWIPE : String = LOGIN_BASE_ENDPOINT+"/EmployeeSwipe"

    static let USERS_ATTENDANCE_EMPLOYEE_SWIPE_OUTDOOR : String = LOGIN_BASE_ENDPOINT+"/EmployeeOutdoorSwipe"

    
    //Upload keys
    static let USERS_POST_KEY_TOKENID : String = "tokenId"
    static let USERS_POST_KEY_PASSWORD : String = "pwd"
    static let USERS_POST_KEY_DEVID : String = "devId"
    static let USERS_POST_KEY_CODE : String = "uid"
    
    static let USERS_POST_KEY_EMPCODE : String = "empcode"
    static let USERS_POST_KEY_EMPCODE_CAPITAL : String = "empCode"

    
    static let USERS_POST_KEY_ENTRYTYPE : String = "entrytype"
    
    static let USERS_POST_KEY_ALT : String = "lat"
    static let USERS_POST_KEY_LNG : String = "lng"
    
    static let POST_FROM_DATE : String = "fromdate"

    static let POST_TO_DATE : String = "todate"
    
    static let POST_HRMS_ID : String = "hrmsid"

    
    

}

//
//  ResponseMetadata.swift
//  beldara
//
//  Created by Daniyal Shaikh on 18/08/18.
//  Copyright © 2018 Daniyal Shaikh. All rights reserved.
//

import Foundation

class ResponseMetadata
{
    enum ResponseType{
        case success
        case successWithSoftUpgrade
        case errorWithForceUpgrade //Incase clean up is required
        case errorWithServerResponse //Something else went wrong (eg. item out of stock)
        case errorNoServerResponse //You may want to throw no Internet
    }
    let responseType : ResponseType
    let metadata : AnyObject?
    let error : NSError?
    let errorMessage:String
    var errorCode: Int?
    
    init(type: ResponseType,data: AnyObject?)
    {
        self.responseType = type
        self.metadata = data
        self.error = nil
        self.errorMessage = ""
    }
    
    init(type: ResponseType, data: AnyObject?,error:NSError?,errorMessage:String)
    {
        self.responseType = type
        self.metadata = data
        self.error = error
        self.errorMessage = errorMessage
    }
    
    init(type: ResponseType, data: AnyObject?, error: NSError?, errorMessage: String, errorCode: Int?)
    {
        self.responseType = type
        self.metadata = data
        self.error = error
        self.errorMessage = errorMessage
        self.errorCode = errorCode
    }
    
    convenience init(type: ResponseType)
    {
        self.init(type: type, data: nil)
    }
    
    //Function to generate a local nserror
    class func getError(_ type:ResponseMetadata.ResponseType)-> ResponseMetadata{
        var details:[AnyHashable : Any] = [AnyHashable : Any]()
        details[NSLocalizedDescriptionKey] = "Looks like something is wrong.\nPlease try after some time"
        //details.setValue("Looks like something is wrong.\nPlease try after some time", forKey: NSLocalizedDescriptionKey)
        let error = NSError(domain: "Local", code: 200, userInfo: details as! [String : Any])
        let responceMetaData = ResponseMetadata(type: type, data: nil,error:error,errorMessage: error.localizedDescription)
        return responceMetaData
    }
}

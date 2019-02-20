//
//  ConvertDataToObjectClass.swift
//  URLMaster
//
//  Created by Abraham VG on 20/02/19.
//  Copyright © 2019 TechTonic. All rights reserved.
//

import Foundation

class ConvertDataToObjectClass {
    
    //MARK: func To make JSONSerialization objects
    class func convertDataToObject(_ data: Data, completionBlk: @escaping(Results<AnyObject>) -> ()) {
        
        var parsedResult: AnyObject! = nil
        
        do {
            parsedResult = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as AnyObject
            completionBlk(.Success(parsedResult))
        } catch let error  {
            completionBlk(.Error(error.localizedDescription))
        }
        
        
    }
    
    
}

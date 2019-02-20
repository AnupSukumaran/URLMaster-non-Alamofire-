//
//  URLResponseChecker.swift
//  URLMaster
//
//  Created by Abraham VG on 20/02/19.
//  Copyright © 2019 TechTonic. All rights reserved.
//

import Foundation

class URLResponseChecker: NSObject {
    
   static func checkResponseStatus(_ response: URLResponse?) -> Bool {
    
    
        guard let statusCode = (response as? HTTPURLResponse)?.statusCode, statusCode >= 200 && statusCode <= 299 else {
            print("StatusCode = (\(String(describing: (response as? HTTPURLResponse))))")
            return false
        }
        
        return true
    }
    
    
}

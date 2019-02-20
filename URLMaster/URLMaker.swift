//
//  URLMaker.swift
//  URLMaster
//
//  Created by Abraham VG on 20/02/19.
//  Copyright © 2019 TechTonic. All rights reserved.
//

import Foundation


class URLMaker {
    
    
    func URLFromParameters(postMethod: Bool, _ parameters: JSON, pathExtension: String?) -> URL {
        
        var components = URLComponents()
        components.scheme = Constants.APIScheme
        components.host = Constants.APIHost
        
        if postMethod {
            components.path = Constants.APIPathforPost + (pathExtension ?? "")
        } else {
            components.path = Constants.APIPathforGet + (pathExtension ?? "")
        }
        
        components.queryItems = [URLQueryItem]()
        
        for (key, value) in parameters {
            let queryItem = URLQueryItem(name: key, value: "\(value)")
            components.queryItems!.append(queryItem)
        }
        
        return components.url!
    }

}

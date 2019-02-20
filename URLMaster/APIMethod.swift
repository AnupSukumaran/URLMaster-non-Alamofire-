//
//  APIMethod.swift
//  URLMaster
//
//  Created by Abraham VG on 20/02/19.
//  Copyright © 2019 TechTonic. All rights reserved.
//

import Foundation

class APIMethod: NSObject {
    
    //MARK: func For Post Method
   class func postMethod( request: URLRequest, parameters: JSON, completionBlk: @escaping(Results<AnyObject>) -> ()) -> URLSessionDataTask? {
        
        
        var request = request
        request.httpMethod = "POST"
        guard let httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: []) else {return nil}
    
        request.httpBody = httpBody
        
        let task = GloVar.session.dataTask(with: request) { (data, response, error) in
            
            guard error == nil else {print("Error 😩");return}
            guard let data = data else {print("data😩");return}
            
            guard let statusCode = (response as? HTTPURLResponse)?.statusCode, statusCode >= 200 && statusCode <= 299 else {
                completionBlk(.Error("Error :( status code -> \(String(describing: (response as? HTTPURLResponse)?.statusCode))"))
                return
            }
            
            let range = Range(5..<data.count)
            let newData = data.subdata(in: range)
            
            ConvertDataToObjectClass.convertDataToObject(newData, completionBlk: completionBlk)
            
        }
    
        task.resume()
        
        return task
    }
}

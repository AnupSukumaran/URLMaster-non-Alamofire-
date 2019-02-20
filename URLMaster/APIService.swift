//
//  APIService.swift
//  URLMaster
//
//  Created by Abraham VG on 20/02/19.
//  Copyright © 2019 TechTonic. All rights reserved.
//

import Foundation

class  APIService: NSObject {
    
    let urlMaker = URLMaker()
    //let responseCheck = URLResponseChecker()
    //MARK:
//    func checkResponseStatus(_ response: URLResponse?) -> Bool {
//        guard let statusCode = (response as? HTTPURLResponse)?.statusCode, statusCode >= 200 && statusCode <= 299 else {
//            print("StatusCode = (\(String(describing: (response as? HTTPURLResponse))))")
//            return false
//        }
//
//        return true
//    }

    func getAPI() {
        
        let url = urlMaker.URLFromParameters(postMethod: false, [:], pathExtension: nil)
        print("URL123 = \(url)")

        
        let session = URLSession.shared
        session.dataTask(with: url) { (data, response, error) in
            
            guard URLResponseChecker.checkResponseStatus(response) else {return}
    
            guard let statusCode = (response as? HTTPURLResponse)?.statusCode, statusCode >= 200 && statusCode <= 299 else {
                print("StatusCode = (\(String(describing: (response as? HTTPURLResponse))))")
                return
            }
      
            if let datas = data {
                do{
                    let json = try JSONSerialization.jsonObject(with: datas, options: [])
                    print("json = \(json)")
                }catch{
                    print("Error= \(error.localizedDescription)")
                }
            }
            
            
            
            }.resume()
    }
    
    
    
    func postAPI() {
        
        
        let parameters = ["username":"AnupTechTonic","tweets":"HELLOOO"] as JSON
        
        let url = urlMaker.URLFromParameters(postMethod: true, [:], pathExtension: nil)
        print("URL@postAPI = \(url)")
        //guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let _ = APIMethod.postMethod(request: request, parameters: parameters) { (response) in
            switch response {
            case .Success(let data):
                print("Data = \(data)")
                
            case .Error(let error):
                 print("Error = \(error)")
            }
           
        }
        
        
        
        
//        guard let httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: []) else {return}
//
//        request.httpBody = httpBody
//        let session = URLSession.shared
//        session.dataTask(with: request) { (data, response, error) in
//
//            guard URLResponseChecker.checkResponseStatus(response) else {return}
//
//            if let data = data {
//                do {
//                    let json = try JSONSerialization.jsonObject(with: data, options: [])
//                    print("JSON = \(json)")
//                } catch {
//                    print("Error = \(error.localizedDescription)")
//                }
//            }
//
//        }.resume()
    }
    
    
    
}

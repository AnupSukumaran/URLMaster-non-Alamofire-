//
//  ViewModel.swift
//  URLMaster
//
//  Created by Abraham VG on 20/02/19.
//  Copyright © 2019 TechTonic. All rights reserved.
//

import Alamofire

class ViewModel: NSObject {
    
    var apiService = APIService()
    
    //MARK:
    func getActionMethod() {
        
        apiService.getAPI()
        
    }
    
    
    func postActionMethod() {
        
         apiService.postAPI()
//        let parameters = ["username":"AnupTechTonic","tweets":"HELLOOO"]
//
//        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return }
//
//        var request = URLRequest(url: url)
//        request.httpMethod = "POST"
//
//        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
//        guard let httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: []) else {return}
//
//        request.httpBody = httpBody
//
//        let session = URLSession.shared
//        session.dataTask(with: request) { (data, response, error) in
//            if let response = response {
//                print("ResponsPost = \(response)")
//            }
//
//            if let data = data {
//                do {
//                    let json = try JSONSerialization.jsonObject(with: data, options: [])
//                    print("JSON = \(json)")
//                } catch {
//                    print("Error = \(error.localizedDescription)")
//                }
//            }
//            }.resume()
    }
    
    
    //MARK:
    func AlamofireGet() {
        let url = "https://jsonplaceholder.typicode.com/users"
        
        Alamofire.request(url, method: .get, parameters: ["":""]).validate().responseJSON { (response) in
            print("response = \(response)")
            
            switch response.result{
            case .success(let data):
                let json = data as AnyObject
                print("JSON = \(json)")
            case .failure(let error):
                print("Error = \(error.localizedDescription)")
            }
            
            
        }
    }
    
    
    //MARK:
    func AlamofirePost() {
        let params = ["username":"AnupTechTonic","tweets":"HELLOOO"]
        let url = "https://jsonplaceholder.typicode.com/posts"
        
        Alamofire.request(url, method: .post, parameters: params).validate().responseJSON { (response) in
            print("response = \(response)")
            
            switch response.result{
            case .success(let data):
                let json = data as AnyObject
                print("JSON = \(json)")
            case .failure(let error):
                print("Error = \(error.localizedDescription)")
            }
        }
    }
    
    
    
}

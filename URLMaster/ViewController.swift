//
//  ViewController.swift
//  URLMaster
//
//  Created by Sukumar Anup Sukumaran on 06/06/18.
//  Copyright © 2018 TechTonic. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    @IBAction func GetAction(_ sender: Any) {
        
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else { return }
        
        let session = URLSession.shared
        session.dataTask(with: url) { (data, response, error) in
            if let response = response {
                print("response = \(response)")
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
    
    @IBAction func postAction(_ sender: Any) {
        
        let parameters = ["username":"AnupTechTonic","tweets":"HELLOOO"]
        
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        guard let httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: []) else {return}
        
        request.httpBody = httpBody
        
         let session = URLSession.shared
        session.dataTask(with: request) { (data, response, error) in
            if let response = response {
                print("ResponsPost = \(response)")
            }
            
            if let data = data {
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    print("JSON = \(json)")
                } catch {
                    print("Error = \(error.localizedDescription)")
                }
            }
        }.resume()
        
    }
    
    
    @IBAction func AlamofireGet(_ sender: Any) {
        
//         guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else { return }
        
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
    
    
    @IBAction func AlamofirePost(_ sender: Any) {
        
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
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }


}


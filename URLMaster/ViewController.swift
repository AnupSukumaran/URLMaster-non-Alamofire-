//
//  ViewController.swift
//  URLMaster
//
//  Created by Sukumar Anup Sukumaran on 06/06/18.
//  Copyright © 2018 TechTonic. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    var viewModel = ViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    @IBAction func GetAction(_ sender: Any) {
        
        viewModel.getActionMethod()
        

        
    }
    
    
    
    @IBAction func postAction(_ sender: Any) {
        
       viewModel.postActionMethod()
        
    }
    
    //MARK:
    
    
    
    @IBAction func AlamofireGet(_ sender: Any) {
        
        viewModel.AlamofireGet()

    }
    
    
    
    @IBAction func AlamofirePost(_ sender: Any) {
        
        viewModel.AlamofirePost()
        
    }
    
   
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }


}


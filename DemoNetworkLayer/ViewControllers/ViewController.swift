//
//  ViewController.swift
//  DemoNetworkLayer
//
//  Created by Paul on 2022/3/15.
//

import UIKit

class ViewController: UIViewController {

    var manager:RestManager!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        manager = RestManager()
        let resultRecordClosure:(APIResponse.List<Record>?,Error?)->Void = { response, error in
            
            guard let error = error,response == nil else {
                

                print("[paul] res->",response?.records.first)
                return

            }
            print("[paul] error->",error.localizedDescription)
            
        }
        
        let resultMemberClosure:(APIResponse.List<Member>?,Error?)->Void = { response, error in
            
            guard let error = error,response == nil else {
                

                print("[paul] res->",response?.records.first)
                return

            }
            print("[paul] error->",error.localizedDescription)
            
        }
        
        manager.requestJSONDataByURL(.record, resType: APIResponse.List<Record>.self, completion: resultRecordClosure)
        
        let member = Member(name: "test", phone: "0921123321", mail: "gg@gg.gg", point: 0)
        let postData = APIRequest.Create(records: [APIRequest.Create.Record(fields: member)])
        
        
        
        manager.requestWAPI(.member, bodyParameters: postData, resType: APIResponse.List<Member>.self,completion: resultMemberClosure)
    }


}


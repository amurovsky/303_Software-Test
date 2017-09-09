//
//  APIClient.swift
//  Test
//
//  Created by Esteban Garibay on 9/8/17.
//  Copyright © 2017 Esteban garibay. All rights reserved.
//

import Foundation

typealias JSON = [String:Any]
typealias responseCompletion = (_ json: [JSON]?, _ success: Bool) -> Void

class APICLient {
    
    public enum Path {
        case getList
        
        func getUrl() -> String {
            let baseURl = "http://www.filltext.com/"
            switch self {
            case .getList:
                return "\(baseURl)?rows=100&fname=%7BfirstName%7D&lname=%7BlastName%7D&city=%7Bcity%7D&pretty=true"
            }
        }
    }
    
    
    static func request(path: Path, completion: @escaping responseCompletion) {
    
        let session = URLSession.shared
        let url = URL(string: path.getUrl())
        
        session.dataTask(with: url!) { (data, response, error) in
            
            if let error = error {
                print(error)
                completion(nil, false)
            }
            
            if let data = data {
                let json = try! JSONSerialization.jsonObject(with: data, options: []) as? [JSON]
                completion(json, true)
            }
            
        }.resume()
    }
}

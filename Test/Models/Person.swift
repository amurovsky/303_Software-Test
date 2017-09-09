//
//  People.swift
//  Test
//
//  Created by Esteban Garibay on 08/09/17.
//  Copyright © 2017 Esteban garibay. All rights reserved.
//

import Foundation

public class Person: NSObject {
    
    // MARK: Keys
    private struct keys {
        static let firstName = "fname"
        static let lastName = "lname"
        static let city = "city"
    }
    
    // MARK: Properties
    public var firstName: String?
    public var lastName: String?
    public var city: String?
    
    public required init?(json: [String:Any]) {
        firstName = json[keys.firstName]as? String
        lastName = json[keys.lastName]as? String
        city = json[keys.city]as? String
    }
    
    override init() {}
    
    class func modelsFromdicArray(array: [JSON]) -> [Person] {
        var models:[Person] = []
        for item in array {
            models.append(self.init(json: item )!)
        }
        return models
    }

}

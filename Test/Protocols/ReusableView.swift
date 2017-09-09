//
//  ReusableView.swift
//  Test
//
//  Created by Esteban Garibay on 08/09/17.
//  Copyright © 2017 Esteban garibay. All rights reserved.
//

import UIKit

protocol ReusableView: class {}

extension ReusableView where Self: UIView {
    
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}

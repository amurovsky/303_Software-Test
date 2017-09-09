//
//  NibLoadableView.swift
//  Test
//
//  Created by Esteban Garibay on 08/09/17.
//  Copyright © 2017 Esteban garibay. All rights reserved.
//

import UIKit

protocol NibLoadableView: class {}

extension NibLoadableView where Self: UIView {
    static var nibName: String {
        return String(describing: self)
    }
}


protocol StoryBoardInstantiable {}

extension StoryBoardInstantiable where Self: UIStoryboard {
    
}


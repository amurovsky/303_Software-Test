//
//  UITableView+Ext.swift
//  Test
//
//  Created by Esteban Garibay on 08/09/17.
//  Copyright © 2017 Esteban garibay. All rights reserved.
//

import UIKit

extension UITableView {
    
    func reloadData(completion: @escaping ()->()) {
        UIView.animate(withDuration: 0, animations: { self.reloadData() })
        { _ in completion() }
    }
    
    func resizeableCell(estimatedHeight: CGFloat) {
        self.estimatedRowHeight = estimatedHeight
        self.rowHeight = UITableViewAutomaticDimension
    }
    
    func register<T: UITableViewCell>(_: T.Type) where T: ReusableView, T: NibLoadableView {
        let nib = UINib(nibName: T.nibName, bundle: nil)
        register(nib, forCellReuseIdentifier: T.reuseIdentifier)
    }
    
    func dequeueReusableCell<T: UITableViewCell>(forIndexPath indexPath: IndexPath) -> T where T: ReusableView {
        guard let cell = dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath as IndexPath) as? T else {
            fatalError("Could not dequeue cell with identifier: \(T.reuseIdentifier)")
        }
        
        return cell
    }
    
}

extension UITableViewCell: ReusableView, NibLoadableView {}

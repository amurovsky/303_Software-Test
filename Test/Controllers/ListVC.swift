//
//  ListVC.swift
//  Test
//
//  Created by Esteban Garibay on 08/09/17.
//  Copyright © 2017 Esteban garibay. All rights reserved.
//

import UIKit

class ListVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    fileprivate var people: [Person] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(ListCell.self)
        getPeople()
    }

}


// MARK: - TABLEVIEW
extension ListVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return people.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let person = people[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(forIndexPath: indexPath) as ListCell
        cell.setup(person: person)
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 64
    }
    
}


// MARK: - REQUEST
extension ListVC {
    
    func getPeople() {
        APICLient.request(path: .getList) { [weak self] (json, success) in
            if success {
                guard let json = json else { return }
                self?.people = Person.modelsFromdicArray(array: json)
                
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
            }
        }
        
    }
    
}



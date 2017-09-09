//
//  ListCell.swift
//  Test
//
//  Created by Esteban Garibay on 08/09/17.
//  Copyright © 2017 Esteban garibay. All rights reserved.
//

import UIKit

class ListCell: UITableViewCell {
    
    @IBOutlet weak var fullNameLbl: UILabel!
    @IBOutlet weak var cityLbl: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setup(person: Person) {
        guard let fname = person.firstName, let lname = person.lastName, let city = person.city else { return }
        
        fullNameLbl.text = "\(fname) \(lname)"
        cityLbl.text = city
    }
    
}

//
//  HomeTableViewCell.swift
//  MyZestyTask
//
//  Created by Sharaf on 19/08/2023.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    @IBOutlet weak var taskNameLabel: UILabel!
 
    
    func configure(with: String) {
        taskNameLabel.text = with
    }
}

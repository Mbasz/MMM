//
//  Cell.swift
//  MMM
//
//  Created by Marta on 05/07/2017.
//  Copyright © 2017 Melody Yang. All rights reserved.
//

import Foundation
import UIKit

enum State { case past, current, future }

class Cell: UITableViewCell {
    
    @IBOutlet weak var stepLabel: UILabel!
    
    var state = State.current
    let user = User.current
    
    func loadCell(row: Int, steps: [String], category: Int) {
        self.stepLabel.text = steps[row]
        switch (category) {
        case 0:
            if user.selectedHealth[row] == 1 {
                self.cellChecked(category: 0, row: row)
            }
        case 1:
            if user.selectedLearning[row] == 1 {
                self.cellChecked(category: 1, row: row)
            }
        case 2:
            if user.selectedSocial[row] == 1 {
                self.cellChecked(category: 2, row: row)
            }
        case 3:
            if user.selectedArt[row] == 1 {
                self.cellChecked(category: 3, row: row)
            }
        default:
            break
        }
        
    }
    
    func cellChecked(category: Int, row: Int) {
        self.accessoryType = UITableViewCellAccessoryType.checkmark
        switch (category) {
        case 0:
            self.backgroundColor = UIColor.green
            self.textLabel?.backgroundColor = UIColor.green
            if user.selectedHealth[row] == 0 {
                user.selectedHealth[row] = 1
            }
        case 1:
            self.backgroundColor = UIColor.blue
            self.textLabel?.backgroundColor = UIColor.blue
            if user.selectedLearning[row] == 0 {
                user.selectedLearning[row] = 1
            }
        case 2:
            self.backgroundColor = UIColor.orange
            self.textLabel?.backgroundColor = UIColor.orange
            if user.selectedSocial[row] == 0 {
                user.selectedSocial[row] = 1
            }
        case 3:
            self.backgroundColor = UIColor.purple
            self.textLabel?.backgroundColor = UIColor.purple
            if user.selectedArt[row] == 0 {
                user.selectedArt[row] = 1
            }
        default:
            break
        }
        
    }
}


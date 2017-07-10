//
//  StepsViewController.swift
//  MMM
//
//  Created by Marta on 05/07/2017.
//  Copyright © 2017 Melody Yang. All rights reserved.
//

import Foundation
import UIKit


class StepsTableViewController: UITableViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    var steps = [String]()
    var selectedCategory: Int = -1
    let user = User.current
    
    override func viewDidLoad() {
        
        switch (selectedCategory) {
        case 0:
            if let path = Bundle.main.path(forResource: "HealthData", ofType: "plist") {
                steps = NSArray(contentsOfFile: path) as! [String]
            }
            titleLabel.text = "Health"
            titleLabel.backgroundColor = UIColor.green
        case 1:
            if let path = Bundle.main.path(forResource: "LearningData", ofType: "plist") {
                steps = NSArray(contentsOfFile: path) as! [String]
            }
            titleLabel.text = "Skills"
            titleLabel.backgroundColor = UIColor.blue
        case 2:
            if let path = Bundle.main.path(forResource: "SocialData", ofType: "plist") {
                steps = NSArray(contentsOfFile: path) as! [String]
            }
            titleLabel.text = "Social"
            titleLabel.backgroundColor = UIColor.orange
        case 3:
            if let path = Bundle.main.path(forResource: "ArtData", ofType: "plist") {
                steps = NSArray(contentsOfFile: path) as! [String]
            }
            titleLabel.text = "Art"
            titleLabel.backgroundColor = UIColor.purple
        default:
            break
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return steps.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StepsCell", for: indexPath) as! Cell
        
        cell.loadCell(row: indexPath.row, steps: steps, category: selectedCategory)

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! Cell
        let alertController = UIAlertController (title: "Congratulations!", message: "You have completed another step.", preferredStyle: UIAlertControllerStyle.alert)
        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: { (action: UIAlertAction!) in
            self.performSegue(withIdentifier: "UnwindToMain", sender: self)
        }))
        switch (selectedCategory) {
        case 0:
            if user.selectedHealth[indexPath.row] == 0 {
                user.selected = 0
                user.progress[0] += 1
                user.dailyGoal = 1
                self.present(alertController, animated: true, completion: nil)
            }
        case 1:
            if user.selectedLearning[indexPath.row] == 0 {
                user.selected = 1
                user.progress[1] += 1
                user.dailyGoal = 1
                self.present(alertController, animated: true, completion: nil)
            }
        case 2:
            if user.selectedSocial[indexPath.row] == 0 {
                user.selected = 2
                user.progress[2] += 1
                user.dailyGoal = 1
                self.present(alertController, animated: true, completion: nil)
            }
        case 3:
            if user.selectedArt[indexPath.row] == 0 {
                user.selected = 3
                user.progress[3] += 1
                user.dailyGoal = 1
                self.present(alertController, animated: true, completion: nil)
            }
        default:
            break
        }
        cell.cellChecked(category: selectedCategory, row: indexPath.row)
    }
        
    
    }
    

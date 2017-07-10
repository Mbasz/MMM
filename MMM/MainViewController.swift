//
//  MainViewController.swift
//  MMM
//
//  Created by Marta on 05/07/2017.
//  Copyright © 2017 Melody Yang. All rights reserved.
//

import SwiftyJSON
import UIKit
import Alamofire

class MainViewController: UIViewController {
    
    @IBOutlet weak var healthButton: UIButton!
    @IBOutlet weak var learningButton: UIButton!
    @IBOutlet weak var socialButton: UIButton!
    @IBOutlet weak var artButton: UIButton!
    
    
    @IBOutlet weak var quoteLabel: UILabel!
    @IBOutlet weak var healthStars: UIImageView!
    @IBOutlet weak var learningStars: UIImageView!
    @IBOutlet weak var socialStars: UIImageView!
    @IBOutlet weak var artStars: UIImageView!
    
    let user = User.current
    var apiToContact = ""
    
    override func viewWillAppear(_ animated: Bool) {
        
        if user.dailyGoal == 1 {
            healthButton.isUserInteractionEnabled = false
            learningButton.isUserInteractionEnabled = false
            socialButton.isUserInteractionEnabled = false
            artButton.isUserInteractionEnabled = false
        }
        
        switch (user.selected) {
        case 0:
            apiToContact = "http://quotes.rest/qod?category=inspire"
            self.quoteLabel.backgroundColor = UIColor.white
        case 1:
            apiToContact = "http://quotes.rest/qod?category=students"
            self.quoteLabel.backgroundColor = UIColor.white
        case 2:
            apiToContact = "http://quotes.rest/qod?category=life"
            self.quoteLabel.backgroundColor = UIColor.white
        case 3:
            apiToContact = "http://quotes.rest/qod?category=art"
            self.quoteLabel.backgroundColor = UIColor.white
        default:
            self.quoteLabel.backgroundColor = UIColor(patternImage: UIImage(named: "poppy-1346086_640")!)
        }
        
        switch (user.progress[0]) {
        case 1:
            healthStars.image = UIImage(named: "imageedit_1_5135310009")
        case 2:
            healthStars.image = UIImage(named: "imageedit_4_2114669609")
        case 3:
            healthStars.image = UIImage(named: "imageedit_6_8177445929")
        case 4:
            healthStars.image = UIImage(named: "imageedit_8_4039790060")
        default:
            break
        }
        
        switch (user.progress[1]) {
        case 1:
            learningStars.image = UIImage(named: "imageedit_1_5135310009")
        case 2:
            learningStars.image = UIImage(named: "imageedit_4_2114669609")
        case 3:
            learningStars.image = UIImage(named: "imageedit_6_8177445929")
        case 4:
            learningStars.image = UIImage(named: "imageedit_8_4039790060")
        default:
            break
        }
        
        switch (user.progress[2]) {
        case 1:
            socialStars.image = UIImage(named: "imageedit_1_5135310009")
        case 2:
            socialStars.image = UIImage(named: "imageedit_4_2114669609")
        case 3:
            socialStars.image = UIImage(named: "imageedit_6_8177445929")
        case 4:
            socialStars.image = UIImage(named: "imageedit_8_4039790060")
        default:
            break
        }
        
        switch (user.progress[3]) {
        case 1:
            artStars.image = UIImage(named: "imageedit_1_5135310009")
        case 2:
            artStars.image = UIImage(named: "imageedit_4_2114669609")
        case 3:
            artStars.image = UIImage(named: "imageedit_6_8177445929")
        case 4:
            artStars.image = UIImage(named: "imageedit_8_4039790060")
        default:
            break
        }
        
        
        
        Alamofire.request(apiToContact).validate().responseJSON() { response in
            switch response.result {
            case .success:
                if let value = response.result.value {
                    let json = JSON(value)
                    self.quoteLabel.text = "\"" + json["contents"]["quotes"][0]["quote"].stringValue + "\""
                    self.navigationItem.title = "You've accomplished your daily goal :)"
                    self.loadView()
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "StepsSegue" {
            //Check whether destination is of type StepsViewController
            if let vc = segue.destination as? StepsTableViewController {
                //Check if sender is an integer
                if let sender = sender as? Int {
                    vc.selectedCategory = sender
                }
            }
        }
    }
    
    @IBAction func unwindToMain(_ segue: UIStoryboardSegue) {
        
    }
    
    @IBAction func healthTapped(_ sender: Any) {
        if (user.dailyGoal == 0) {
            performSegue(withIdentifier: "StepsSegue", sender: 0)
        }
    }
    
    @IBAction func learningTapped(_ sender: Any) {
        if (user.dailyGoal == 0) {
            performSegue(withIdentifier: "StepsSegue", sender: 1)
        }
    }
    
    
    @IBAction func socialTapped(_ sender: Any) {
        if (user.dailyGoal == 0) {
            performSegue(withIdentifier: "StepsSegue", sender: 2)
        }
    }
    
    @IBAction func artTapped(_ sender: Any) {
        if (user.dailyGoal == 0) {
            performSegue(withIdentifier: "StepsSegue", sender: 3)
        }
    }
}


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
    
    @IBOutlet weak var quoteLabel: UILabel!
    
    let user = User.current
    var apiToContact = ""
    
    override func viewWillAppear(_ animated: Bool) {
        
        switch (user.selected) {
        case 0:
            apiToContact = "http://quotes.rest/qod?category=inspire"
        case 1:
            apiToContact = "http://quotes.rest/qod?category=students"
        case 2:
            apiToContact = "http://quotes.rest/qod?category=life"
        case 3:
            apiToContact = "http://quotes.rest/qod?category=art"
        default:
            break
        }
        
        Alamofire.request(apiToContact).validate().responseJSON() { response in
            switch response.result {
            case .success:
                if let value = response.result.value {
                    let json = JSON(value)
                    self.quoteLabel.text = json["contents"]["quotes"][0]["quote"].stringValue
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
    
    @IBAction func healthTapped(_ sender: Any) {
        
        performSegue(withIdentifier: "StepsSegue", sender: 0)
    }
    
    @IBAction func learningTapped(_ sender: Any) {
        performSegue(withIdentifier: "StepsSegue", sender: 1)
    }
    
    
    @IBAction func socialTapped(_ sender: Any) {
        performSegue(withIdentifier: "StepsSegue", sender: 2)
    }
    
    
    @IBAction func artTapped(_ sender: Any) {
        performSegue(withIdentifier: "StepsSegue", sender: 3)
    }
}


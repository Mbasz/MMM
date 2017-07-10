//
//  User.swift
//  MMM
//
//  Created by Marta on 06/07/2017.
//  Copyright © 2017 Melody Yang. All rights reserved.
//

import Foundation
import UIKit


class User: NSObject {
    static var current = User()
    
    var dailyGoal = 0
    var selected = -1
    var progress = [0, 0, 0, 0]
    var selectedHealth = [0, 1, 0, 1, 1]
    var selectedLearning = [0, 0, 0, 0, 0]
    var selectedSocial = [0, 0, 0, 0, 0]
    var selectedArt = [0, 0, 0, 0, 0]
}

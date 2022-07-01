//
//  staff.swift
//  P3
//
//  Created by Elodie GAGE on 12/05/2022.
//

import Foundation

class Staff: Weapon {
    init() {
        super.init(damage: 40) // call the init of the parent class
        name = "Aurora 🪬"
    }
}

//
//  sword.swift
//  P3
//
//  Created by Elodie GAGE on 12/05/2022.
//

import Foundation

class Sword : Weapon {
    init() {
        super.init(damage: 100)// call the init of the parent class
        name = "Soldier sword ⚔️ "
    }
}

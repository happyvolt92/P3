//
//  IronFist.swift
//  P3
//
//  Created by Elodie GAGE on 12/05/2022.
//

import Foundation


// we call the init of the parent class (Weapon) and we give it the damage of 60.
 class IronFist : Weapon {
    init() {
        super.init(damage: 60) 
        name = "Ebony & Ivory 🦾"
    } 
}

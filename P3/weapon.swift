//
//  weapon.swift
//  
//
//  Created by Elodie GAGE on 14/04/2022.
//

import Foundation

class Weapon {
    var weaponName: String
    var damage: Int

    
    
    init(weaponName: String, damage: Int) {
        self.weaponName = weaponName
        self.damage = damage
       
        
    }
    
    var sword = Weapon(weaponName: "sword", damage: 30)
    var staff = Weapon(weaponName: "staff", damage: 10)
    var axe = Weapon(weaponName: "axe", damage: 50)
    var ironFist = Weapon(weaponName: "iron fist", damage: 20)
}


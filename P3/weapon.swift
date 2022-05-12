//
//  weapon.swift
//  
//
//  Created by Elodie GAGE on 14/04/2022.
//

import Foundation

class Weapon {

    let weaponName: String
    let damage: Int

    let sword = Weapon(weaponName: String, damage: 30),
    let staff = Weapon(weaponName: String, name: "staff", damage: 10, heal: 40),
    let axe = Weapon(weaponName: String, damage: 50),
    let ironFist = Weapon(weaponName: String, damage: 20)
    
    
    init(weaponName: String, damage: Int) {
        self.weaponName = weaponName
        self.damage = damage
        
    }
    

}

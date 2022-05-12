//
//  characters.swift
//  
//
//  Created by Elodie GAGE on 14/04/2022.
//

import Foundation

class Character {
    let name: String
    let type: String
    var life: Int
    let lifeMaxLimit: Int
    var isAlive: Bool
    var weapon: Weapon
    func isNameUnique(name: String) -> Bool {
        if name == Warrior.name || name == Mage.name || name == Colossus.name || name == Dwarf.name {
            return false
        } else {
            return true
        }
    
}

init(type: String, life: Int, weapon: Weapon, name: String, isAlive: Bool) {
  self.type = type
  self.life = life
  self.weapon = weapon
  self.name = name
  self.lifeMaxLimit = life
  self.isAlive = isAlive
}


let Warrior = Character(name: "warrior",type: "Guard", hp: 200, lifeMaxLimit: 200, Weapon:"sword")
let Mage = Character(name: "Magus", type: "Healer", hp: 300, lifeMaxLimit: 300, weapon: "staff")
let Colossus = Character(name: "Colossus", type: "Wall", hp: 400, lifeMaxLimit: 400, weapon: "iron fist")
let Dwarf = Character(name: "Dwarf", hp: 100, type: "Cannon fodder", lifeMaxLimit: 100, weapon: "axe")



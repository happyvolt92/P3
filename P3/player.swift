//
//  player.swift
//  
//
//  Created by Elodie GAGE on 14/04/2022.
//

class Player{
    var name: String
    var alive: Bool
    
    init(name:String, alive: Bool){
    self.name = name
    self.alive = alive
    }
    
}

// verifier si un nom est unique
    func isNameUnique(){
        for player in players{
            if player.name == self.name{
                print("Oup's,name already taken")
                return
            }
        }
    
}

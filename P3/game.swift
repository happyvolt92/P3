//
//  Game.swift
//  
//
//  Created by Elodie GAGE on 14/04/2022.
//

import Foundation


public class Game {
    
    // change method, increase laps'turn. says it in the function GameIntro
    var Laps = 0
    var player : [Player] = [Player(name: ""),
                             Player(name: "")]
    
    
    //Allow playrs to choos a name !! must be different 1 to 2
    public func askPlayersName() {
        print("Player 1, what's your name ?")
        let name1 = readLine()
        self.player[0] = Player(name: name1!)
        print("Player 2, what's your name ?")
        let name2 = readLine()
        self.player[1] = Player(name: name2!)
        print("\n\n")
        //create a func for name verif
        if name2 == name1 {
            print("Oup's name already taken !")
            askPlayersName()
        }
        else {
            print(" ok Fighters, let's go ! \n\n")
        }
        
    }
}

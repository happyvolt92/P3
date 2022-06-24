//
//  player.swift
//  
//
//  Created by Elodie GAGE on 14/04/2022.
//

public class Player{
    var name: String
    //initiate the characters allCases
    var characterPlayersChooseArray: [Character] = []
    
    
    
    init(name:String){
    self.name = name
    }
    
   // Int convert
    func input() -> Int {
        if let strData = readLine(),let intValue = Int(strData){
            return intValue
        }else{
            return 0
        }
    }
    
   
    // ask Player wich action to do, if input is not equal to 1 or 2 wrn the player
    func askPlayerWichActionToDo() -> Int{
        var i : Int
        repeat{
            print("Fighter \(self.name), should you :\n\n 1.Fight  \n 2.Heal ?")
            i = input()
            if i > 2 || i < 1{
                print("\nYou can't escape your duty, please choose to Fight or Heal !")
            }
        }while i > 2 || i < 1
        return i
    }
    
    // ask wich character will do it; X= list Player.characters 
    func askWichCharacterWillDoTheAction() -> Character {
        var i : Int
        repeat {
            print("\n \(self.name), Who will do the action ?\n")
           
            for i in 0...2 {
                
                if self.characterPlayersChooseArray[i].life > 0 {
                    print("\(i+1). \(characterPlayersChooseArray[i].description())\n")
                }
            }
            i = input()
            // Player's choice need to be between 1&3 only
            if i <= 3 && i >= 1 {
                if self.characterPlayersChooseArray[i-1].life <= 0 {
                    print("\nHm,Fighter dead. Ask someone else.\n")
                    i = 0
                }
                //si
            } else {
                print("You can't escape your duty, choose someone !\n")
            }
        } while i < 1 || i > 3
        return self.characterPlayersChooseArray[i-1]
    }
    
    // Ask player to choose a target
   func chooseTheTarget() -> Character {
        var i : Int
        repeat {
            print("\nHow fun ! Choose the enemy !!\n")
            for i in 0...2 {
                if self.characterPlayersChooseArray[i].life > 0 {
                    print("\(i+1).\(self.characterPlayersChooseArray[i].name)")
                }
            }
            i = input()
            if i <= 3 && i >= 1 {
                if self.characterPlayersChooseArray[i-1].life <= 0 {
                    print("\nHm,Fighter dead. Ask someone else.\n")
                    i = 0
                }
            }else{
                print("\nYou can't escape your duty, choose someone\n ")
            }
        } while i < 1 || i > 3
        return self.characterPlayersChooseArray[i-1]
        }
    
    func isAlive() -> Bool {
        for character in self.characterPlayersChooseArray{
            if character.life > 0{
                return true
            }
        }
        return false
    }
    
}

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
            print("Fighter \(self.name), should you :\n1.Fight or \n2. Heal ?")
            i = input()
            if i > 2 || i < 1{
                print("You can't escape your duty, please choose to Fight or Heal !")
            }
        }while i > 2 || i < 1
        return i
    }
    
    // ask wich character will do it; X= list Player.characters 
    func askWichCharacterWillDoTheAction() -> Character {
        var i : Int
        repeat {
            print("\(self.name), Who will do the action ?")
            i = input()
            for i in 0...2 {
                if self.characterPlayersChooseArray[i].life() > 0 {
                    print("\(i+1). \(characterPlayersChooseArray[i].rawValue)")
                }
            }
            // Player's choice need to be between 1&3 only
            if i <= 3 && i >= 1 {
                if self.characterPlayersChooseArray[i-1].life() <= 0 {
                    print("Hm,Fighter dead. Ask someone else.")
                    i = 0
                }
                //si
            } else {
                print("You can't escape your duty, choose someone !")
            }
        } while i < 1 || i > 3
        return self.characterPlayersChooseArray[i-1]
    }
    
    // Ask player to choose a target
   func chooseTheTarget() -> Character {
        var i : Int
        repeat {
            print("How fun ! Choose the enemy !!")
            for i in 0...2 {
                if self.characterPlayersChooseArray[i].life > 0 {
                    print("\(i+1).\(self.characterPlayersChooseArray[i].name)")
                }
            }
            i = input()
            if i <= 3 && i >= 1 {
                if self.characterPlayersChooseArray[i-1].life <= 0 {
                    print("Hm,Fighter dead. Ask someone else.")
                    i = 0
                }
            }else{
                print("You can't escape your duty, choose someone ")
            }
        } while i < 1 || i > 3
        return self.characterPlayersChooseArray[i-1]
        }
    }

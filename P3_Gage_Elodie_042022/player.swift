//
//  player.swift
//  
//
//  Created by Elodie GAGE on 14/04/2022.
//

public class Player{
    var name: String   
    var characterPlayersChooseArray: [Character] = [] // array of characters
    
    init(name:String){
    self.name = name
    }
    
   // Int converter so we can translate the users answer to an Int and process it.
    func input() -> Int {
        if let strData = readLine(),let intValue = Int(strData){
            return intValue
        }else{
            return 0
        }
    }
   
    // ask the player to choose (using the input function) an action he will perform as a character.
    func askPlayerWichActionToDo() -> Int{
        var i : Int
        repeat{
            print("Fighter \(self.name)⚜️, should you :\n\n 1. Fight  \n 2. Heal\n")
            i = input() 
            if i > 2 || i < 1{
                print("\nYou can't escape your duty, please choose to Fight or to Heal !\n")
            }
        }while i > 2 || i < 1 // if the user choice (input) is not equal to 1 or 2, we ask him to choose again.
        return i
    }
    
    // ask wich character will perform the action.
    func askWichCharacterWillDoTheAction() -> Character {
        var i : Int
        repeat {
            print("\n\(self.name), Who will do the action ?\n")
           // for each character in the array 0 to 3, we print the character description() if their live is above 0.
            for i in 0...2 {
                
                if self.characterPlayersChooseArray[i].life > 0 {
                    print("\(i+1). \(characterPlayersChooseArray[i].description())\n")
                }
            }
            i = input()
            // Player's choice need to be between 1&3 strictly.
            if i <= 3 && i >= 1 {
                //if the character life is under 0, we ask him to choose someone else.
                if self.characterPlayersChooseArray[i-1].life <= 0 {
                    print("\nHm,Fighter dead. Ask someone else.\n")
                    i = 0
                }
                //si
            } else {
                // if user choose a number outside the range, we ask him to choose again.
                print("You can't escape your duty, choose someone !\n")
            }
        } while i < 1 || i > 3
        return self.characterPlayersChooseArray[i-1] // return the character chosen by the player.
    }
    
    // Ask player to choose a target
   func chooseTheTarget() -> Character {
        var i : Int
        repeat {
            print("\n Choose the target!!\n")
            for i in 0...2 {
                if self.characterPlayersChooseArray[i].life > 0 {
                    print("\n\(i+1).\(self.characterPlayersChooseArray[i].name)")
                }
            }
            i = input()
            if i <= 3 && i >= 1 {
                if self.characterPlayersChooseArray[i-1].life <= 0 {
                    print("\nHm,Fighter dead or not choice not available. Ask someone else.\n")
                    i = 0
                }
            }else{
                print("\nYou can't escape your duty, choose someone\n ")
            }
        } while i < 1 || i > 3
        return self.characterPlayersChooseArray[i-1]
        }
    
    // function check if the player is alive with a boolean.
    func isAlive() -> Bool {
        
        for character in self.characterPlayersChooseArray{
            if character.life > 0{
                return true
            }
        }
        return false
    }
    
}

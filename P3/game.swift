//
//  Game.swift
//  
//
//  Created by Elodie GAGE on 14/04/2022.
//

import Foundation


public class Game {
    
    var Laps = 0
    var playersArray : [Player] = [Player]()
    
    
    //Allow playrs to choos a name !! must be different 2 to 1
    public func askPlayersName() {
        print("Player 1, what's your name ?")
        let name1 = readLine()
        self.playersArray[0] = Player(name: name1!)
        print("Player 2, what's your name ?")
        let name2 = readLine()
        self.playersArray[1] = Player(name: name2!)
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
    
    //Int Convert for reading answers
    private func input() -> Int {
        if let strData = readLine(),
           let intValue = Int(strData){
            return intValue
        }else{
            return 0
        }
    }


    public func TeamPlayerCreation() {
        
        for player in playersArray {
            var i = 0
            var choice : Int
            
            repeat {
                print("Funniest Part! Creation of your legendary cannon fodder hem .. Team.\n \(player.name), it's your turn ! Choose 3 fighters.\n\n")
                listingAllCharacters()
                choice = input()
                
                // choice need to be in the characterArray, warning in terminal
                if (choice > Character.CharacterType.allCases.count) || (choice < 1) {
                    print("No time for this, don't be shy and choose !")
                }
                else {
                    // function to do: ask Player's characters name
                    var charactersPlayersChoice: Character = Character(name: "Jose", type: Character.CharacterType.allCases[choice])
                    // put characters choice in an array
                    player.characterPlayersChooseArray.append(charactersPlayersChoice)
                    //i = i + 1   =   i += 1
                    i += 1
                }
           
            }while i < 3
        }
    }
    
    // listing characters using CaseIterable and enum. code cleaner and maintanable
    func listingAllCharacters(){
        
        for _ in Character.CharacterType.allCases{
            print(  " \(Character.CharacterType.allCases.description) ")
        }
    }
    
    // Function stop the game if one player got all his warrior dead: life =0.
    public func endGame() -> Bool{
        if (Player.self[0].character[0].life == 0 && self.player[0].character[1].life == 0 && self.player[0].character[2].life == 0) || (self.player[1].character[0].life == 0 && self.player[1].character[1].life == 0 && self.player[1].character[2].life == 0) {
            return false
        }else{
            return true
        }
    }
    
    public func enOfTheGame() -> Bool{
        if (playersArray == 0
    }
    
    // function to check who won by reading character's players life.
    func checkWinner() -> Player {
        if (self.player[0].character[0].life == 0 && self.player[0].character[1].life == 0 && self.player[0].character[2].life == 0) {
            return self.playersArray[1]
        }else{
            return self.playersArray[0]
        }
    }
    
    // function to launch game within all steps (actions).
     func launchGame() {
        self.askPlayersName()
        self.TeamPlayerCreation()
    
        print("\n\n\n LET'S FIGHT !\n\n\n")
        var i = 0
        repeat {
            let x = i%2
            print("Don't sleep, it's your turn \(self.playersArray[x].name)")
            //every players need to choose an action, a character who will do the action and a target. Every things need to be in a row.
            if self.playersArray[x].askPlayerWichActionToDo() == 1 {
               self.playersArray[x].askWichCharacterWillDoTheAction().attack(character: self.playersArray[(x+1)%2].chooseTheTarget())
            }
            else{
               self.playersArray[x].askWichCharacterWillDoTheAction().heal(character: self.playersArray[x].chooseTheTarget())
            }
            //laps increase so we can count them every turns
            i = i + 1
            self.Laps = self.Laps + 1
        } while self.endGame()
        
        
        print("This is the END, my only friend, THE END. AHEM, the winner is ... \(self.checkWinner().name) she/he won in \(self.Laps) laps. Congrats, Now go back to your business.")
     }
}





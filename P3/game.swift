//
//  Game.swift
//  
//
//  Created by Elodie GAGE on 14/04/2022.
//

import Foundation


public class Game {
    
    var Laps = 0
    var player : [Player] = [Player(name: ""),
                             Player(name: "")]
    
    
    //Allow playrs to choos a name !! must be different 2 to 1
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
    
    //Int Convert for reading answers
    private func input() -> Int {
        if let strData = readLine(),
           let intValue = Int(strData){
            return intValue
        }else{
            return 0
        }
    }

        // Create Team
    public func CreatePlayerTeam(){
        var i = 0
        
        var choice : Int
        repeat {
            let x = i%2
            repeat {
                print("Funniest Part! Creation of your legendary cannon fodder hem .. Team.\n \(self.player[x].name), it's your turn ! Choose 3 fighters.\n\n")
                listingAllCharacters()
                choice = input()
                // if the choice aka the number chosen by the player is under 1, print a warning
                if (choice > Character.CharacterType.allCases.count) || (choice < 1) {
                    print("No time for this, don't be shy and choose !")
                }
            } while (choice > Character.CharacterType.allCases.count) || (choice < 1)
            i = i + 1
        } while i < 6
        print("\n")
    }
    
    // listing characters using CaseIterable and enum. code cleaner and maintanable
    func listingAllCharacters(){
        
        for _ in Character.CharacterType.allCases{
            print(  " \(Character.CharacterType.allCases.description) ")
        }
    }
    
    // Function stop the game if one player got all his warrior dead: life =0.
    public func endGame() -> Bool{
        if (self.player[0].character[0].life == 0 && self.player[0].character[1].life == 0 && self.player[0].character[2].life == 0) || (self.player[1].character[0].life == 0 && self.player[1].character[1].life == 0 && self.player[1].character[2].life == 0) {
            return false
        }else{
            return true
        }
    }
    
    // function to check who won by reading character's players life.
    func checkWinner() -> Player {
        if (self.player[0].character[0].life == 0 && self.player[0].character[1].life == 0 && self.player[0].character[2].life == 0) {
            return self.player[1]
        }else{
            return self.player[0]
        }
    }
    
    // function to launch game within all steps (actions).
     func launchGame() {
        self.askPlayersName()
        self.CreatePlayerTeam()
    
        print("\n\n\n LET'S FIGHT !\n\n\n")
        var i = 0
        repeat {
            let x = i%2
            print("Don't sleep, it's your turn \(self.player[x].name)")
            //every players need to choose an action, a character who will do the action and a target. Every things need to be in a row.
            if self.player[x].askPlayerWichActionToDo() == 1 {
               self.player[x].askWichCharacterWillDoTheAction().attack(character: self.player[(x+1)%2].chooseTheTarget())
            }
            else{
               self.player[x].askWichCharacterWillDoTheAction().heal(character: self.player[x].chooseTheTarget())
            }
            //laps increase so we can count them every turns
            i = i + 1
            self.Laps = self.Laps + 1
        } while self.endGame()
        
        
        print("This is the END, my only friend, THE END. AHEM, the winner is ... \(self.checkWinner().name) she/he won in \(self.Laps) laps. Congrats, Now go back to your business.")
     }
}





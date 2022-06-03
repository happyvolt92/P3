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
    var characters = [Character]()
    
    
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
    
    
    //Int Convert
    private func input() -> Int {
        if let strData = readLine(),let intValue = Int(strData){
            return intValue
        }else{
            return 0
        }
    }
    
    /// Function to display all available characters
    public func showCharactersList(){
        for i in 0 ... characters.count-1 {
            print("\(i+1).\(characters[i].name) has \(characters[i].weapon.damage) damage pts and got \(characters[i].life) HP, he is carrying \(characters[i].weapon.name).")
        }
    }
    
    
        // Create Team
    public func CreatePlayerTeam(){
        var i = 0
        var choice : Int
        repeat {
            let x = i%2
            repeat {
                print("Funniest Part! Creation of your legendary cannon fodder hem .. Team. \(self.player[x].name)\n")
                self.showCharactersList()
                choice = input()
                if (choice > self.characters.count) || (choice < 1) {
                    print("No time for this, don't be shy and choose !")
                }
            } while (choice > self.characters.count) || (choice < 1)
            self.player[x].character.append(self.characters[choice-1])
            self.characters.remove(at: choice-1)
            i = i + 1
        } while i < 6
        print("\n")
    }
   
    
    // list of all warriors, their HP and damage. NOTE FOR LATER USE FOR each characters in Players team
    public func listingAllCharacters(){
        print(" \(self.player[0].name) choose\n")
        print("Warrior1: \(self.player[0].character[0].name)\t \(self.player[0].character[0].life)\t \(self.player[0].character[0].weapon.name)\t\(self.player[0].character[0].weapon.damage)")
        print("Warrior2: \(self.player[0].character[1].name)\t \(self.player[0].character[1].life)\t \(self.player[0].character[1].weapon.name)\t : \(self.player[0].character[1].weapon.damage)")
        print("Warrior3: \(self.player[0].character[2].name)\t  \(self.player[0].character[2].life)\t \(self.player[0].character[2].weapon.name)\t \(self.player[0].character[2].weapon.damage)\n")
        print("\(self.player[1].name) choose\n")
        print("Warrior1: \(self.player[1].character[0].name)\t  \(self.player[1].character[0].life)\t \(self.player[1].character[0].weapon.name)\t \(self.player[1].character[0].weapon.damage)")
        print("Warrior2: \(self.player[1].character[1].name)\t  \(self.player[1].character[1].life)\t \(self.player[1].character[1].weapon.name)\t \(self.player[1].character[1].weapon.damage)")
        print("Warrior3: \(self.player[1].character[2].name)\t  \(self.player[1].character[2].life)\t \(self.player[1].character[2].weapon.name)\t \(self.player[1].character[2].weapon.damage)\n")
        
    }
    
    // Function stop the game if one player got all his warrior dead
    public func endGame() -> Bool{
        if (self.player[0].character[0].life == 0 && self.player[0].character[1].life == 0 && self.player[0].character[2].life == 0) || (self.player[1].character[0].life == 0 && self.player[1].character[1].life == 0 && self.player[1].character[2].life == 0) {
            return false
        }else{
            return true
        }
    }
    
    // function to check who won
    func checkWinner() -> Player {
        if (self.player[0].character[0].life == 0 && self.player[0].character[1].life == 0 && self.player[0].character[2].life == 0) {
            return self.player[1]
        }else{
            return self.player[0]
        }
    }
    
    
    /// Function to launch the game
    static func launchGame() {
        
        let game = Game()
        
        game.askPlayersName()
        game.CreatePlayerTeam()
        game.listingAllCharacters()
    
        print("\n\n\n LET'S FIGHT !\n\n\n")
        var i = 0
        repeat {
            let x = i%2
            print("Don't sleep, it's your turn \(game.player[x].name)")
            if game.player[x].askPlayerWichActionToDo() == 1 {
                game.player[x].askWichCharacterWillDoTheAction().attack(character: game.player[(x+1)%2].chooseTheTarget())
            }else{
                game.player[x].askWichCharacterWillDoTheAction().heal(character: game.player[x].chooseTheTarget())
            }
            
            i = i + 1
            game.Laps = game.Laps + 1
        } while game.endGame()
        
        game.listingAllCharacters()
        
        print("This is the END, my only friend, THE END. AHEM, the winner is ... \(game.checkWinner().name) she/he won in \(game.Laps) laps. Congrats, Now go back to your business.")
    }
    
    
    
    
}





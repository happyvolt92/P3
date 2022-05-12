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
    
   
    var characters : [Character] = [
        // TODO : ASK PLAYER TO GIVE NICK NAME TO HE CHARACTERS 8!!
                                    Character(name: "King's soldier", life: 300, weapon: Sword()),
                                    Character(name: "Colossus", life: 500, weapon: IronFist()),
                                    Character(name: "Dwarf", life: 180, weapon: Hammer()),
                                    Character(name: "Magus", life: 100, weapon: Staff())]
    
    //Allow playrs to choos a name !! must be different 1 to 2
    public func PlayerNames() {
        print("Player 1, what's your name ?")
        let name1 = readLine()
        self.player[0] = Player(name: name1!)
        print("Player 2, what's your name ?")
        let name2 = readLine()
        self.player[1] = Player(name: name2!)
        print("\n\n")
    }
                                    
}








/*  OLD GAME KAPOUT
 

// Game class with properties: intro, players, teams, checkWinner, startGame, endGame
class Game { 

    var players: [Player]
    var teams: [Team]
    var checkWinner: Bool
    var startGame: Bool
    var endGame: Bool
    

    init (players: [Player], teams: [Team], checkWinner: Bool, startGame: Bool, endGame: Bool) {
    
        self.players = players
        self.teams = teams
        self.checkWinner = checkWinner()
        self.startGame = startGame()
        self.endGame = endGame()
   
 
        
    }
   
    // small intro to the game
    func intro() -> String {
        return "Welcome to War is love! Two players will fight for their life. Each player will create a team composed of 3 characters. Every player, Team and warrior need a name! It's a turn by turn game, each player will choose a character to attack the other player's character. The winner is the last player with a character alive. Good luck!"
    }
    
    
    func endGame() -> Bool{
           if (self.players[0].character[0].life == 0 && self.players[0].character[1].life == 0 && self.players[0].character[2].life == 0) || (self.players[1].character[0].life == 0 && self.players[1].character[1].life == 0 && self.players[1].character[2].life == 0) {
               return false
           }else{
               return true
           }
       }
    
    func checkWinner() -> Player {
        if (self.players[0].character[0].life == 0 && self.players[0].character[1].life == 0 && self.player[0].character[2].life == 0) {
            return self.player[1]
        }else{
            return self.player[0]
        }
    }
     
    

    //function to show all characters from class Character
    public func showCharacters() {
        for characters in Characters {
            print("\(character.name) is a \(character.type) with \(character.life) life points")
        }
    }
   
    
    
    // function to start the game

 func startGame() -> {
      
        intro()
        // showCharacters func to show all characters
        showCharacters()
       // ask both players for their name and use func isNameUnique to check if the player2 diferent name from player1
        print("Player 1, please enter your name")
        let name1 = readLine()
        print("Player 2, please enter your name")
        let name2 = readLine()!
        if name1 == name2 {
            print("Oups, name already taken")
            return print("Player 2, please enter a different name then Player 1")
            let name2 = readLine()!
        }
        }
       
        // ask player1 to choose 3 characters on the characters array
    func PickCharater() -> String {
        print("Player 1, please choose 3 characters")
        var player1Characters = [Character]()
        for i in 0...2 {
            print("choose your character")
            var choice = readLine()!
            switch choice {
            case "1":
                player1Characters.append(Warrior)
            case "2":
                player1Characters.append(Mage)
            case "3":
                player1Characters.append(Colossus)
            case "4":
                player1Characters.append(Dwarf)
            default:
                print("invalid choice")
                return ("team completed")
            }
        }
        
        print("Player 2, please choose 3 characters")
        showCharacters()
        // ask player2 to choose 3 characters on the characters array
        PickCharater()
    }
}
*/

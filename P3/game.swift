//
//  Game.swift
//  
//
//  Created by Elodie GAGE on 14/04/2022.
//

import Foundation


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
        self.checkWinner = checkWinner
        self.startGame = startGame
        self.endGame = endGame
    }

    // small intro to the game
    func intro() -> String {
        return "Welcome to War is love! Two players will fight for their life. Each player will create a team composed of 3 characters. Every player, Team and warrior need a name! It's a turn by turn game, each player will choose a character to attack the other player's character. The winner is the last player with a character alive. Good luck!" 
    }

    //function to show all characters from class Character
    func showCharacters() {
        for character in Characters {
            print("\(character.name) is a \(character.type) with \(character.life) life points")
        }
    }
   
    
    
    // function to start the game

    func startGame() -> {
       intro()
       // ask both players for their name and use func isNameUnique to check if the player2 diferent name from player1
        print("Player 1, please enter your name")
        var player1Name = readLine()!
        print("Player 2, please enter your name")
        var player2Name = readLine()!
        if player1Name == player2Name {
            print("Oups, name already taken")
            return print("Player 2, please enter a different name then Player 1")
        }
        // showCharacters func to show all characters
        showCharacters()
        // ask player1 to choose 3 characters on the characters array
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
            }
        }
        showCharacters()
        // ask player2 to choose 3 characters on the characters array
        print("Player 2, please choose 3 characters")
        var player2Characters = [Character]()
        for i in 0...2 {
            print("choose your character")
            var choice = readLine()!
            switch choice {
            case "1":
                player2Characters.append(Warrior)
            case "2":
                player2Characters.append(Mage)
            case "3":
                player2Characters.append(Colossus)
            case "4":
                player2Characters.append(Dwarf)
            default:
                print("invalid choice")
            }
        }
    }
}

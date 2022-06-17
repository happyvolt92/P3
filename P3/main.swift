//
//  main.swift
//  P3
//
//  Created by Elodie GAGE on 12/05/2022.
//

import Foundation



   /// Function to launch the game
    func StartGame() {
       
       let game = Game()
   
       game.launchGame()
    
   // Game explanation on start
       print("Welcome to War is love! Two players will fight for their life. Each player will create a team composed of 3 characters. Every player,warrior need a name! It's a turn by turn game, each player will choose a character to attack the other player's character. The winner is the last player with a character alive. Good luck!")
    }

    
    StartGame()
   

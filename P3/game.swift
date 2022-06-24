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
        print("\nPlayer 1, what's your name ?\n")
        let name1 = readLine()
        self.playersArray.append(Player(name: name1!))
        print("\nPlayer 2, what's your name ?\n")
        let name2 = readLine()
        self.playersArray.append(Player(name: name2!))
        print("\n\n")
        //create a func for name verif
        if name2 == name1 {
            print("Oup's name already taken !\n")
            askPlayersName()
        }
        else {
            print(" \nok Fighters, let's go ! \n\n")
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
                print("\nFunniest Part! Creation of your legendary cannon fodder hem .. Team.\n \(player.name), it's your turn ! Choose 3 fighters and their name\n\n")
                listingAllCharacters()
                choice = input()
                
                // choice need to be in the characterArray, warning in terminal
                if (choice > Character.CharacterType.allCases.count) || (choice < 1) {
                    print("No time for this, don't be shy and choose !\n")
                }
                else {
                    var charactersPlayersChoice: Character = Character(name: "", type: Character.CharacterType.allCases[choice])
                    
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
        for characterType in Character.CharacterType.allCases{
            print( " \(characterType.rawValue)  \n")
        }
    }
    
    // if a playerchooseArray life is equal to 0 then endgame is true
    public func enOfTheGame() -> Bool{
        // verifier dans une équipe si tout les characters.life = 0
        for player in playersArray{
            if !player.isAlive(){
                return true
            }
        }
            return false
    }
    
    // check wich player is alive and return the name of the player
    public func isWinner() -> String{
        for player in playersArray{
            if player.isAlive(){
                return player.name
            }
        }
        return ""
    }
        
    // function to launch game within all steps (actions).
     func launchGame() {
         // Game explanation on start
             print("Welcome to War is love!\nTwo players will fight for their life. Each player will create a team composed of 3 characters.\n Every player,warrior need a name! It's a turn by turn game, each player will choose a character to attack the other player's character. The winner is the last player with a character alive. \n Good luck!")
         
         
        self.askPlayersName()
        self.TeamPlayerCreation()
    
        print("\n\n\n LET'S FIGHT !\n\n")
        var i = 0
        // while loop to play the game
        repeat {
            let x = i%2
            print("Don't sleep, it's your turn \(self.playersArray[x].name)\n")
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
        } while !self.enOfTheGame()
        //enOfTheGame is true, call the isWinner function to get the name of the winner and show numbers of laps
        print("\n\n\(self.isWinner()) is the winner !He/She won in \n\n\(self.Laps) laps \n")

     }
}

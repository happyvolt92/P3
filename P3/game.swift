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
        print("\n\nPlayer 1, what's your name ?\n")
        let name1 = readLine()
        self.playersArray.append(Player(name: name1!))
        print("\nPlayer 2, what's your name ?\n")
        let name2 = readLine()
        self.playersArray.append(Player(name: name2!))
        print("\n\n ")
        //create a func for name verif
        if name2 == name1 {
            print("Oup's name already taken !\n")
            askPlayersName()
        }
        else {
            print(" \nok Fighters, let's go ! ⚔️⚔️ \n\n")
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
                print("\n🔊Funniest Part!🔊\n\nCreation of your legendary cannon fodder ahem... I mean your Team.\n⚜️\(player.name)⚜️, it's your turn! Choose 3 fighters and their name 📝. \n\n")
                listingAllCharacters()
                choice = input()
                
                // choice need to be in the characterArray, warning in terminal
                if (choice > Character.CharacterType.allCases.count) || (choice < 0) {
                    print("No time for this, don't be shy and choose !\n")
                }
                else {
                    // after player add a character, ask the player to name it
                      print("\n\(player.name), what's your warrior name ?\n")
                      let name = readLine()
                    
                    // verif name is unique and not null
                        if let n = name {
                            var isNameUnique: Bool = true
                            for character in player.characterPlayersChooseArray {
                                if n == character.name{
                                    isNameUnique = false
                                }
                            }
                            if isNameUnique {
                                var charactersPlayersChoice: Character = Character(name: n, type: Character.CharacterType.allCases[choice])
                                // put characters choice in an array
                                player.characterPlayersChooseArray.append(charactersPlayersChoice)
                                //i = i + 1   =   i += 1
                                i += 1
                                print("\n\(player.name), your \(charactersPlayersChoice.type) is named \(charactersPlayersChoice.name) ✅!\n")
                            }
                            else {
                                print("\n Named already on game or empty !, choose again ❌.\n")
                            }
                        }
                    else {
                        print("\n Name already on game or empty ❌!\n")
                    }
                            
                }
           
            }while i < 3
        }
    }
    
    // list all characters in the game with their number starting from 0,then print character.description()
    private func listingAllCharacters() {
        var i = 0
        for character in Character.CharacterType.allCases {
            print("\(i) - \(character.rawValue) has \(character.maxLife()) Hp and come with \(character.weapon().name) as a weapon with \(character.weapon().damage) damage points.")
            i += 1
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
             print("Welcome to War is love!❤️‍🩹 \n\nTwo players will fight for their life. Each player will create a team composed by 3 characters.\nEvery player, warrior need a name! Don't forget to name your warriors.\nIt's a turn by turn game, each player will choose a character to attack the other player's character or to heal his team.\nThe winner is the last player with a character alive.\nGood luck!🍀")
         
         
        self.askPlayersName()
        self.TeamPlayerCreation()
    
        print("\n\n⚔️ LET'S FIGHT !⚔️\n\n")
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
        print("\n\n 🔉🔉 👑\(self.isWinner()) is the winner ! He/She won in \(self.Laps) laps 🔉🔉\n")

     }
}

//  Game.swift
//
//
//  Created by Elodie GAGE on 14/04/2022.
//
import Foundation
// commenter tout le code pour expliquer le code

public class Game {
    
    var laps = 0
    var playersArray : [Player] = [Player]()
    
    
    //func to verify if the name of player2 is the same as player1.
    func verifyPlayerName(player1: Player, player2: Player) -> Bool {
        if player1.name == player2.name {
            return true
        }
        else {
            return false
        }
    }
     
    // function public, asking both players to choose their name.Ended with a name verification.
   func askPlayersName() {
        print("\n\nPlayer 1, what's your name ?\n")
       if let name1 = readLine() {
        self.playersArray.append(Player(name: name1))
       }
        print("\nPlayer 2, what's your name ?\n")
       if let name2 = readLine() {
        self.playersArray.append(Player(name: name2))
       }
       //while the name of both players are the same we ask player2 to choose a new name.
         while verifyPlayerName(player1: self.playersArray[0], player2: self.playersArray[1]) {
              print("\n\nSorry player2,name taken, what's your name ?\n")
              if let name2 = readLine() {
                self.playersArray[1].name = name2
              }
         }
    }
    
     
    //Int Converter so we can translate the users answer to an Int and process it.
    private func input() -> Int {
        if let strData = readLine(),
           let intValue = Int(strData){
            return intValue
        }else{
            return 0
        }
    }
    
    // explanation
    func explainTeamCreation(){
        print("\n🔊Funniest Part!🔊\n\nCreation of your legendary cannon fodder ahem... I mean your Team.\n⚜️! Choose 3 fighters and their name 📝. \n\n")
    }
    
    // explanation
    func askCharactersName(){
            print("\n\nPlayer, choose your fighter name 📝.\n")
    }


    // function to ask the players to choose their 3 characters
    public func TeamPlayerCreation(){
                for player in playersArray {
                    var i = 0
                    var choice : Int
                    
                    repeat {
                        listingAllCharacters()// show list
                        choice = input()
                        if (choice > Character.CharacterType.allCases.count - 1) || (choice < 0) {
                            print("\nNo time for this, don't be shy and choose !\n")
                        }
                        else { // if the choice is in the cases
                            askCharactersName() // we ask a name for the fighter
                            let name = readLine()
                            if let n = name { //check if name is available
                                var isNameUnique: Bool = true
                                for character in player.characterPlayersChooseArray {
                                    if n == character.name{
                                        isNameUnique = false
                                    }
                                }
                                if isNameUnique { // if name is not taken then we put the character in the fighters array for the player
                                    let charactersPlayersChoice: Character = Character(name: n, type: Character.CharacterType.allCases[choice])
                                    player.characterPlayersChooseArray.append(charactersPlayersChoice)
                                    i += 1
                                    print("\n\(player.name), your \(charactersPlayersChoice.type) is named \(charactersPlayersChoice.name) ✅!\n")
                                }
                            }
                        }
                    }while i < 3 //
                }
    }

   public func listingAllCharacters() {
        var i = 0
        for character in Character.CharacterType.allCases {
            print("\n\(i) - \(character.rawValue) has \(character.maxLife()) Hp and come with \(character.weapon().name) as a weapon with \(character.weapon().damage) damage points.\n")
            i += 1
        }
    }
    
    // Public function to check if the game is over with a boolean.
    public func enOfTheGame() -> Bool{
        // for player in the PlayersArray, if the player's life is different than the isAlive func return, we return true.
        for player in playersArray{
            if !player.isAlive(){
                return true
            }
        }
            return false
    }
    
    // for player in the PlayersArray, we check if the player is alive with the isAlive(). If he is, we print his name and his life so we can see who is the winner
    public func isWinner() -> String{
        for player in playersArray{
            if player.isAlive(){
                return player.name
            }
        }
        return ""
    }
    
    // after the team creation, we print the team of each player.
    public func listingAllCharactersInPlayersTeam() {
        for player in playersArray {
                print("\n\(player.name)'s team:\n")
            for character in player.characterPlayersChooseArray {
                print("\(character.name) : \(character.description())")
            }
        }
    }
    
    // function to launch game within all steps (actions).
     func launchGame() {
         // Game explanation on start
             print("Welcome to: War is love!❤️‍🩹 \n\nTwo players will fight for their life. Each player will create a team composed by 3 characters.\nEvery player, warrior need a name! Don't forget to name your warriors.\nIt's a turn by turn game, each player will choose a character to attack the other player's character or to heal his team.\nThe winner is the last player with a character alive.\nGood luck!🍀")
         
         
        self.askPlayersName()
        self.explainTeamCreation()
        self.TeamPlayerCreation()
    
        print("\n\n⚔️ LET'S FIGHT !⚔️\n\n")
        var i = 0
        // while the game is not over, we launch the game with this loop and for every turn, every player we use func to do actions.
        repeat {
            let x = i%2 // we use the modulo because there is two Pkayers in the game
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
            self.laps = self.laps + 1 // we increment the laps counter every turn
        } while !self.enOfTheGame()
        //enOfTheGame is true, call the isWinner function to get the name of the winner and show numbers of laps
         print("END OF THE GAME")
         print("\n\n🔉🔉 👑 \(self.isWinner()) is the winner ! He/She won in \(self.laps) laps 🔉🔉\n. ")
         print("\(listingAllCharactersInPlayersTeam())")
     }
}

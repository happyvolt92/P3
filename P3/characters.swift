class Character {
    var name = ""
    var weapon: Weapon
    var life = 0
    let type: CharacterType
    
    
        init(name: String, type: CharacterType) {
            self.name = name
            // weapon enum
            self.weapon = type.weapon()
            //life is now combinate with life
            self.life = type.life()
            self.type = type
        }
    
        // so nothing else can be choose
        enum CharacterType: String {
                case warrior = "Warrior"
                case mage = "Mage"
                case colossus = "Colossus"
                case dwarf = "Dwarf"
    
            // func to sync characters's life
            func life() -> Int {
                switch self {
                    case .warrior: return 600
                    case .mage: return 800
                    case .colossus: return 900
                    case .dwarf: return 400
                }
            }
            // same func above but for weapon
            func weapon() -> Weapon {
                switch self {
                    case .warrior: return Sword()
                    case .mage: return Staff()
                    case .colossus: return IronFist()
                    case .dwarf: return Hammer()
                }
            }
        }//end enum
        
        // Fight
        func attack(character: Character){
            character.life = character.life - self.weapon.damage
            print("\(self.name) damaged \(character.name)by \(self.weapon.damage) !")
            if character.life < 0 {
                character.life = 0
            }
            print("\(character.name)has now \(character.life) HP\n")
        }
        
        // Heal -----Note for later: can't heal above Maxlife limit-----
        func heal(character : Character){
            character.life = character.life +  100
            print("\(CharacterType.mage) trow a healing spell on \(character.name) and give him back 100 HP.")
            print("\(character.name) has now \(character.life) HP. \n")
        }

        
       
}

 


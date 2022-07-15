class Character {
    var name = ""
    var weapon: Weapon
    var life = 0
    let type: CharacterType
    
    
        init(name: String, type: CharacterType) {
            self.name = name
            // weapon enum
            self.weapon = type.weapon()
            //life is now combinate with type
            self.life = type.maxLife()
            self.type = type
        }
    
        // function descripttion character
        func description() -> String{
            return (" 🪖  \(self.name), has \(self.life) on \(self.type.maxLife()) Hp ❤️, his weapon is \(self.weapon.name) with \(self.weapon.damage) damage💢")
        }
        
    
        // so nothing else can be choose, caseIterable for simplify choice.
        enum CharacterType: String, CaseIterable{
                case warrior = "Warrior"
                case mage = "Mage"
                case colossus = "Colossus"
                case dwarf = "Dwarf"
    
            // func to sync characters's life and return the max life of the character.
            func maxLife() -> Int {
                switch self {
                    case .warrior: return 600
                    case .mage: return 800
                    case .colossus: return 900
                    case .dwarf: return 400
                }
            }
            // func to sync characters's weapon and return the weapon of the character in a Weapon struct.
            func weapon() -> Weapon {
                switch self {
                    case .warrior: return Sword()
                    case .mage: return Staff()
                    case .colossus: return IronFist()
                    case .dwarf: return Hammer()
                }
            }
        }
      

        // Fight func. When character is attacked, he lose life with the enemy's weapon damage. if the life is less than 0, he is dead and we print a message.
        func attack(character: Character){
            character.life = character.life - self.weapon.damage
            print("\n💢💢 \(self.name) damaged \(character.name) by \(self.weapon.damage)💢💢 Pts!")
            print("\(character.name) has now \(character.life) HP ❤️‍🩹 \n")
        }
        
        // heal function
        func heal(character : Character){
            character.life = character.life +  100
            print("\(CharacterType.mage) trow a healing spell 🪬 on \(character.name) and gave back 100 Hp")
            print("\(character.name) has now \(character.life) Hp❤️‍🩹 \n")
        }

}

 


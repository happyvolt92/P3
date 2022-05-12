class Character {
    var name = ""
    var weapon : Weapon
    var life = 0
    
    
    init(name : String, life : Int, weapon : Weapon) {
        self.name = name
        self.life = life
        self.weapon = weapon
    }
        
        func attack( character : Character){
            character.life = character.life - self.weapon.damage
            print("\(self.name) damaged \(character.name)by \(self.weapon.damage) ! ")
       
    }
    
    
    
}

 


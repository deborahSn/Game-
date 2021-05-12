//
//  Player.swift
//  Fighter Game
//
//  Created by Déborah Suon on 23/02/2021.
//

import Foundation



// initialization of the class player


class Player{
    
    var name: String
    var characters: [Character] = []
    var uniqueNames: [String] = []
    init(name: String){
        self.name = name
        createCharacters()
    }
    
    
    func createCharacters() {
        print("player créé")
        for _ in 0..<3 {
            guard let character = createCharacter() else { return }
            characters.append(character)
        }
        
    }
    
    
    
    
    // function to enter the name of the player
    func createName() -> String {
        var name = ""
        print("Veuillez entrer le nom du personnage?")
        while name == "" {
            if let playerName = readLine(){
                if uniqueNames.contains(name) {
                    print("")
                    print("Ce nom est déjà utilisé. Définissez un autre nom.")
                    name = ""
                } else {
                    uniqueNames.append(name)
                    print("Le choix de votre nom est validé!")
                }
                
                name = playerName
            }
        }
        return name
    }
    
    // Create the different characters and name it
    func createCharacter() -> Character? {
        print("\nVous avez actuellement \(characters.count) personnage(s) dans votre équipe (\(characters.count)/3)\n")
        print(""
                + "\n1. Insérez 1 pour choisir Fighter"
                + "\n2. Insérez 2 pour choisir Dwarf"
                + "\n3. Insérez 3 pour choisir Colossus"
                + "\n4. Insérez 4 pour choisir Wizard"
        )
        var userChoice = 0
        
        while userChoice == 0 {
            if let readline = readLine() {
                if let choose = Int(readline) {
                    userChoice = choose
                }
            }
        }
        
        switch userChoice {
        case 1:
            let fighter = Fighter(name: createName())
            return fighter
        case 2:
            let colossus = Colossus(name: createName())
            return colossus
        case 3:
            let dwarf = Dwarf(name: createName())
            return dwarf
        case 4:
            let wizard = Wizard(name: createName())
            return wizard
          
        default:
            break
        }
        return nil
    }
    
    
    func list() {
        print("Voici les trois personnages :")
        for character in characters {
            print("\(character.charactersName), \(character.weapon.weaponName), \(character.lifePoint)")
        }
    }
 
    // func who check if a character is dead and remove it if he is.
        func checkTeamLife() {
            var incremention = 0
            
            for _ in characters {
                if characters[incremention].lifePoint <= 0 {
                    print("\(characters[incremention].charactersName) n'a plus de lifePoint. Le personnage est éliminé!")
                    characters.remove(at: incremention)
                    
                    break
                } else {
                    print("")
                }
                
                incremention += 1
            }
        }
    
    func isDead() -> Bool {
        var isDead = false
        for character in characters {
            if character.lifePoint <= 0 {
                isDead = true
            } else {
                return false
            }
        }
        return isDead
    }
}



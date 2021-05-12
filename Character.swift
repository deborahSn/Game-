//
//  Characters.swift
//  Fighter Game
//
//  Created by Déborah Suon on 16/02/2021.
//

import Foundation

// initialization of Characters

class Character{
    var charactersName : String
    var weapon : Weapon
    var lifePoint : Int
   
    
    
    init(charactersName: String, weapon: Weapon, lifePoint: Int) {
        self.charactersName = charactersName
        self.weapon = weapon
        self.lifePoint = lifePoint
        
    }
    // fontion de l'attaque sur la cible désignée
    func attack(target: Character){
        print("\(charactersName) attaque \(target.charactersName)")
        target.lifePoint -= weapon.damage
        
    }
    
    func heal(target: Character){
        if target.lifePoint <= 0 {
            print("On ne peut pas soigner les morts.")
        } else {
            target.lifePoint += weapon.damage
            if target.lifePoint > 100 {
                target.lifePoint = 100
            }
            print("Le personnage choisit est soigné.")
            print("")
        }
    }
}



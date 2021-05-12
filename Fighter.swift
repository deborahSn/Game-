//
//  Fighter.swift
//  Fighter Game
//
//  Created by Déborah Suon on 16/02/2021.
//

import Foundation


// Fighter character


class Fighter : Character{
    init(name: String) {
        super.init(charactersName: name, weapon: Sword(), lifePoint: 100)
    }
}


// End of the class

   

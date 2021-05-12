   //
//  Game.swift
//  Fighter Game
//
//  Created by Déborah Suon on 18/02/2021.
//

import Foundation


class Game {
    
    // MARK: - properties
    
    private var players: [Player] = []
    private var turn = 0
    private func createPlayers() {
        for i in 0..<2 {
            print("Player n°\(i+1)")
            players.append(Player(name: "joueur \(i+1)"))
        }
    }
    
    func start(){
        rules()
        createPlayers()
        battle()
        checkWinner()
        
    }
    // func who explain rules of the game
    private func rules() {
        print("====================================")
        print("Bienvenue dans un JEU DE COMBAT!🥊 \n")
        print("====================================")
        print("")
        print("Voici les règles:")
        print("")
        print("Le jeu opposera deux joueurs. Le but est d'éliminer tous les personnages ennemis.Chaque joueur devra constituer son équipe avec trois personnages.Une fois les équipes constituées, les deux joueurs vont s'affronter tour à tour jusqu'à ce qu'une des deux équipes n'aient plus aucun personnage. A chaque tour, le joueur aura soit la possibilité de soigner un membre de son équipe, soit d'attaquer l'équipe adverse. Le joueur dont l'équipe est vide perd donc la partie.Durant la partie, un coffre pourra apparaître au hasard. Le joueur qui l'obtiendra aura une arme qui causera des dégats plus importants.")
        print("Que le meilleur gagne!💪🏼\n")
        print("")
        print("-----------------------------------")
    }
    
    private func battle() {
        print("")
        print("")
        print("Les équipes sont au complet!!!\n")
        print("")
        print("=========================")
        print("👊-----DÉBUT DU COMBAT-----👊")
        print("")
        while true {
            turn += 1
            for i in 0..<2 {
                //afficher les personnages du player1
                print("→ Voici les trois personnages de votre équipe:")
                print("")
                players[i].list()
                //l'utilisateur choisit son personnage
                print("")
                print("Veuillez choisir un personnage de votre équipe:")
                
                let allyCharacter = players[i].characters[userChoice()-1]
                chest(character: allyCharacter)
                // proposer si soigner oau attaquer
                chooseAction()
                if healOrAttack() == 1 {
                    //affichage des personnages du player2
                    print("Voici les personnages du joueur adverse:")
                    print("")
                    players[i % 2 == 0 ? 1 : 0].list()
                    //l'utilisateur choisit le personnage qu'il veut attaquer
                    print("")
                    print("Veuillez choisir le personnage de l'équipe adverse qui subira l'attaque.")
                    //le personnage de l'equipe1 attaque celui de l'equipe2
                    print("Le personnage choisit attaque le personnage ennemi!🤼‍♂️")
                    let ennemyCharacter = players[i % 2 == 0 ? 1 : 0].characters[userChoice()-1]
                    allyCharacter.attack(target: ennemyCharacter)
                    
                    if players[i%2 == 0 ? 1 : 0].isDead() {
                        return
                    }
                    
                } else{
                    print("Quel personnage souhaites-tu soigner?")
                    players[i].list()
                    let healCharacter = players[i].characters[userChoice()-1]
                    allyCharacter.heal(target: healCharacter)
                }
                
            }
            
        }
    }
    
    private func userChoice() -> Int {
        var userChoice = 0
        
        while userChoice != 1 && userChoice != 2 && userChoice != 3 {
            if let readline = readLine() {
                if let choose = Int(readline) {
                    userChoice = choose
                }
            }
        }
        return userChoice
    }
    // fonction qui vérifie si le tableau des personnages de chaque équipe est vide ou non. Si une équipe est vide, le joueur concerné a perdu.
    private func checkWinner() {
        if players[0].isDead() {
            print("Tous les personnages du joueur 1 sont morts.")
            print("")
            print("LE JOUEUR 2 A GAGNÉ!🏆")
            
        }else {
            print("Tous les personnages du joueur 2 sont morts.")
            print("")
            print("LE JOUEUR 1 A GAGNÉ!🏆")
            
        }
        print("")
        print("Le jeu s'est déroulée en \(turn) tours.")
    }
    
    // fonction qui permet de déclencher le coffre fort et donner au joueur une arme plus puissante à son personnage
    private func chest(character: Character) {
        let randomInt = Int.random(in: 1...4)
        if randomInt == 2 {
            character.weapon = SuperHammer()
            print("=============")
            print("Félicitations, vous avez gagné une nouvelle arme plus puissante qui inflige plus de dégâts!")
            print("=============")
            print("")
        }
    }
    // fonction qui propose à l'utilisateur de choisir son action lors de son tour
    private func chooseAction() {
        print("")
        print("")
        print("Quelle action voulez-vous sélectionner?")
        print("")
        print("1. Attack 🤼‍♂️")
        print("2. Heal 💊")
        print("")
    }



    // fonction pour obtenir le choix de l'utilisateur
    private func healOrAttack() -> Int {
        var userChoice = 0
        repeat {
            if let data = readLine() {
                if let dataToInt = Int(data) {
                    userChoice = dataToInt
                }
            }
        } while userChoice != 1 && userChoice != 2
        return userChoice
    }

}











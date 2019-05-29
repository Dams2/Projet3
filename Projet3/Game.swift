//
//  Game.swift
//  Projet3
//
//  Created by Damien Rojo on 29/05/2019.
//  Copyright © 2019 Soa. All rights reserved.
//

import Foundation

final class Game {
    
    var player: [Player] = []
    
    // MARK: - Game logic
    
    func start() {
        
        let player1 = Player(name: "Équipe 1", team: [])
        let player2 = Player(name: "Équipe 2", team: [])
        
        if let input: String = readLine(){
            if let int = Int(String?(input)!) {
                settings(input: int, nameInput: input, player: &player1.team )
                print(player1.team[0].name)
            }
        }
        //play()
        //end()
    }
    
    // Créer les 2 Players (donner un nom)
    // Pour chacun: Créer leur équipe de character (name, type)
    func settings(input: Int, nameInput: String, player: inout [Character]) {
        
        switch input {
        case 1:
            let dwarf = Character.init(name: nameInput, type: CharacterType.dwarf, weapon: Weapon.init(type: WeaponType.axe))
            print("Vous avez choisi le nain")
            player.append(dwarf)
            print("Nommez votre personnage")
        case 2:
            let warrior = Character.init(name: nameInput, type: CharacterType.warrior , weapon: Weapon.init(type: WeaponType.sword))
            print("Vous avez choisi le combattant")
            player.append(warrior)
        case 3:
            let colossus = Character.init(name: nameInput, type: CharacterType.colossus , weapon: Weapon.init(type: WeaponType.lance))
            print("Vous avez choisi le colosse")
            player.append(colossus)
        case 4:
            let magus = Character.init(name: nameInput, type: CharacterType.magus , weapon: Weapon.init(type: WeaponType.rosary))
            print("Vous avez choisi le mage")
            player.append(magus)
        default:
            print("Choix non reconnu")
        }
        
    }
    
    // Selectionner un character chez player 1
    // Selectionner un character chez player 2
    // Resolution des combats
    // On reboucle tant que les 2 players ont au moins un chracacter vivant qui n'est pas un magus.
    func play() {
        
    }
    
    func end() {
        
    }
}

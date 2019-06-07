//
//  Game.swift
//  Projet3
//
//  Created by Damien Rojo on 29/05/2019.
//  Copyright © 2019 Soa. All rights reserved.
//

import Foundation

final class Game {
    
    private let playerQuantity = 2
    private let characterQuantity = 3
    private var players: [Player] = []
    private var names: [String] = []

    // MARK: - Game logic
    
    func start() {
        settings()
        play()
        end()
    }
    
    private func settings() {
        var playerCounter = 1
        repeat {
            let name = createName()
            let team = createTeam()
            let player = Player(name: name, team: team)
            players.append(player)
            playerCounter += 1
        } while playerCounter <= playerQuantity
    }
    
    private func createName() -> String {
        var name = ""
        print("Merci d'entrer votre nom:")
        var errorCounter = 0
        repeat {
            if errorCounter >= 1 {
                print("Merci d'entrer un nom valide, et non deja utilisé ☝️")
            }
            if let stringInput = readLine() {
                name = stringInput
            } else {
                name = ""
            }
            errorCounter += 1
        } while name == "" || names.contains(name)
        names.append(name)
        return name
    }
    
     func createTeam() -> [Character] {
        var characters: [Character] = []
        var characterCounter = 1
        var choice = 0
        let characterChoice = CharacterType.init(rawValue: choice)
        var errorCounter = 0
        repeat {
            if errorCounter >= 1 {
                print("Merci d'entrer un numéro valide ☝️")
            }
            if let intInput = readLine() {
                choice = Int(intInput)!
            } else {
                choice = 0
            }
            errorCounter += 1
            let character = Character(name: createName(), type: characterChoice!)
            characters.append(character)
            characterCounter += 1
        } while characterCounter <= characterQuantity
        // Creer un personnage
        // Lui donner un nom
        // Lui donner un type
        
        return characters
    }
    
    // Créer les 2 Players (donner un nom)
    // Pour chacun: Créer leur équipe de character (name, type)

    
    // Selectionner un character chez player 1
    // Selectionner un character chez player 2
    // Resolution des combats
    // On reboucle tant que les 2 players ont au moins un chracacter vivant qui n'est pas un magus.
    private func play() {
        
    }
    
    private func end() {
        
    }
}

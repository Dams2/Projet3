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
       // settings()
        play()
       // end()
    }
    
    // MARK: - Settings
    
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
    
    private func createTeam() -> [Character] {
        var characters: [Character] = []
        var characterCounter = 1
        repeat {
            print("repeat")
            let name = createName()
            let type = chooseCharacterType()
            let character = Character(name: name, type: type)
            characters.append(character)
            characterCounter += 1
        } while characterCounter <= characterQuantity
        print("Vous avez choisi", characters.count)
        return characters
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
    
    private func chooseCharacterType() -> CharacterType {
        var chosenIndex: Int? = nil
        var chosenType: CharacterType? = nil
        print("Merci de choisir un personnage:")
        var errorCounter = 0
        repeat {
            if errorCounter >= 1 {
                print("Merci d'entrer un numéro valide ☝️")
            }
            if let stringInput = readLine(), let intInput = Int(stringInput), let type = CharacterType(rawValue: intInput) {
                chosenType = type
            } else {
                chosenType = nil
                chosenIndex = nil
            }
            errorCounter += 1
        } while chosenIndex == nil || chosenType == nil
        return chosenType!
    }
    
    // MARK: - Play
    
    private func play() {
        repeat {
            let attacker = players[0]
            let defender = players[1]
            // Selectionner un character chez player 1
            print("Sélectionnez un personnage dans votre équipe 👇")
            let selectedCharacter = chooseCharacter(at: chooseIndex(), in: attacker.team)
            
            
            // Selectionner un character chez player 2 ou player 1 (selon le type de character selectionné chez player 1)
            // Résolution des combats
            // Impression du recap
            players.swapAt(0, 1)
        } while players[0].team.contains(where: { $0.isAlive && $0.type != .magus })
            && players[1].team.contains(where: { $0.isAlive && $0.type != .magus })
        // Go to end
    }
    
    private func chooseCharacter(at index: Int, in team: [Character]) -> Character {
        
        return
    }
    
    private func chooseIndex() -> Int {
        
        return //
    }

    // MARK: - End
    
    private func end() {
    }
}


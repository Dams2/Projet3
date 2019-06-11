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
        repeat {
            print("repeat")
            let chooseCharacter = chooseCharacterType()
            let chooseName = createName()
            let character = Character(name: chooseName, type: chooseCharacter)
            characters.append(character)
            characterCounter += 1
        } while characterCounter <= characterQuantity
        print("Vous avez choisi", characters.count)
        return characters
    }
    
    private func chooseCharacterType() -> CharacterType {
        //// Code pour selectionner un type et le renvoyer
        var choose: Int?
        print("Merci de choisir un personnage:")
        var errorCounter = 0
        repeat {
            if errorCounter >= 1 {
                print("Merci d'entrer un numéro valide ☝️")
            }
            if let intInput = readLine() {
                choose = Int(intInput)
            } else {
                choose = nil
            }
            errorCounter += 1
        } while choose == nil
        //// Indice: return CharacterType(rawValue: entrée utilisateur au format Int)
    return CharacterType(rawValue: choose!)!
    }
    
    private func play() {
        // Selectionner un character chez player 1
        // Selectionner un character chez player 2
        // Resolution des combats
        // On reboucle tant que les 2 players ont au moins un chracacter vivant qui n'est pas un magus.
    }

    private func end() {
    }
}

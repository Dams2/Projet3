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
    private var numberOfTurns = 0
    private var deadRemove = 0
    
    // MARK: - Game logic
    
    func start() {
        settings()
        play()
        end()
    }
    
    // MARK: - Settings
    
    private func settings() {
        var playerCounter = 1
        repeat {
            if playerCounter == 1 {
                print("Joueur 1️⃣")
            } else {
                print("\nJoueur 2️⃣")
            }
            print("Merci d'entrer votre nom:")
            let name = createName()
            let team = createTeam()
            let player = Player(name: name, team: team)
            players.append(player)
            playerCounter += 1
        } while playerCounter <= playerQuantity
    }
    
    private func createTeam() -> [Character] {
        var characterCounter = 1
        var characters: [Character] = []
        repeat {
            print("\nMerci d'entrer un nom de personnage: ")
            let name = createName()
            print("\nMerci de choisir un personnage:")
            let type = chooseCharacterType()
            let character = Character(name: name, type: type)
            characters.append(character)
            characterCounter += 1
        } while characterCounter <= characterQuantity
        print("\nVoici votre équipe :")
        characters.forEach {
            print($0.description)
        }
        return characters
    }
    
    private func createName() -> String {
        var name = ""
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
        var chosenType: CharacterType? = nil
        print("0.", CharacterType.dwarf, "-> PV: 60 / Attaque: 30 \n1.",CharacterType.warrior, "-> PV: 60 / Attaque: 30 \n2.", CharacterType.colossus, "-> PV: 60 / Attaque: 30 \n3.",CharacterType.magus, "-> PV: 60 / soin: 30\n")
        print("Pour choisir veuillez entrer un numéro:")
        var errorCounter = 0
        repeat {
            if errorCounter >= 1 {
                print("Merci d'entrer un numéro valide ☝️")
            }
            if let stringInput = readLine(), let intInput = Int(stringInput), let type = CharacterType(rawValue: intInput) {
                chosenType = type
                print("Vous avez choisi:", type)
            } else {
                chosenType = nil
            }
            errorCounter += 1
        } while chosenType == nil
        return chosenType!
    }
    
    // MARK: - Play
    
    private func play() {
        repeat {
            numberOfTurns += 1
            let attacker = players[0]
            let defender = players[1]
            // Selectionner un character chez player 1
            print("\n\(attacker.name)")
            print("Sélectionnez un personnage dans votre équipe 👇")
            attacker.printTeamDescription()
            print("Entrez un numéro de 0 à \(attacker.team.count - 1)")
            let selectedCharacter = chooseCharacter(at: chooseIndex(), in: attacker.team)
            print("Vous avez choisi: \(selectedCharacter.name)")
            
            // Génération aléatoire d'un coffre
            let chest = Chest()
            if let weapon = chest.generateRandomWeapon() {
                // p-e print le changement d'arme etc..
                print("Un coffre est apparu 🤞 ")
                selectedCharacter.updateWeapon(with: weapon) { (result) in
                    switch result {
                    case .success:
                        print("\(selectedCharacter.name) a changé d'arme, il a reçu \(weapon.type.rawValue) 🙏")
                    case .unsuccess:
                        print("L'arme n'est pas compatible 👎")
                    }
                }
            }
            
            var targetedCharacter: Character? = nil
            if selectedCharacter.type == .magus {
                print("\nChoisissez un personnage à soigner 💉")
                attacker.printTeamDescription()
                print("Entrez un numéro de 0 à \(attacker.team.count - 1)")
                targetedCharacter = chooseCharacter(at: chooseIndex(), in: attacker.team)
                print("\(selectedCharacter.name) soigne: \(targetedCharacter?.name ?? "Missing Name ☝️")")

            } else {
                print("\nChoisissez un personnage à attaquer 🔪")
                defender.printTeamDescription()
                print("Entrez un numéro de 0 à \(defender.team.count - 1)")
                targetedCharacter = chooseCharacter(at: chooseIndex(), in: defender.team)
                print("\(selectedCharacter.name) attaque: \(targetedCharacter?.name ?? "Missing Name ☝️")")
            }
            targetedCharacter?.updateLife(with: selectedCharacter.weapon.action)
            // Impression du recap
            print("\nRecap :")
            print("\(attacker.name)👇")
            attacker.printTeamDescription()
            print("\n\(defender.name)👇")
            defender.printTeamDescription()
            if targetedCharacter?.life == 0 {
                print("\n\(targetedCharacter?.name ?? "Missing Name ☝️") est mort ⚰️")
                defender.team.remove(at: deadRemove)
            }
            players.swapAt(0, 1)
        } while players[0].team.contains(where: { $0.isAlive && $0.type != .magus })
            && players[1].team.contains(where: { $0.isAlive && $0.type != .magus })
    }
    
    private func chooseCharacter(at index: Int, in team: [Character]) -> Character {
        deadRemove = index
        var inputValidation = true
        repeat {
            if index > team.count {
                inputValidation = false
                print("Merci d'entrer un numéro valide ☝️")
                return chooseCharacter(at: chooseIndex(), in: team)
            }
           inputValidation = true
        } while inputValidation == false
        return team[index]
    }
    
    private func chooseIndex() -> Int {
        var chosenIndex: Int?
        var errorCounter = 0
        repeat {
            if errorCounter >= 1 {
                print("Merci d'entrer un numéro valide ☝️")
            }
            if let stringInput = readLine(), let intInput = Int(stringInput) {
                chosenIndex = intInput
            } else {
                chosenIndex = nil
            }
            errorCounter += 1
        } while chosenIndex == nil
        return chosenIndex!
    }
    
    // MARK: - End
    
    private func end() {
        print("\nFin de la Partie\nNombre de tour:", numberOfTurns)
        if players[0].team.contains(where: { $0.isAlive && $0.type != .magus }) {
            print("\nle gagnant est -> \(players[0].name) félicitation 👏👏👏👏")
        } else if players[1].team.contains(where: { $0.isAlive && $0.type != .magus }) {
        print("\nle gagnant est -> \(players[1].name) félicitation 👏👏👏👏")
        }
    }
}

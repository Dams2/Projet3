//
//  Character.swift
//  Projet3
//
//  Created by Damien Rojo on 29/05/2019.
//  Copyright © 2019 Soa. All rights reserved.
//

import Foundation

/// Doc... 🙇‍♂️
enum CharacterType: Int {
    case dwarf = 0
    case warrior = 1
    case colossus = 2
    case magus = 3
}

// Tips: let type = CharacterType(rawValue: 2) <- metre la veleur entrée par l'utilisateur.

/// Doc for character
final class Character {

    // MARK: - Properties

    let name: String

    let type: CharacterType

    var weapon: Weapon

    private(set) var life: Int
    private var maxLife: Int

    var isAlive: Bool {
        return life > 0
    }

    var description: String {
        return "\(name) | \(type) | life: \(life)/\(maxLife)"
    }

    // MARK: - Initializer

    init(name: String, type: CharacterType) {
        self.name = name
        self.type = type

        switch self.type {
        case .dwarf:
            self.life = 60
            self.weapon = Weapon(type: .axe)
        case .warrior:
            self.life = 100
            self.weapon = Weapon(type: .sword)
        case .colossus:
            self.life = 120
            self.weapon = Weapon(type: .lance)
        case .magus:
            self.life = 80
            self.weapon = Weapon(type: .rosary)
        }
        self.maxLife = life
    }

    func updateLife(with action: ActionType) {
        switch action {
        case .damage(value: let value):
            if value >= life {
                life = 0
            } else {
                life -= value
            }
        case .heal(value: let value):
            if isAlive {
                if (value + life) > maxLife {
                    life = maxLife
                } else {
                    life += value
                }
            }
        }
    }

    func updateWeapon(with weapon: Weapon, callback: (Result) -> Void) {
        if self.type == .magus, case .heal = weapon.action {
            self.weapon = weapon
            callback(.success)
        } else if self.type != .magus, case .damage = weapon.action {
            self.weapon = weapon
            callback(.success)
        } else {
            callback(.unsuccess)
        }
    }
    
    enum Result {
        case success
        case unsuccess
    }
}

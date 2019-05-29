//
//  Character.swift
//  Projet3
//
//  Created by Damien Rojo on 29/05/2019.
//  Copyright © 2019 Soa. All rights reserved.
//

import Foundation

enum CharacterType {
    case dwarf
    case warrior
    case colossus
    case magus
}

// Name
// Type
// Life
// Weapon
final class Character {
    
    // MARK: - Private properties
    
    let name: String
    
    let type: CharacterType
    
    let life: Int
    
    let weapon: Weapon
    
    
    // MARK: - Initializer
    
    init(name: String, type: CharacterType, weapon: Weapon) {
        self.name = name
        self.type = type
        self.weapon = weapon
        
        switch self.type {
        case .dwarf: self.life = 60
        case .warrior: self.life = 100
        case .colossus: self.life = 120
        case .magus: self.life = 80
        }
    }
}

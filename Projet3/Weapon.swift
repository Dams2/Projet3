//
//  Weapon.swift
//  Projet3
//
//  Created by Damien Rojo on 29/05/2019.
//  Copyright © 2019 Soa. All rights reserved.
//

import Foundation

/// This enum list all the weapon type available, here you'll need to add more if needed.
enum WeaponType {
    case axe
    case sword
    case lance
    case rosary
}

/// This class represent a weapon
final class Weapon {
    
    // Mark: - Properties
    
    let type: WeaponType
    
    let power: Int
    
    // Mark: - Initializer
    
    init(type: WeaponType) {
        self.type = type
        
        switch self.type  {
        case .axe: self.power = 30
        case .sword: self.power = 20
        case .lance: self.power = 15
        case .rosary: self.power = -20
        }
    }
}


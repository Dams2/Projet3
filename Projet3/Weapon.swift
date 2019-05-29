//
//  Weapon.swift
//  Projet3
//
//  Created by Damien Rojo on 29/05/2019.
//  Copyright © 2019 Soa. All rights reserved.
//

import Foundation

enum WeaponType {
    case axe
    case sword
    case lance
    case rosary
}

// Type
// Power
final class Weapon {
    
    // Mark: - Private property
    
    let power: Int
    
    let type: WeaponType
    
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

//
//  Weapon.swift
//  Projet3
//
//  Created by Damien Rojo on 29/05/2019.
//  Copyright © 2019 Soa. All rights reserved.
//

import Foundation

/// This enumeration lists the action of a weapon
enum ActionType {
    case heal(value: Int)
    case damage(value: Int)
}

/// This enum list all the weapon type available.
enum WeaponType: String {
    case axe = "Hache"
    case sword = "Épée"
    case lance = "Lance"
    case rosary = "Résurection"
    case superAxe = "Super Hache"
    case superSword = "Super épée"
    case superLance = "Super Lance"
    case superRosary = "Super Résurection"
}

/// This class represent a weapon.
final class Weapon {
    
    // Mark: - Properties
    
    let type: WeaponType
    
    var action: ActionType
    
    // Mark: - Initializer
    
    init(type: WeaponType) {
        self.type = type
        
        switch self.type  {
        case .axe:
            self.action = .damage(value: 30)
        case .sword:
            self.action = .damage(value: 20)
        case .lance:
            self.action = .damage(value: 15)
        case .rosary:
            self.action = .heal(value: 20)
        case .superAxe:
            self.action = .damage(value: 45)
        case .superSword:
            self.action = .damage(value: 30)
        case .superLance:
            self.action = .damage(value: 25)
        case .superRosary:
            self.action = .heal(value: 25)
        }
    }
}

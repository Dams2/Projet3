//
//  Chest.swift
//  Projet3
//
//  Created by Damien Rojo on 29/05/2019.
//  Copyright © 2019 Soa. All rights reserved.
//

import Foundation

/// This class represent a chest .
final class Chest {
    
    // Mark: - Properties
    
    private var weapons = [
        Weapon(type: .superAxe),
        Weapon(type: .superLance),
        Weapon(type: .superSword),
        Weapon(type: .superRosary)
    ]

    // MARK: - Method

    func generateRandomWeapon() -> Weapon? {
        let index = Int.random(in: 0...19)
        guard index < weapons.count else { return nil }
        return weapons[index]
    }
}

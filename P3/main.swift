//
//  main.swift
//  P3
//
//  Created by Elodie GAGE on 14/04/2022.
//

import Foundation

func isNameUnique(name: String, other: [String]) -> Bool {
    for str in other {
        if name === other {return false}
    }
    return true
}



//
//  InstructionStep.swift
//  Recipes
//
//  Created by Abdullah Hafiz on 20/09/1446 AH.
//

import Foundation

struct InstructionStep: Codable, Identifiable, Hashable {
    let number: Int
    let step: String

    var id: Int { number }
}


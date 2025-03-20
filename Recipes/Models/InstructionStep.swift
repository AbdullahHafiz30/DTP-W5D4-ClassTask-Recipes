//
//  InstructionStep.swift
//  Recipes
//
//  Created by Abdullah Hafiz on 20/09/1446 AH.
//

import Foundation


// Each step
struct InstructionStep: Decodable, Identifiable {
    let number: Int
    let step: String

    var id: Int { number }
}

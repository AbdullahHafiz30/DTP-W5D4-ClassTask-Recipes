//
//  AnalyzedInstruction.swift
//  Recipes
//
//  Created by Abdullah Hafiz on 20/09/1446 AH.
//

import Foundation

// Steps are inside "analyzedInstructions"
struct AnalyzedInstruction: Decodable {
    let steps: [InstructionStep]
}


//
//  Untitled.swift
//  RockPaperScissors
//
//  Created by murad on 16.05.2026.
//

enum Choices {
    case rock, paper, scissors
    
    var emoji: String {
        switch self {
        case .rock:
            "✊"
        case .paper:
            "✋"
        case .scissors:
            "✌️"
        }
    }
    
    var label: String {
        switch self {
        case .rock:
            "Rock"
        case .paper:
            "Paper"
        case .scissors:
            "Scissors"
        }
    }
}

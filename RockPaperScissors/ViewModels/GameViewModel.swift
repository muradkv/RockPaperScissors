//
//  GameViewModel.swift
//  RockPaperScissors
//
//  Created by murad on 16.05.2026.
//

import SwiftUI

class GameViewModel: ObservableObject {
    @Published private(set) var computerMove = Choices.rock
    @Published private(set) var currentRound = 1
    @Published private(set) var score = 0
    @Published private(set) var playerMustWin = true
    @Published var gameEnded = false
    
    private let totalRounds = 5
    
    init() {
        prepareNextRound()
    }
    
    private func generateComputerMove() {
        let moves: [Choices] = [.rock, .paper, .scissors]
        computerMove = moves.randomElement()!
    }
    
    private func generateWinCondition() {
        playerMustWin = Bool.random()
    }
    
    private func prepareNextRound() {
        generateComputerMove()
        generateWinCondition()
    }
    
    func resetGame() {
        currentRound = 1
        score = 0
        prepareNextRound()
    }
    
    private func determineGameResult(compChoice: Choices, playerChoice: Choices) -> GameResult {
        switch (compChoice, playerChoice) {
        case (.rock, .paper), (.paper, .scissors), (.scissors, .rock):
            return .playerWin
        case (let comp, let player) where comp == player:
            return .tie
        default:
            return .playerLose
        }
    }
    
    func processPlayerMove(_ move: Choices) {
        let result = determineGameResult(compChoice: computerMove, playerChoice: move)
        
        var earned = false
        if playerMustWin && result == .playerWin {
            earned = true
        } else if !playerMustWin && result == .playerLose {
            earned = true
        }
        
        if earned { score += 1 }
        
        if currentRound == totalRounds {
            gameEnded = true
        } else {
            currentRound += 1
            prepareNextRound()
        }
    }
}

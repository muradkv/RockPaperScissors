//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by murad on 15.05.2026.
//

import SwiftUI

struct ContentView: View {
    @State private var computerMove = Choices.rock
    @State private var currentRound = 1
    @State private var score = 0
    @State private var playerMustWin = true
    @State private var gameEnded = false
        
    enum Choices {
        case rock, paper, scissors
    }
    
    enum GameResult {
        case playerWin, playerLose, tie
    }
    
    var body: some View {
        VStack {
            Spacer()
            
            VStack(spacing: 30) {
                Text("Round \(currentRound)")
                    .font(.title)
                Text(playerMustWin ? "You must WIN this round" : "You must LOSE this round")
                    .font(.title2)
                Text("Current app choice \(computerMove)")
                    .font(.title3)
            }
            
            Text("Score \(score)")
                .font(.title)
                .padding(.top, 30)
            
            Spacer()
            Spacer()
            
            HStack(spacing: 30) {
                Button {
                    processPlayerMove(.rock)
                } label: {
                    Text("Rock")
                        .font(.title)
                }
                
                Button {
                    processPlayerMove(.paper)
                } label: {
                    Text("Paper")
                        .font(.title)
                }
                
                Button {
                    processPlayerMove(.scissors)
                } label: {
                    Text("Scissors")
                        .font(.title)
                }
            }
            
            Spacer()
        }
        .padding()
        .alert("Game Over", isPresented: $gameEnded) {
            Button("Play Again") {
                resetGame()
            }
        } message: {
            Text("Your final score is \(score) out of 5")
        }
    }
    
    func generateComputerMove() {
        let moves: [Choices] = [.rock, .paper, .scissors]
        computerMove = moves.randomElement()!
    }
    
    func generateWinCondition() {
        playerMustWin = Bool.random()
    }
    
    func prepareNextRound() {
        generateComputerMove()
        generateWinCondition()
    }
    
    func resetGame() {
        currentRound = 1
        score = 0
        prepareNextRound()
    }
    
    func determineGameResult(compChoice: Choices, playerChoice: Choices) -> GameResult {
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
        
        if currentRound == 5 {
            gameEnded = true
        } else {
            currentRound += 1
            prepareNextRound()
        }
    }
}

#Preview {
    ContentView()
}

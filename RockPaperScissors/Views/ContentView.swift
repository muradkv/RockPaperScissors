//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by murad on 15.05.2026.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = GameViewModel()
        
    var body: some View {
        VStack {
            Spacer()
            
            VStack(spacing: 30) {
                Text("Round \(viewModel.currentRound)")
                    .font(.title)
                Text(viewModel.playerMustWin ? "You must WIN this round" : "You must LOSE this round")
                    .font(.title2)
                Text("Current app choice \(viewModel.computerMove)")
                    .font(.title3)
            }
            
            Text("Score \(viewModel.score)")
                .font(.title)
                .padding(.top, 30)
            
            Spacer()
            Spacer()
            
            HStack(spacing: 20) {
                GameButtonView(emoji: "✊", label: "Rock") {
                    viewModel.processPlayerMove(.rock)
                }
                
                GameButtonView(emoji: "✌️", label: "Scissors") {
                    viewModel.processPlayerMove(.scissors)
                }
                
                GameButtonView(emoji: "✋", label: "Paper") {
                    viewModel.processPlayerMove(.paper)
                }
            }
            
            Spacer()
        }
        .padding()
        .alert("Game Over", isPresented: $viewModel.gameEnded) {
            Button("Play Again") {
                viewModel.resetGame()
            }
        } message: {
            Text("Your final score is \(viewModel.score) out of 5")
        }
    }
}

#Preview {
    ContentView()
}

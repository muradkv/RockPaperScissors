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
            
            HStack(spacing: 30) {
                Button {
                    viewModel.processPlayerMove(.rock)
                } label: {
                    Text("Rock")
                        .font(.title)
                }
                
                Button {
                    viewModel.processPlayerMove(.paper)
                } label: {
                    Text("Paper")
                        .font(.title)
                }
                
                Button {
                    viewModel.processPlayerMove(.scissors)
                } label: {
                    Text("Scissors")
                        .font(.title)
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

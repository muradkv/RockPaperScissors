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
                ComputerChoiceView(
                    emoji: viewModel.computerMove.emoji,
                    label: viewModel.computerMove.label
                )
            }
            
            Text("Score \(viewModel.score)")
                .font(.title)
                .padding(.top, 30)
            
            Spacer()
            Spacer()
            
            HStack(spacing: 20) {
                GameButtonView(
                    emoji: Choices.rock.emoji,
                    label: Choices.rock.label
                ) {
                    viewModel.processPlayerMove(.rock)
                }
                
                GameButtonView(
                    emoji: Choices.scissors.emoji,
                    label: Choices.scissors.label
                ) {
                    viewModel.processPlayerMove(.scissors)
                }
                
                GameButtonView(
                    emoji: Choices.paper.emoji,
                    label: Choices.paper.label
                ) {
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

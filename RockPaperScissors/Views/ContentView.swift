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
        ZStack {
            Color(red: 0.98, green: 0.95, blue: 0.97)
                .ignoresSafeArea()
            
            VStack {
                VStack(spacing: 30) {
                    Text("Round \(viewModel.currentRound)")
                        .font(.system(size: 30, weight: .semibold, design: .rounded))
                        .padding(.bottom)
                    
                    VStack(spacing: 25) {
                        Text(viewModel.playerMustWin ? "You must WIN this round" : "You must LOSE this round")
                            .font(.title2)
                    }
                    ComputerChoiceView(
                        emoji: viewModel.computerMove.emoji,
                        label: viewModel.computerMove.label
                    )
                }
                                
                Text("Score \(viewModel.score)")
                    .font(.system(size: 46, weight: .heavy, design: .rounded))
                    .foregroundStyle(
                        LinearGradient(
                            colors: [.blue, .purple],
                            startPoint: .top,
                            endPoint: .bottom
                        )
                    )
                    .padding(.top, 30)
                
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
                .padding(.bottom, 40)
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
}

#Preview {
    ContentView()
}

//
//  GameButtonView.swift
//  RockPaperScissors
//
//  Created by murad on 16.05.2026.
//

import SwiftUI

struct GameButtonView: View {
    let emoji: String
    let label: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            VStack(spacing: 8) {
                Text(emoji)
                    .font(.system(size: 40, weight: .bold, design: .rounded))
                Text(label)
                    .font(.system(size: 18, weight: .medium, design: .rounded))
                    .opacity(0.8)
            }
            .foregroundColor(.black)
            .frame(maxWidth: .infinity, minHeight: 120)
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .shadow(color: .black.opacity(0.1), radius: 6, x: 0, y: 6)
        }
    }
}

#Preview {
    ZStack {
        Color.cyan
            .ignoresSafeArea()
        
        HStack(spacing: 20) {
            GameButtonView(emoji: "✋", label: "Paper") {
            }
            GameButtonView(emoji: "✋", label: "Paper") {
            }
            GameButtonView(emoji: "✋", label: "Paper") {
            }
        }
        .padding()
    }
}

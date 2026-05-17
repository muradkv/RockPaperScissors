//
//  ComputerChoiceView.swift
//  RockPaperScissors
//
//  Created by murad on 17.05.2026.
//

import SwiftUI

struct ComputerChoiceView: View {
    let title: String = "Computer choice"
    let emoji: String
    let label: String
    
    var body: some View {
            VStack(spacing: 20) {
                Text(title)
                    .font(.system(size: 18, weight: .medium, design: .rounded))
                    .opacity(0.8)
                VStack(spacing: 10) {
                    Text(emoji)
                        .font(.system(size: 70, weight: .bold, design: .rounded))
                    Text(label)
                        .font(.system(size: 18, weight: .medium, design: .rounded))
                        .opacity(0.8)
                }
            }
            .padding()
            .foregroundColor(.black)
            .frame(maxWidth: 180, minHeight: 170)
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .shadow(color: .black.opacity(0.1), radius: 6, x: 0, y: 6)
    }
}

#Preview {
    ZStack {
        Color.cyan
            .ignoresSafeArea()
        
        ComputerChoiceView(emoji: "✋", label: "Paper")
    }
}

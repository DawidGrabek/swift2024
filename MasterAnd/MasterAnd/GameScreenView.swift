//
//  GameScreenView.swift
//  MasterAnd
//
//  Created by student on 07/01/2025.
//

import SwiftUI

struct GameScreenView: View {
    @StateObject private var viewModel = GameViewModel()
    
    @State private var size: CGFloat = 1.0
    let animationDuration: Double = 0.5
    let maxSize: CGFloat = 1.3

    let foreverAnimation = Animation.easeInOut(duration: 0.5).repeatForever(autoreverses: true)
    
    var body: some View {
        VStack(spacing: 16) {
            Text("MasterMind Game")
                .font(.largeTitle)
                .fontWeight(.bold)

            Text("Attempts: \(viewModel.attempts.count)")
                .font(.title2)

            ScrollView {
                ForEach(viewModel.attempts.indices, id: \..self) { index in
                    GameRowView(
                        rowData: viewModel.attempts[index],
                        isClickable: false
                    )
                }
            }
            
                
            VStack {
                if viewModel.isWin {
                    Text("🎉 Congratulations! You won! 🎉")
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundColor(.green)
                        .padding()
                        .scaleEffect(size)
                }
            }.onChange(of: viewModel.isWin) { newValue in
                if newValue {
                    withAnimation(foreverAnimation) {
                        size = maxSize
                    }
                } else {
                    size = 1.0
                }
            }
            if !viewModel.isWin {
                GameRowView(
                    rowData: GameRowData(
                        selectedColors: viewModel.selectedColors,
                        feedback: Array(repeating: .gray, count: 4)
                    ),
                    isClickable: viewModel.isClickable,
                    onSelectColor: { index in viewModel.selectNextAvailableColor(index: index)},
                    onReverseSelectColor: {
                        index in viewModel.selectPreviousAvailableColor(index: index)
                    },
                    onCheck: { viewModel.handleCheckClick() },
                    isButtonClickable: viewModel.isButtonEnables
                )
            }
            
            Button("Restart Game") {
                viewModel.initializeGame(numberOfColors: 6)
            }
            .padding()
        }
        .padding()
        .onAppear {
            viewModel.initializeGame(numberOfColors: 6)
        }
    }
}

#Preview {
    GameScreenView()
}

//
//  GameScreenView.swift
//  MasterAnd
//
//  Created by student on 07/01/2025.
//

import SwiftUI

struct GameScreenView: View {
    @StateObject private var viewModel = GameViewModel()
    
    @State var size = 0.5
    var foreverAnimation: Animation {
        Animation.linear(duration: 2)
            .repeatForever()
        
    }
    
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

            if viewModel.isWin {
                Text("🎉 Congratulations! You won! 🎉")
                    .font(.title)
                    .fontWeight(.semibold)
                    .foregroundColor(.green)
                    .padding()
                    .scaleEffect(size)
                    .onAppear() {
                        withAnimation(self.foreverAnimation) {
                            self.size = 1.3
                        }
                    }
            

            } else {
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
                    onCheck: { viewModel.handleCheckClick() }
                )
            }
            
            if(viewModel.isWin){
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

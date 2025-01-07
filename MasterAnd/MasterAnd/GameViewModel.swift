//
//  GameViewModel.swift
//  MasterAnd
//
//  Created by student on 07/01/2025.
//

import SwiftUI
import Combine

class GameViewModel: ObservableObject {
    @Published var selectedColors: [Color] = Array(repeating: .gray, count: 4)
    @Published var attempts: [GameRowData] = []
    @Published var feedbackList: [FeedbackData] = []
    @Published var isClickable: Bool = true
    @Published var isWin: Bool = true
    @Published var availableColors: [Color] = []
    @Published var secretColors: [Color] = []

    func selectNextAvailableColor(index: Int) {
        let selectedColor = selectedColors[index]
        print("Test1", selectedColor)
        selectedColors[index] = .gray
        let available = availableColors.filter { !selectedColors.contains($0) }
        print(available)
        let selectedIndex = available.firstIndex(of: selectedColor) ?? 0
        print("selectedIndex", selectedIndex)
        selectedColors[index] = available[(selectedIndex + 1) % available.count]
        print("selectedColor", available[(selectedIndex + 1) % available.count])
        
        selectedColors.contains(.gray)
    }
    
    func selectPreviousAvailableColor(index: Int) {
        let selectedColor = selectedColors[index]
        selectedColors[index] = .gray
        let available = availableColors.filter { !selectedColors.contains($0) }
        let selectedIndex = available.firstIndex(of: selectedColor) ?? available.count - 1
        selectedColors[index] = available[(selectedIndex - 1 + available.count) % available.count]
        selectedColors.contains(.gray)
    }

    func checkColors() -> [Color] {
        return selectedColors.enumerated().map { index, color in
            if color == secretColors[index] {
                return .green
            } else if secretColors.contains(color) {
                return .yellow
            } else {
                return .gray
            }
        }
    }

    func handleCheckClick() {
        let feedback = checkColors()
        attempts.append(GameRowData(selectedColors: selectedColors, feedback: feedback))
        feedbackList.append(FeedbackData(colors: feedback))
        if feedback.allSatisfy({ $0 == .green }) {
            isWin = true
        }
        selectedColors = Array(repeating: .gray, count: 4)
        isClickable = true
    }

    func initializeGame(numberOfColors: Int) {
        let allColors: [Color] = [
            .red, .green, .blue, .yellow, .brown, .cyan, .black, .white
        ]
        availableColors = Array(allColors.prefix(numberOfColors))
        secretColors = availableColors.shuffled().prefix(4).map { $0 }
        selectedColors = Array(repeating: .gray, count: 4)
        attempts = []
        feedbackList = []
        isClickable = true
        isWin = false
    }
}
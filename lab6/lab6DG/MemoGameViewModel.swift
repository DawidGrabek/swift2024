//
//  MemoGameViewModel.swift
//  lab4DG
//
//  Created by student on 05/11/2024.
//
import SwiftUI
import Foundation

class MemoGameViewModel: ObservableObject {
    private static var currentTab: [String] = emojis
    private var themeNumber: Int = 1
    private(set) var themeColor = Color.blue
    var cards: Array<MemoGameModel<String>.Card>{
        return model.cards
    }

    static let emojis  = ["🇵🇸","🇮🇱", "🇯🇴", "🇺🇸", "🇸🇾"]
    static let emojis2 = ["🐦","🐶", "🐱", "🐭", "🐸", "🐮", "🐷"]
    static let emojis3 = ["🚗","🚕", "🚙", "🚌", "🚎", "🏎️", "🚓", "🚑", "🚒", "🚐", "🚜"]
    
    @Published
    private var model = generateMemoGameModel()
    
    private static func generateMemoGameModel() -> MemoGameModel<String>{
        return MemoGameModel<String>(numberOfCards: currentTab.count){
            index in if currentTab.indices.contains(index){
                currentTab[index]
            }
            else
            {
                "??"
            }
        }
    }
    
    func changeTheme(number: Int){
        self.themeNumber = number
        if (number == 1){
            MemoGameViewModel.currentTab = MemoGameViewModel.emojis
            themeColor = Color.blue
        }
        else if (number == 2){
            MemoGameViewModel.currentTab = MemoGameViewModel.emojis2
            themeColor = Color.yellow
        }
        else {
            MemoGameViewModel.currentTab = MemoGameViewModel.emojis3
            themeColor = Color.red
        }
        model = MemoGameViewModel.generateMemoGameModel()
    }
    
    func shuffleCard(){
        model.shuffleCard()
    }
    
    func getMainCard()-> MemoGameModel<String>.Card?{
        return model.mainCard
    }
    
    func chooseCard(card: MemoGameModel<String>.Card) {
            model.choose(card: card)
        }
}

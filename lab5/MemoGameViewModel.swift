//
//  MemoGameViewModel.swift
//  lab4DG
//
//  Created by student on 05/11/2024.
//
import SwiftUI
import Foundation

class MemoGameViewModel: ObservableObject {
    private static var currentEmojis:Array<String> = emojis1
    private var themeNumber: Int = 1
    private(set) var themeColor = Color.blue

    static let emojis1  = ["🇵🇸","🇮🇱", "🇯🇴", "🇺🇸", "🇸🇾"]
    static let emojis2 = ["🐦","🐶", "🐱", "🐭", "🐸", "🐮", "🐷"]
    static let emojis3 = ["🚗","🚕", "🚙", "🚌", "🚎", "🏎️", "🚓", "🚑", "🚒", "🚐", "🚜"]
    
    @Published
    private var model = createMemoGameModel()
    
    private static func createMemoGameModel() -> MemoGameModel<String>{
        return MemoGameModel<String>(numberOfCards: currentEmojis.count){
            index in if emojis1.indices.contains(index){
                return currentEmojis[index]
            } else{
                return "??"
            }
        }
    }
    
    func changeTheme(number: Int){
        themeNumber = number
        if(number == 1){
            themeColor = Color.blue
            MemoGameViewModel.currentEmojis = MemoGameViewModel.emojis1
        } else if(number == 2){
            themeColor = Color.red
            MemoGameViewModel.currentEmojis = MemoGameViewModel.emojis2
        } else{
            themeColor = Color.black
            MemoGameViewModel.currentEmojis = MemoGameViewModel.emojis3
        }
        
        model = MemoGameViewModel.createMemoGameModel()
    }
    
    func shuffleEmojis(){
        model.shuffleCards()
    }
    
    func getMainCard() -> MemoGameModel<String>.Card?{
        return model.mainCard
    }
    
    var cards: Array<MemoGameModel<String>.Card>{
        return model.cards
    }
}

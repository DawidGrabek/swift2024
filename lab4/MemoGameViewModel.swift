//
//  MemoGameViewModel.swift
//  lab4DG
//
//  Created by student on 05/11/2024.
//

import Foundation

class MemoGameViewModel {
    var currentEmojis:Array<String> = []
    var themeNumber: Int = 0

    static let emojis1  = ["🇵🇸","🇮🇱", "🇯🇴", "🇺🇸", "🇸🇾"]
    static let emojis2 = ["🐦","🐶", "🐱", "🐭", "🐸", "🐮", "🐷"]
    static let emojis3 = ["🚗","🚕", "🚙", "🚌", "🚎", "🏎️", "🚓", "🚑", "🚒", "🚐", "🚜"]
    
//    var model = generateModel()
    
    static func generateModel() -> MemoGameModel<String>{
        return MemoGameModel<String>(numberOfCards: emojis1.count){
            index in if emojis1.indices.contains(index){
                emojis1[index]
            } else{
                "??"
            }
        }
    }
    
    static func changeTheme(){
    }
}

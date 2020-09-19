//
//  EmojiCardGame.swift
//  Memorize
//
//  Created by Emad Albarnawi on 19/09/2020.
//  Copyright © 2020 Emad Albarnawi. All rights reserved.
//

import Foundation

class EmojiCardGame {
    static private let emojis = ["👻", "🎃", "😭", "💰"];
//    private(set) var model: MemoryGame<String> =
//        MemoryGame<String>(numberOfPirsOfCards: EmojiCardGame.emojis.count, content: EmojiCardGame.emojis);
    private let secondModel: MemoryGame<String> = MemoryGame<String>(numberOfPirsOfCards: EmojiCardGame.emojis.count) { (index) in
        EmojiCardGame.emojis[index];
        
    };
    
    //MARK: - Access to the model!
    var cards: [MemoryGame<String>.Card] {
        return secondModel.cards;
    }
    
    //MARK: - Intent(s)
    func choos(card: MemoryGame<String>.Card) {
        secondModel.choos(card: card);
    }
    
}

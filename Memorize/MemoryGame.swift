//
//  MemoryGame.swift
//  Memorize
//
//  Created by Emad Albarnawi on 19/09/2020.
//  Copyright © 2020 Emad Albarnawi. All rights reserved.
//

import Foundation

struct MemoryGame<Content>: Identifiable {
    var id: Int = 1;
    
    var cards: [Card];
    
//    init(numberOfPirsOfCards: Int, content: [Content]){
//        cards = [];
//        for i in 0..<numberOfPirsOfCards {
//            cards.append(Card(id: i*2, content: content[i]));
//            cards.append(Card(id: i*2+1, content: content[i]));
//        }
//    }
    init(numberOfPirsOfCards: Int, content: (Int) -> Content) {
        cards = [];
        for i in 0..<numberOfPirsOfCards {
//            let x = content(i);
//            let randomNumber = Int.random(in: 0..<numberOfPirsOfCards)
            cards.append(Card(id: i*(2), content: content(i)));
            cards.append(Card(id: i*(2)+1, content: content(i)));
        }
        cards.shuffle();
    }
    
    mutating func choos(card: Card) {
        print("This is the card \(card)");
        let cardIndex = index(of: card);
        guard cardIndex != -1 else { return }
        
        self.cards[cardIndex].isFaceUp = !self.cards[cardIndex].isFaceUp;
        
        
    }
    func index(of value: Card) -> Int{
        for (index, card) in cards.enumerated() {
            if card.id == value.id {
                return index
            }
        }
        return -1;
    }
    
    struct Card: Identifiable {
        var id: Int,
        isFaceUp: Bool = true,
        isMatched: Bool = false,
        content: Content
    }
}

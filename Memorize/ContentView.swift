//
//  ContentView.swift
//  Memorize
//
//  Created by Emad Albarnawi on 14/09/2020.
//  Copyright © 2020 Emad Albarnawi. All rights reserved.
//

import SwiftUI
typealias Card = MemoryGame<String>.Card;


struct ContentView: View {
    var emojiCardGame: EmojiCardGame;
//    var emojiCards = emojiCardGame.cards.sh
    var body: some View {
//        HStack {
//            ForEach(0..<5) { index in
//                VStack {
                    HStack {
//                        let emojiCards = emojiCardGame.cards.shuffle();
                        ForEach(0..<emojiCardGame.cards.count) { index in
                            CardView(card: self.emojiCardGame.cards[index])
//                                .frame(width: 40, height: 300.0)
                                .onTapGesture {
                                self.emojiCardGame.choos(card: self.emojiCardGame.cards[index])
                            }

                                .padding(0)
                                .foregroundColor(Color.orange)
                                .font(emojiCardGame.cards.count/2 != 5 ? Font.largeTitle : Font.footnote)
                                .frame(width: nil, height: 100, alignment: .center)
                                .aspectRatio(0.05, contentMode: .fill)
//                            .ratio
                        }
                        
                    }

//                }
//            }
//        }
        
        
        
    }
}
struct CardView: View {
    var card: Card
//    var imogies: [String] = ["😃", "😭", "👻"]
//    var randomNumber = Int.random(in: 0..<3)
    
    var body: some View {
        
        ZStack {
            if card.isFaceUp {
                RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 3)
                RoundedRectangle(cornerRadius: 10).fill().foregroundColor(Color.white)
                
                Text(card.content)
            } else {
                RoundedRectangle(cornerRadius: 10).fill().foregroundColor(Color.orange)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(emojiCardGame: EmojiCardGame())
    }
}

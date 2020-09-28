//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Emad Albarnawi on 14/09/2020.
//  Copyright © 2020 Emad Albarnawi. All rights reserved.
//

import SwiftUI
typealias Card = MemoryGame<String>.Card;


struct EmojiMemoryGameView: View {
    @ObservedObject var emojiCardGame: EmojiCardGame;
//    var emojiCards = emojiCardGame.cards.sh
    var body: some View {
//        HStack {
//            ForEach(0..<5) { index in
//                VStack {
//                    HStack {
//                        let emojiCards = emojiCardGame.cards.shuffle();
        Grid(emojiCardGame.cards) { card in
                            CardView(card: card)
//                                .frame(width: 40, height: 300.0)
                                .onTapGesture {
                                self.emojiCardGame.choos(card: card)
                            }

                                .padding(0)
                                .foregroundColor(Color.orange)
//                                .frame(width: nil, height: 100, alignment: .center)
//                                .aspectRatio(0.05, contentMode: .fill)
//                            .ratio
                        }
                        
//                    }

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
        GeometryReader { geometry in
            ZStack {
                if card.isFaceUp {
                    RoundedRectangle(cornerRadius: cornerRadius).stroke(lineWidth: edgeLineWidth)
                    RoundedRectangle(cornerRadius: cornerRadius).fill().foregroundColor(Color.white)
                    
                    Text(card.content)
                } else {
                    RoundedRectangle(cornerRadius: cornerRadius).fill().foregroundColor(Color.orange)
                }
            }
            .font(Font.system(size: getGeometrySize(of: geometry.size)))
        }
        
    }
    // MARK: - Drawing Constants
    let cornerRadius: CGFloat = 10.0,
        edgeLineWidth: CGFloat = 3,
        fontScaleFactor: CGFloat = 0.75;
    private func getGeometrySize(of size: CGSize) -> CGFloat {
        return min(size.width, size.height) * fontScaleFactor;
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiMemoryGameView(emojiCardGame: EmojiCardGame())
    }
}

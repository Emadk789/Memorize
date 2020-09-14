//
//  ContentView.swift
//  Memorize
//
//  Created by Emad Albarnawi on 14/09/2020.
//  Copyright © 2020 Emad Albarnawi. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {

        HStack {
            ForEach(0..<4) { x in
                CardView(isFaceUP: true)
                    .padding()
                    .foregroundColor(Color.orange)
                    .font(Font.largeTitle)
            }
            
        }
        
    }
}
struct CardView: View {
    var isFaceUP: Bool
    var imogies: [String] = ["😃", "😭", "👻"]
    var randomNumber = Int.random(in: 0...3)
    
    var body: some View {
        
        ZStack {
            if isFaceUP {
                RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 3)
                RoundedRectangle(cornerRadius: 10).fill().foregroundColor(Color.white)
                
                Text(imogies[randomNumber])
            } else {
                RoundedRectangle(cornerRadius: 10).fill().foregroundColor(Color.orange)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

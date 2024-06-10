//
//  EmojiMemoryGameView.swift
//  stanford
//
//  Created by Anish Shrestha on 02/06/2024.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    
    @State var cardCount = 4
    let emojis = ["🇳🇵","🇳🇿","🇺🇸","🇬🇧","🇹🇭","🇧🇪","🇨🇳","🇮🇳"]
    var body: some View {
        VStack{
          cards
            .padding()
          cardCountAdjuster
        }

    }
    
    var cards: some View{
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 85))]) {
            ForEach(0..<cardCount, id: \.self) { index in
             CardView(isFaceUp: true, emoji: emojis[index])
                    
            }
            
        }
        .foregroundColor(.orange)
    }
    
    var cardCountAdjuster: some View{
        HStack{
            cardRemover
            Spacer()
            cardAdder
            
        }
        .imageScale(.large)
        .font(.title)
    }
    
    func cardCountAdjuster(by offset: Int, symbol: String) -> some View{
        return   Button(action: {
                cardCount = cardCount + offset
            
        }, label: {
            Image(systemName: symbol)
        })
        .disabled(cardCount + offset < 1 || cardCount + offset > emojis.count)
    }
    
    var cardRemover: some View{
        cardCountAdjuster(by: -1, symbol: "rectangle.stack.badge.minus.fill")
    }
    
    var cardAdder: some View{
        cardCountAdjuster(by: 1, symbol: "rectangle.stack.badge.plus.fill")
    }
    
}

struct CardView: View {
    @State var isFaceUp = true
    let emoji: String
    var body: some View{
        let base = RoundedRectangle(cornerRadius: 12)
        Group{
            if isFaceUp {
                base.fill(.white)
                    .strokeBorder(lineWidth: 2)
                    .overlay(
                        Text(emoji)
                        
                    )
            } else {
                base.fill()
            }
        }
        .aspectRatio(2/3, contentMode: .fill)
        .font(.largeTitle)
        .onTapGesture {
            isFaceUp.toggle()
            print("tapped")
        }
     
    }
}

#Preview {
    EmojiMemoryGameView()
}

//
//  ContentView.swift
//  stanford
//
//  Created by Anish Shrestha on 02/06/2024.
//

import SwiftUI

struct ContentView: View {
    
    let emojis = ["🇳🇵","🇳🇿","🇺🇸","🇬🇧","🇹🇭","🇧🇪","🇨🇳","🇮🇳"]
    var body: some View {
    
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 85))]) {
            ForEach(emojis.indices, id: \.self) { index in
             CardView(isFaceUp: false, emoji: emojis[index])
                    
                    
                
            }
            
        }
        .foregroundColor(.orange)
        .padding()
    }
    
    struct CardView: View {
        @State var isFaceUp = false
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
            .onTapGesture {
                isFaceUp.toggle()
                print("tapped")
            }
         
        }
    }
    
}

#Preview {
    ContentView()
}

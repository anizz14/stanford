//
//  MemorizeGame.swift
//  stanford
//
//  Created by Anish Shrestha on 05/06/2024.
//

import Foundation


struct MemoryGame<CardContent> {
    var cards: Array<Card>
    
    func choose(card: Card) {
        
    }
    
    struct Card {
        var isFaceUp: Bool
        var isMatched: Bool
        var content: CardContent
    }
}

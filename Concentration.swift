//
//  Concentration.swift
//  PracticaSwift
//
//  Created by PILI on 24/11/20.
//  Copyright © 2020 PILI. All rights reserved.
//

import Foundation

class Concentration{
    
    var cards = [Card]()
    var totalScore = 0
    
    init(numberOfPairsOfCards: Int){
        for _ in 1...numberOfPairsOfCards {
            let card = Card()
            cards.append(card)
            cards.append(card)
        }
    }
    
    var indexOfOnlyFaceUp: Int?
    
    
    func playNewGame(){
        cards.shuffleInPlace()
        for index in cards.indices{
            cards[index].isFaceUp = false
            cards[index].isMatched = false
            cards[index].wasSeen = false
        }
        totalScore = 0
        
    }
    
    
    func chooseCard(at index: Int){
        
        
        if !cards[index].isMatched{
            //3 cases: -no cards face up -2 cards are face up  -1 card face up
            if let matchIndex = indexOfOnlyFaceUp{
                if matchIndex != index {
                //check if they match
                    if cards[matchIndex].identifier == cards[index].identifier {
                        cards[matchIndex].isMatched = true
                        cards[index].isMatched = true
                        totalScore += 2
                    }
                    else{
                        if cards[index].wasSeen{
                            totalScore -= 1
                        }
                    }
                    cards[index].isFaceUp = true
                    indexOfOnlyFaceUp = nil //because now there are 2 faceup cards
                }
            } else {
                //either no cards or 2 cards are faceup
                for flipDownIndex in cards.indices{
                    cards[flipDownIndex].isFaceUp = false
                }
                cards[index].isFaceUp = true
                indexOfOnlyFaceUp = index
            }
        
        }
        
        cards[index].wasSeen = true

    }
}

extension MutableCollectionType where Index == Int {
    /// Shuffle the elements of `self` in-place.
    mutating func shuffleInPlace() {
        // empty and single-element collections don't shuffle
        if count < 2 { return }
        
        for i in startIndex ..< endIndex - 1 {
            let j = Int(arc4random_uniform(UInt32(count - i))) + i
            guard i != j else { continue }
            swap(&self[i], &self[j])
        }
    }
}

extension CollectionType {
    /// Return a copy of `self` with its elements shuffled.
    func shuffle() -> [Generator.Element] {
        var list = Array(self)
        list.shuffleInPlace()
        return list
    }
}

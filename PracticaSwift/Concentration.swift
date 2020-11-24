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
    
    
    init(numberOfPairsOfCards: Int){
        for _ in 1...numberOfPairsOfCards {
            let card = Card()
            cards.append(card)
            cards.append(card)
        }
    }
    
    
    func chooseCard(at index: Int){
        
    }
}
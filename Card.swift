//
//  Card.swift
//  PracticaSwift
//
//  Created by PILI on 24/11/20.
//  Copyright © 2020 PILI. All rights reserved.
//

import Foundation


struct Card{
    var isFaceUp = false
    var isMatched = false
    var identifier: Int
    var wasSeen = false
    
    //static vars or funcs are used with the type not with the class. "global"
    
    static var identifierFactory = 0
    
    static func getUniqueIdentifier() -> Int {
        identifierFactory += 1
        return identifierFactory
    }
    
    init(){
        self.identifier = Card.getUniqueIdentifier()
    }
}
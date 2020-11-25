//
//  ViewController.swift
//  PracticaSwift
//
//  Created by PILI on 24/11/20.
//  Copyright © 2020 PILI. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //CARDBUTTONS ARRAY
    @IBOutlet var cardButtons: [UIButton]!
    
    //FLIPCOUNT LABEL
    @IBOutlet weak var flipCountLabel: UILabel!
    
    //TOUCHCARD BUTTON
    @IBAction func touchCard(sender: UIButton) {
        flipCount += 1
        if let cardNumber = cardButtons.indexOf(sender){
            flipCard(withEmoji: emojiChoices[cardNumber], on: sender)
        }
        else{
            print("chosen card was not in cardButtons")
        }
    }
    
    //FLIPCOUNT VAR
    var flipCount = 0 {
        didSet{
            flipCountLabel.text = "Flips: \(flipCount)"
        }
    }
    
    //GAME VAR (CONECTION WITH MODEL)
    lazy var game : Concentration = {
        return Concentration(numberOfPairsOfCards: (self.cardButtons.count + 1) / 2)
    }()
    
    //EMOJIS ARRAY
    var emojiChoices = ["🎃","👻","🎃","👻"]
    
    
    //FLIPCARD FUNCTION
    func flipCard(withEmoji emoji:String, on button:UIButton){
        if button.currentTitle == emoji {
            button.setTitle("", forState: UIControlState.Normal)
            button.backgroundColor = UIColor.orangeColor()
            
        } else {
            button.setTitle(emoji, forState: UIControlState.Normal)
            button.backgroundColor = UIColor.whiteColor()
        }
    }
}
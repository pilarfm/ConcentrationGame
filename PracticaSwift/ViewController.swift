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
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
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
    
    
    func updateViewFromModel(){
        for index in cardButtons.indices{
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp{
                button.setTitle(emoji(to: card), forState: UIControlState.Normal)
                button.backgroundColor = UIColor.whiteColor()
            }
            else{
                button.setTitle("", forState: UIControlState.Normal)
                button.backgroundColor = card.isMatched ? UIColor.clearColor() : UIColor.orangeColor()
            }
        }
    }
    
   
    
    
    //GAME VAR (CONECTION WITH MODEL)
    lazy var game : Concentration = {
        return Concentration(numberOfPairsOfCards: (self.cardButtons.count + 1) / 2)
    }()
    
    
    //EMOJIS
    
    var emoji = Dictionary<Int,String>()  // o  var emoji = [Int:String]()
    
    var emojiChoices = ["🎃","👻","🍭","🍬","🙀","🔪","😈","✨"]
    
    
    func emoji(to card: Card) -> String {
        //if the dictionary position doesnt have an emoji assigned yet, it assigns it with a random index
        if emoji[card.identifier] == nil {
            if emojiChoices.count > 0 {
                let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
                emoji[card.identifier] = emojiChoices.removeAtIndex(randomIndex)
            }
        }
        return emoji[card.identifier] ?? "?"
    }

}

    
    

//
//  ViewController.swift
//  PracticaSwift
//
//  Created by PILI on 24/11/20.
//  Copyright © 2020 PILI. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    var game = Concentration()
    
    var flipCount = 0 {
        didSet{
            flipCountLabel.text = "Flips: \(flipCount)"
            
        }
    }
    @IBOutlet var cardButtons: [UIButton]! 
    
    var emojiChoices = ["🎃","👻","🎃","👻"]
    
    
    @IBOutlet weak var flipCountLabel: UILabel!
    
    @IBAction func touchCard(sender: UIButton) {
        flipCount += 1
        if let cardNumber = cardButtons.indexOf(sender){
            flipCard(withEmoji: emojiChoices[cardNumber], on: sender)
        }
        else{
            print("chosen card was not in cardButtons")
        }
    
    }
    
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
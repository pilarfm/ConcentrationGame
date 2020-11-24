//
//  ViewController.swift
//  PracticaSwift
//
//  Created by PILI on 24/11/20.
//  Copyright © 2020 PILI. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    var flipCount = 0
    
    
    
    @IBAction func touchCard(sender: UIButton) {
        flipCard(withEmoji:"👻", on: sender)
    }
    @IBAction func touchSecondCard(sender: UIButton) {
        flipCard(withEmoji:"🎃", on: sender)
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

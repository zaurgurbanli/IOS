//
//  ViewController.swift
//  Dicee-iOS13
//
//  Created by Angela Yu on 11/06/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var diceImageViewOne: UIImageView!
    @IBOutlet weak var diceImageViewTwo: UIImageView!
    
    var leftDiceNumber = 0
    var rightDiceNumber = 5
    
    let array = [ #imageLiteral(resourceName: "DiceOne"), #imageLiteral(resourceName: "DiceTwo"), #imageLiteral(resourceName: "DiceThree"), #imageLiteral(resourceName: "DiceFour"), #imageLiteral(resourceName: "DiceFive"), #imageLiteral(resourceName: "DiceSix") ]

    var isLeftIncrease = false
    

    @IBAction func rollButtonPressed(_ sender: UIButton) {
        diceImageViewOne.image = array.randomElement()
        diceImageViewTwo.image = array.randomElement()
        
//        diceImageViewOne.image =  array[leftDiceNumber]
//        diceImageViewTwo.image = array[rightDiceNumber]
//        if isLeftIncrease {
//            if  leftDiceNumber>0{
//                leftDiceNumber -= 1
//                rightDiceNumber += 1
//            }
//            else  {
//                isLeftIncrease = false
//            }
//        }
//
//        else{
//            if leftDiceNumber<5{
//                leftDiceNumber += 1
//                rightDiceNumber -= 1
//            }
//            else {
//                isLeftIncrease = true
//            }
//
//        }

            
        
    }
    
}


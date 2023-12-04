//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let eggTime = ["Soft":3, "Medium":4, "Hard":7]
    
    var secRemaining = 60
    var timer = Timer()
   var totalSec = 10

    
    @IBOutlet weak var progress: UIProgressView!
    @IBOutlet weak var label: UILabel!
    
    @IBAction func eggPressed(_ sender: UIButton) {
        
        timer.invalidate()
        let hardness = sender.currentTitle!
        
        secRemaining = eggTime[hardness]!
        totalSec=eggTime[hardness]!
        label.text = hardness
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        
    }
    @objc func updateTimer(){
        if secRemaining>0{
            secRemaining -= 1

            progress.progress = 1 - Float(secRemaining)/Float(totalSec)
        }
        else{
            timer.invalidate()
            label.text = "Done!"
        }
    }
    
}

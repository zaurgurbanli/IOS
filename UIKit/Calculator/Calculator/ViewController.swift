//
//  ViewController.swift
//  Calculator
//
//  Created by Zaur Gurbanli on 06.04.22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var fisrtNumber: UITextField!
    @IBOutlet weak var secondNumber: UITextField!
    
    @IBOutlet weak var resultLabel: UILabel!
    
    var result = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func sumPressed(_ sender: Any) {
        if let first = Int(fisrtNumber.text!){
            if let second = Int(secondNumber.text!){
                result = first + second
            }
        }
        resultLabel.text = String(result)
    }
    
    @IBAction func minusPressed(_ sender: Any) {
        if let first = Int(fisrtNumber.text!){
            if let second = Int(secondNumber.text!){
                result = first - second
            }
        }
        resultLabel.text = String(result)

    }
    
    @IBAction func multiplyPressed(_ sender: Any) {
        if let first = Int(fisrtNumber.text!){
            if let second = Int(secondNumber.text!){
                result = first * second
            }
        }
        resultLabel.text = String(result)

    }
    
    @IBAction func dividePressed(_ sender: Any) {
        if let first = Int(fisrtNumber.text!){
            if let second = Int(secondNumber.text!){
                result = first / second
            }
        }
        resultLabel.text = String(result)

    }
    
}


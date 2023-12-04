//
//  ViewController.swift
//  Quiz
//
//  Created by Zaur Gurbanli on 21.10.21.
//

import UIKit

class ViewController: UIViewController {
    
    var mainQuiz = MainQuiz()

    @IBOutlet weak var labelText: UILabel!
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
    }

    @IBAction func buttonPressed(_ sender: UIButton) {
        
        mainQuiz.nextQuestion()
    }
    
    func updateUI(){
        labelText.text = mainQuiz.getQuestion()
    }

}


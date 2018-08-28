//
//  ViewController.swift
//  Hangman
//
//  Created by Mitchell Socia on 8/28/18.
//  Copyright © 2018 Mitchell Socia. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var wordToGuessLabel: UILabel!
    @IBOutlet weak var guessInput: UITextField!
    @IBOutlet weak var livesCounterLabel: UILabel!
    
    let word = "swift"
    var guessedCharacter = ""
    var isInWord = false
    var livesCounter = 3
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guessInput.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let maxLength = 1
        let currentString: NSString = textField.text! as NSString
        let newString: NSString =
            currentString.replacingCharacters(in: range, with: string) as NSString
        return newString.length <= maxLength
    }
    
    func checkGuess(guess: String) {
        print("Starting guess")
        let characterGuess: Character = Character(guess)
        print("Character guess: \(characterGuess)")
        for character in word {
            if characterGuess == character {
                print("character: \(character)")
                isInWord = true
                print(isInWord)
                break
            } else {
              //  isInWord
                print("character: \(character)")
                isInWord = false
                print(isInWord)
                //break
            }
        }
        if isInWord == false{
            livesCounter -= 1
            livesCounterLabel.text = String(livesCounter)
        }
    }
        

    @IBAction func guessButton(_ sender: UIButton) {
        if let guess = guessInput.text {
            checkGuess(guess: guess)
            
        }
    }
    
    
}


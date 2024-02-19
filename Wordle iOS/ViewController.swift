//
//  ViewController.swift
//  Wordle iOS
//
//  Created by Rehanga Gamage on 2024-02-19.
//

import UIKit


class ViewController: UIViewController {
    
    var testWord:String = ""
    var slots = [UILabel?]()
    var gridPosition = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        var randomNumber = Int.random(in: 0..<words.count)
        testWord = words[randomNumber]
        print("Test Word: " + testWord)
        slots = [Label_1,Label_2,Label_3,Label_4,Label_5,Label_6,Label_7,Label_8,Label_9,Label_10,Label_11,Label_12,Label_13,Label_14,Label_15,Label_16,Label_17,Label_18,Label_19,Label_20,Label_21,Label_22,Label_23,Label_24,Label_25,Label_26,Label_27,Label_28,Label_29,Label_30]
    }

    @IBOutlet weak var Label_1: UILabel!
    @IBOutlet weak var Label_2: UILabel!
    @IBOutlet weak var Label_3: UILabel!
    @IBOutlet weak var Label_4: UILabel!
    @IBOutlet weak var Label_5: UILabel!
    @IBOutlet weak var Label_6: UILabel!
    @IBOutlet weak var Label_7: UILabel!
    @IBOutlet weak var Label_8: UILabel!
    @IBOutlet weak var Label_9: UILabel!
    @IBOutlet weak var Label_10: UILabel!
    @IBOutlet weak var Label_11: UILabel!
    @IBOutlet weak var Label_12: UILabel!
    @IBOutlet weak var Label_13: UILabel!
    @IBOutlet weak var Label_14: UILabel!
    @IBOutlet weak var Label_15: UILabel!
    @IBOutlet weak var Label_16: UILabel!
    @IBOutlet weak var Label_17: UILabel!
    @IBOutlet weak var Label_18: UILabel!
    @IBOutlet weak var Label_19: UILabel!
    @IBOutlet weak var Label_20: UILabel!
    @IBOutlet weak var Label_21: UILabel!
    @IBOutlet weak var Label_22: UILabel!
    @IBOutlet weak var Label_23: UILabel!
    @IBOutlet weak var Label_24: UILabel!
    @IBOutlet weak var Label_25: UILabel!
    @IBOutlet weak var Label_26: UILabel!
    @IBOutlet weak var Label_27: UILabel!
    @IBOutlet weak var Label_28: UILabel!
    @IBOutlet weak var Label_29: UILabel!
    @IBOutlet weak var Label_30: UILabel!
    
    @IBAction func PressQ(_ sender: Any) {
        TypeLetter("Q")
    }
    
    func TypeLetter(_ letter:Character){
        gridPosition += 1
        print("Grid Position: " + String(gridPosition))
        slots[gridPosition - 1]!.text = String(letter)
    }
}


//
//  ViewController.swift
//  Wordle iOS
//
//  Created by Rehanga Gamage on 2024-02-19.
//

import UIKit


class ViewController: UIViewController {
    
    ///#Connections to Objects
    
    //Wordle Grid Labels
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
    
    //Error label
    @IBOutlet weak var Error_Label: UILabel!
    
    //keyboard actions
    @IBAction func PressQ(_ sender: Any) {TypeLetter("Q")}
    @IBAction func PressW(_ sender: Any) {TypeLetter("W")}
    @IBAction func PressE(_ sender: Any) {TypeLetter("E")}
    @IBAction func PressR(_ sender: Any) {TypeLetter("R")}
    @IBAction func PressT(_ sender: Any) {TypeLetter("T")}
    @IBAction func PressY(_ sender: Any) {TypeLetter("Y")}
    @IBAction func PressU(_ sender: Any) {TypeLetter("U")}
    @IBAction func PressI(_ sender: Any) {TypeLetter("I")}
    @IBAction func PressO(_ sender: Any) {TypeLetter("O")}
    @IBAction func PressP(_ sender: Any) {TypeLetter("P")}
    @IBAction func PressA(_ sender: Any) {TypeLetter("A")}
    @IBAction func PressS(_ sender: Any) {TypeLetter("S")}
    @IBAction func PressD(_ sender: Any) {TypeLetter("D")}
    @IBAction func PressF(_ sender: Any) {TypeLetter("F")}
    @IBAction func PressG(_ sender: Any) {TypeLetter("G")}
    @IBAction func PressH(_ sender: Any) {TypeLetter("H")}
    @IBAction func PressJ(_ sender: Any) {TypeLetter("J")}
    @IBAction func PressK(_ sender: Any) {TypeLetter("K")}
    @IBAction func PressL(_ sender: Any) {TypeLetter("L")}
    @IBAction func PressZ(_ sender: Any) {TypeLetter("Z")}
    @IBAction func PressX(_ sender: Any) {TypeLetter("X")}
    @IBAction func PressC(_ sender: Any) {TypeLetter("C")}
    @IBAction func PressV(_ sender: Any) {TypeLetter("V")}
    @IBAction func PressB(_ sender: Any) {TypeLetter("B")}
    @IBAction func PressN(_ sender: Any) {TypeLetter("N")}
    @IBAction func PressM(_ sender: Any) {TypeLetter("M")}
    @IBAction func PressBackspace(_ sender: Any) {TypeLetter("⌫")}
    @IBAction func PressReturn(_ sender: Any) {TypeLetter("⏎")}
    
    //keyboard letter button outlets
    @IBOutlet weak var ButtonQ: UIButton!
    @IBOutlet weak var ButtonA: UIButton!
    @IBOutlet weak var ButtonB: UIButton!
    @IBOutlet weak var ButtonC: UIButton!
    @IBOutlet weak var ButtonD: UIButton!
    @IBOutlet weak var ButtonE: UIButton!
    @IBOutlet weak var ButtonF: UIButton!
    @IBOutlet weak var ButtonG: UIButton!
    @IBOutlet weak var ButtonH: UIButton!
    @IBOutlet weak var ButtonI: UIButton!
    @IBOutlet weak var ButtonJ: UIButton!
    @IBOutlet weak var ButtonK: UIButton!
    @IBOutlet weak var ButtonL: UIButton!
    @IBOutlet weak var ButtonM: UIButton!
    @IBOutlet weak var ButtonN: UIButton!
    @IBOutlet weak var ButtonO: UIButton!
    @IBOutlet weak var ButtonP: UIButton!
    @IBOutlet weak var ButtonR: UIButton!
    @IBOutlet weak var ButtonS: UIButton!
    @IBOutlet weak var ButtonT: UIButton!
    @IBOutlet weak var ButtonU: UIButton!
    @IBOutlet weak var ButtonV: UIButton!
    @IBOutlet weak var ButtonW: UIButton!
    @IBOutlet weak var ButtonX: UIButton!
    @IBOutlet weak var ButtonY: UIButton!
    @IBOutlet weak var ButtonZ: UIButton!
    
 
    
    ///#Attributes
    var testWord:String = ""
    var slots = [UILabel?]()
    var keyboardLetters = [UIButton?]()
    var gridRow = 1
    var gridCol = 1
    var letterCounts:Dictionary<Character,Int8> = [:]
    var copyOfLetterCounts:Dictionary<Character,Int8> = [:]
    var wordleRecords = [WordleRecord]()

    
    ///#Initial Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        slots = [Label_1,Label_2,Label_3,Label_4,Label_5,Label_6,Label_7,Label_8,Label_9,Label_10,Label_11,Label_12,Label_13,Label_14,Label_15,Label_16,Label_17,Label_18,Label_19,Label_20,Label_21,Label_22,Label_23,Label_24,Label_25,Label_26,Label_27,Label_28,Label_29,Label_30]
        keyboardLetters = [ButtonA, ButtonB, ButtonC, ButtonD, ButtonE, ButtonF, ButtonG, ButtonH, ButtonI, ButtonJ, ButtonK, ButtonL, ButtonM, ButtonN, ButtonO, ButtonP, ButtonQ, ButtonR, ButtonS, ButtonT, ButtonU, ButtonV, ButtonW, ButtonX, ButtonY, ButtonZ]
        InitializeWordle()
    }
    
    func InitializeWordle() {
        let randomNumber = Int.random(in: 0..<words.count)
        testWord = words[randomNumber]
        print("Test Word: " + testWord)
        gridRow = 1
        gridCol = 1
        letterCounts.removeAll()
        letterCounts = GetLetterCounts(testWord)
        for label in slots {
            label!.backgroundColor = .systemGray5
            label!.text = ""
        }
        for button in keyboardLetters {
            button!.configuration?.background.backgroundColor = .clear
        }
        let load = ViewController.Load()
        if (load != nil) {
            wordleRecords = load!
        }
    
    }

    
    ///#Main Method
    
    func TypeLetter(_ letter:Character) {
        let gridPos = (gridRow-1)*5 + gridCol //cursor position
        if (letter == "⌫") {
            if (gridCol != 1) {
                slots[gridPos - 2]!.text = ""
                gridCol -= 1
            } else {
                slots[gridPos - 1]!.text = ""
            }
        }//backspace
        else if (letter == "⏎") {
            if (gridCol == 6 && gridRow != 7) {
                let userWord = GetUserWord()
                if (IsUserWordValid(userWord)) {
                    Error_Label.text = ""
                    gridRow += 1
                    gridCol = 1
                    //proceed with main wordle logic
                    ExactPositionMatcher(word: userWord)
                    if (IsWordCorrect(word: userWord)) {
                        Save(word: testWord, numOfAttempts: Int8(gridRow - 1))
                        DisplayResultAlert(win: true)
                        return
                    }
                    NonExactPositionMatcher(word: userWord)
                } else {
                    Error_Label.text = "Word not found!"
                }
            }//cursor is still within the grid, i.e. hasn't run out of turns
            if (gridRow == 7) {
                DisplayResultAlert(win: false)
                Save(word: testWord, numOfAttempts: Int8(gridRow))
            }//cursor is out of grid, end game with false condition
        }//return key
        else {
            if (gridCol < 6) {
                slots[gridPos - 1]!.text = String(letter)
                gridCol += 1
            }
        }
    }/* The flow of the game is controlled by this function, a.k.a the flow is controlled by the custom keyboard buttons (which call this function when tapped) */
    
    
    ///#Support Methods used by Main Method
    
    func GetUserWord() -> String {
        var userWord:String = ""
        var gridPos = (gridRow-1)*5 + gridCol - 5
        for _ in 1...5 {
            userWord += (slots[gridPos - 1]!.text) ?? ""
            gridPos += 1
        }
        return userWord
    }//Returns user's word from the current grid row
    
    func BinarySearch(_ element:String, _ array:[String]) -> Bool {
        var low = 0
        var high = array.count - 1
        while low <= high {
            let mid = low + (high - low) / 2
            switch array[mid] {
            case element:
                return true
            case let value where value < element:
                low = mid + 1
            default:
                high = mid - 1
            }
        }
        return false
    }//Binary search implementation for an element and an array (String)
    
    func IsUserWordValid(_ userWord:String) -> Bool{
        if (BinarySearch(userWord, words)){
            return true
        }
        if (BinarySearch(userWord, guesses)){
            return true
        }
        return false
    }//checks if user's word is found in either of the 2 arrays in words.swift
    
    func GetLetterCounts(_ testWord:String) -> Dictionary<Character,Int8>{
        var letterCounts:Dictionary<Character,Int8> = [:]
        for c in testWord {
            if letterCounts[c] != nil {
                letterCounts[c]!+=1
            } else {
                letterCounts.updateValue(1, forKey: c)
            }
        }
        return letterCounts
    }//returns a dictionary with keys been the unique letters of the given word, and the values been their no. of occurances
    
    
    func ExactPositionMatcher(word:String) {
        var n:Int = 0
        copyOfLetterCounts = letterCounts
        for c in word {
            let index = testWord.index(testWord.startIndex, offsetBy: n)
            if (c == testWord[index]){
                copyOfLetterCounts[c]! -= 1
                //mark position green
                let gridPos = (gridRow-1)*5 + gridCol - 5 + n
                slots[gridPos - 1]!.backgroundColor = .green
                //mark keyboard letter green
                let stringC = String(c)
                let adjustedAsciiValue:Int = Int(UnicodeScalar(stringC)!.value) - 65
                keyboardLetters[adjustedAsciiValue]!.configuration?.background.backgroundColor = .green
            }
            n += 1
        }
    }//marks letters of user's guess in the correct position in green color, and updates the copyOfLetterCounts dictionary (required for NonExactPositionMatcher function)
    
    func IsWordCorrect(word:String) -> Bool {
        var sum = 0
        for count in copyOfLetterCounts.values {
            sum += Int(count)
        }
        if (sum == 0) { return true } else { return false }
        //if word was correct, copyOfLetterCounts dictionary would have been depleted via the ExactPositionMatcher function
    }//checks if user's guess matches the actual test word
    
    func NonExactPositionMatcher(word:String) {
        var index = 0
        for c in word {
            let stringC = String(c)
            let adjustedAsciiValue:Int = Int(UnicodeScalar(stringC)!.value) - 65
            let gridPos = (gridRow-1)*5 + gridCol - 5 + index
            if (slots[gridPos - 1]!.backgroundColor == .green) {
                index += 1
                continue
            }//if position has been marked correct (green), can skip
            if (copyOfLetterCounts[c] ?? 0  > 0) {
                copyOfLetterCounts[c]! -= 1
                //mark position yellow
                slots[gridPos - 1]!.backgroundColor = .yellow
                //mark keyboard letter yellow (if not already marked green)
                if (keyboardLetters[adjustedAsciiValue]!.configuration?.background.backgroundColor != .green) {
                    keyboardLetters[adjustedAsciiValue]!.configuration?.background.backgroundColor = .yellow
                }
            }//if letter exists but in wrong position, mark yellow
            else {
                if (keyboardLetters[adjustedAsciiValue]!.configuration?.background.backgroundColor == .clear) {
                    keyboardLetters[adjustedAsciiValue]!.configuration?.background.backgroundColor = .gray
                }
            }//marks letters on keyboard that don't exist in the test word in gray
            index += 1
        }
    }//marks letters of the user's guess present in the test word, but in wrong position in yellow color. Must be called after ExactPositionMatcher function due to use of copyOfLetterCounts dictionary.
    
    func DisplayResultAlert(win:Bool) {
        let alertTitle:String
        let alertMessage:String
        if (win) {
            alertTitle = "You Won!"
            alertMessage = ""
        } else {
            alertTitle = "Out of Turns!"
            alertMessage = "Word was " + testWord
        }
        let alertController = UIAlertController(title: alertTitle, message: alertMessage, preferredStyle: .alert)
        let action1 = UIAlertAction(title: "Play Again!",
        style: .default) { (action:UIAlertAction) in
            self.InitializeWordle()
        }
        alertController.addAction(action1)
        self.present(alertController, animated: true, completion:
        nil)
    }//displays alert window on game loss or win, with play-again prompt
    
    func Save(word :String, numOfAttempts: Int8) {
        let record = WordleRecord(word: word, numOfAttempts: numOfAttempts)
        wordleRecords.append(record!)
        do {
            let data = try NSKeyedArchiver.archivedData(withRootObject: wordleRecords, requiringSecureCoding: true)
            try data.write(to: WordleRecord.archiveURL)
            print("Wordle stats updated")
        }
        catch {
            print("Error updating wordle stats: \(error)")
        }
    }//saves the test word, and no. of attempts taken by user to solve (7 attempts = failure)
    
    static func Load() -> [WordleRecord]? {
        do {
            let rawdata = try Data(contentsOf: WordleRecord.archiveURL)
            let unarchivedData = try NSKeyedUnarchiver.unarchivedObject(ofClasses: [WordleRecord.self, NSString.self, NSArray.self], from: rawdata)
            return unarchivedData as? [WordleRecord]
        } catch {
            print("Error loading wordle stats: \(error)")
            return nil
        }
    }//simply returns the saved array of wordle records
    
    
}


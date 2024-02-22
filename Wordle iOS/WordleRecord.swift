//
//  WordleRecord.swift
//  Wordle iOS
//
//  Created by Rehanga Gamage on 2024-02-22.
//

import Foundation

class WordleRecord : NSObject, NSSecureCoding {
    
    static var supportsSecureCoding = true
    static let documentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let archiveURL = documentsDirectory.appendingPathComponent("wordleSave")
    
    var word: String
    var numOfAttempts: Int8 //value of 7 would indicate a loss
    
    init?(word: String, numOfAttempts: Int8) {
        self.word = word
        self.numOfAttempts = numOfAttempts
    }
    
    func encode(with aCoder: NSCoder){
        aCoder.encode(word, forKey: "word")
        aCoder.encode(Int(numOfAttempts), forKey: "numOfAttempts")
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        let numOfAttempts = aDecoder.decodeInteger(forKey: "numOfAttempts")
        let word = aDecoder.decodeObject(forKey: "word") as? String

        self.init(word: word!,numOfAttempts: Int8(numOfAttempts))
    }
}

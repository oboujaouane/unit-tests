//
//  PlayData.swift
//  UnitTests
//
//  Created by oboujaouane on 18/01/2018.
//  Copyright © 2018 ous. All rights reserved.
//

import Foundation

class PlayData {
    
    var allWords = [String]()
    var wordCounts = [String: Int]()
    
    init() {
        if let path = Bundle.main.path(forResource: "plays", ofType: "txt") {
            if let plays = try? String(contentsOfFile: path) {
                self.allWords = plays.components(separatedBy: CharacterSet.alphanumerics.inverted)
                self.allWords = allWords.filter { $0 != "" }
                for word in self.allWords {
                    if self.wordCounts[word] == nil {
                        self.wordCounts[word] = 1
                    } else {
                        self.wordCounts[word]! += 1
                    }
                }
                self.allWords = Array(self.wordCounts.keys)
            }
        }
    }
    
}

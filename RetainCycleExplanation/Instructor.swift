//
//  Instructor.swift
//  RetainCycleExplanation
//
//  Created by İsa Anıl Koca on 5.09.2026.
//

import Foundation

class Instructor {
    
    let name : String
    var course : Course?
    
    init(name: String) {
        self.name = name
    }
    
    deinit { // hafızadan silindiginde bu kullanılıyor deinitilaize
        
        print("Instructor \(name) deinitialized")
        
    }
}

class Course {
    
    let name : String
    let url : URL
    var instructor : Instructor?
    
    init(name: String, url: URL) {
        self.name = name
        self.url = url
    }
    
    deinit {
        print("Course \(name) deinitialized")
    }
}

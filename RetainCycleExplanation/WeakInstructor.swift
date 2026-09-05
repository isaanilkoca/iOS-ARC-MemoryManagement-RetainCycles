//
//  Instructor.swift
//  RetainCycleExplanation
//
//  Created by İsa Anıl Koca on 5.09.2026.
//

import Foundation

class weakInstructor {
    
    let name : String
    var course : weakCourse?
    
    init(name: String) {
        self.name = name
    }
    
    deinit { // hafızadan silindiginde bu kullanılıyor deinitilaize
        
        print("Instructor \(name) deinitialized")
        
    }
}

class weakCourse {
    
    let name : String
    let url : URL
    weak var instructor : weakInstructor?
    
    init(name: String, url: URL) {
        self.name = name
        self.url = url
    }
    
    deinit {
        print("Course \(name) deinitialized")
    }
}

//
//  Instructor.swift
//  RetainCycleExplanation
//
//  Created by İsa Anıl Koca on 5.09.2026.
//

import Foundation

class weakInstructor {
    
    let name : String // Eğitmenin adını tutar
    var course : weakCourse? // Eğitmenin verdiği kursu tutar, opsiyonel referans (retain cycle olmasın diye karşı taraf weak)
    
    init(name: String) { // İsmiyle weakInstructor nesnesini başlatır
        self.name = name
    }
    
    deinit { // Instructor nesnesi hafızadan atılırken tetiklenir, debug için log yazar
        
        print("Instructor \(name) deinitialized")
        
    }
}

/*
weakInstructor Sınıfı Özeti:
- Bu sınıf bir eğitmeni temsil eder ve ilişkilendirildiği kursu opsiyonel olarak tutar.
- course referansı strong'dur (varsayılan), ancak weakCourse sınıfındaki instructor referansı 'weak' olduğu için retain cycle oluşmaz.
- Bu tasarım ile ARC otomatik olarak nesneleri serbest bırakabilir, memory leak engellenir.
*/

class weakCourse {
    
    let name : String // Kursun adını tutar
    let url : URL // Kursa ait web adresini tutar
    weak var instructor : weakInstructor? // Kendi eğitmenini tutar, 'weak' sayesinde retain cycle olmaz
    
    init(name: String, url: URL) { // Kursun adı ve url ile nesneyi başlatır
        self.name = name
        self.url = url
    }
    
    deinit { // weakCourse nesnesi hafızadan atılırken tetiklenir, debug için log yazar
        print("Course \(name) deinitialized")
    }
}

/*
weakCourse Sınıfı Özeti:
- Kursu, adını, url'sini ve eğitmenini tutan bir modeldir.
- instructor referansının 'weak' olması, iki yönlü referansta retain cycle oluşmasını engeller.
- Bu sayede ARC (Automatic Reference Counting) hafıza yönetimini doğru yapar, memory leak oluşmaz.
*/

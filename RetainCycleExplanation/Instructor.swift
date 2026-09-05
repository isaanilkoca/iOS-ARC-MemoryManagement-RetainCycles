//
//  Instructor.swift
//  RetainCycleExplanation
//
//  Created by İsa Anıl Koca on 5.09.2026.
//

import Foundation

class Instructor {
    
    let name : String // Eğitmenin adını tutar
    var course : Course? // Eğitmenin verdiği dersi tutar, opsiyonel (retain cycle oluşabilir)
    
    init(name: String) { // Eğitmenin adı ile nesneyi başlatır
        self.name = name
    }
    
    deinit { // Instructor nesnesi hafızadan silindiğinde tetiklenir, debug için log yazar
        print("Instructor \(name) deinitialized")
    }
    
    /*
    Instructor Sınıfı Özeti:
    - Instructor, bir eğitmeni temsil eder ve opsiyonel olarak bir Course nesnesine referans tutar.
    - Eğer Course da Instructor'a referans tutarsa retain cycle oluşabilir. Bu durumda bir tarafı 'weak' yapmalısınız.
    - Retain cycle: İki nesne birbirini strong referans ile tuttuğunda, ARC nesneleri hiçbir zaman hafızadan atmaz. 'weak' kullanarak bu döngü engellenir.
    - Bu sınıfta course referansı strong'dur. Eğer retain cycle yaşarsanız 'weak var course: Course?' olarak değiştirmelisiniz.
    */
}

class Course {
    
    let name : String // Dersin adını tutar
    let url : URL // Dersle ilgili bir web adresi tutar
    var instructor : Instructor? // Dersi veren eğitmen, opsiyonel referans (retain cycle oluşabilir)
    
    init(name: String, url: URL) { // Ders adı ve url ile Course nesnesini başlatır
        self.name = name
        self.url = url
    }
    
    deinit { // Course nesnesi hafızadan silindiğinde tetiklenir, debug için log yazar
        print("Course \(name) deinitialized")
    }
    
    /*
    Course Sınıfı Özeti:
    - Course, bir dersi ve ona ait temel bilgileri (ad, url, instructor) tutar.
    - instructor referansı opsiyoneldir ve Instructor nesnesini tutar. Instructor da Course'a referans verebilir.
    - Eğer iki yönlü referans varsa retain cycle oluşabilir. Bir tarafı 'weak' yapmak gerekir.
    - Bu sınıfta instructor güçlü (strong) tutuluyor. Cycle engellemek için 'weak var instructor: Instructor?' olarak değiştirilebilir.
    */
}

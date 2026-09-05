//
//  ViewController.swift
//  RetainCycleExplanation
//
//  Created by İsa Anıl Koca on 5.09.2026.
//

import UIKit

class ViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /* STRONG REFERENCE (RETAIN CYCLE) ÖRNEĞİ: Instructor ve Course karşılıklı birbirini strong tutuyor. Nesneler nil yapılsa bile deinit çalışmaz, memory leak oluşur. */
//        var course : Course? = Course(name: "iOS",url: URL(string: "www.atilsamancioglu.com")!)
//        var instructor : Instructor? = Instructor(name: "Atıl samancioglu")
//        
//        course = nil
//        instructor = nil
//        
//        //strong reference , retain cycle = hafızda tutmak icin döngüya sokuyor yani retain cycle bu demek
//        
//        course!.instructor = instructor  // Instructor'ı Course'a ata
//        instructor!.course = course      // Course'u Instructor'a ata
//        
//        // ikiside nil olmasına ragmen deinitler yazılmadı strong referenceden dolayı
//        course = nil                    // Nesneleri nil yap, ARC'nin temizlemesini bekle
//        instructor = nil                // Nesneleri nil yap, ARC'nin temizlemesini bekle
        ////////////////////////////
        
        /* WEAK REFERENCE ÖRNEĞİ: Instructor ve Course karşılıklı weak referans ile tutulursa, retain cycle oluşmaz. Nesneler nil yapıldığında deinit çalışır. */
//        var course : weakCourse? = weakCourse(name: "iOS",url: URL(string: "www.atilsamancioglu.com")!)
//        var instructor : weakInstructor? = weakInstructor(name: "Atıl samancioglu")
//        
//        course = nil
//        instructor = nil
//        
//        //weak reference , retain cycle = hafızda tutmak icin döngüya sokuyor yani retain cycle bu demek
//        
//        // böyle göründü weak yapınca !!! yukarıdan farkı sadece weak koymamız
//        
//        course!.instructor = instructor  // Instructor'ı Course'a ata
//        instructor!.course = course      // Course'u Instructor'a ata
//        
//        // ikiside nil olmasına ragmen deinitler yazılmadı strong referenceden dolayı
//        course = nil                    // Nesneleri nil yap, ARC'nin temizlemesini bekle
//        instructor = nil                // Nesneleri nil yap, ARC'nin temizlemesini bekle
        
        
        /* [weak self] KULLANIMI VE ASENKRON DURUMLARDA GÜVENLİ REFERANS: closure içindeki async işlemlerde retain cycle oluşmaması için kullanılır. */
        var course : weakCourse2? = weakCourse2(name: "iOS",url: URL(string: "www.atilsamancioglu.com")!)
        var instructor : weakInstructor2? = weakInstructor2(name: "Atıl samancioglu")
                
        course!.instructor = instructor   // Instructor'ı Course'a ata
        instructor!.course = course       // Course'u Instructor'a ata

        course!.launch(launchedCourse: LaunchedCourse(title: "iOS"))  // Kursu başlat, launchedCourses'a ekleyecek
        
        
        course = nil                     // Nesneleri nil yap, ARC'nin temizlemesini bekle
        instructor = nil                 // Nesneleri nil yap, ARC'nin temizlemesini bekle
        
        
    }
    
    /*
    viewDidLoad Özeti:
    - Bu fonksiyonda üç farklı örnek üzerinden memory management ve retain cycle anlatılıyor:
        1. Strong Reference ile retain cycle ve memory leak
        2. Weak Reference ile retain cycle'ın önlenmesi
        3. [weak self] ile closure/async işlemlerde güvenli referans yönetimi
    - Doğru referans yönetimi ile ARC'nin nesneleri hafızadan atması sağlanır, leak oluşmaz.
    */
    
}


/*
ViewController Sınıfı Özeti:
- Bu sınıf, retain cycle ve memory yönetimini anlamak için pratik kod örnekleri ve açıklamalar içerir.
- Kodun farklı varyasyonlarını deneyerek ARC'nin davranışını, weak referansların neden önemli olduğunu gözlemleyebilirsin.
*/

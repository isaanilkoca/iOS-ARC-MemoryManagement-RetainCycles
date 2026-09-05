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
        
//        var course : Course? = Course(name: "iOS",url: URL(string: "www.atilsamancioglu.com")!)
//        var instructor : Instructor? = Instructor(name: "Atıl samancioglu")
//        
//        course = nil
//        instructor = nil
//        
//        //strong reference , retain cycle = hafızda tutmak icin döngüya sokuyor yani retain cycle bu demek
//        
//        course!.instructor = instructor
//        instructor!.course = course
//        
//        // ikiside nil olmasına ragmen deinitler yazılmadı strong referenceden dolayı
//        course = nil
//        instructor = nil
        ////////////////////////////
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
//        course!.instructor = instructor
//        instructor!.course = course
//        
//        // ikiside nil olmasına ragmen deinitler yazılmadı strong referenceden dolayı
//        course = nil
//        instructor = nil
        
        
        var course : weakCourse2? = weakCourse2(name: "iOS",url: URL(string: "www.atilsamancioglu.com")!)
        var instructor : weakInstructor2? = weakInstructor2(name: "Atıl samancioglu")
                
        course!.instructor = instructor
        instructor!.course = course

        course!.launch(launchedCourse: LaunchedCourse(title: "iOS"))
        
        
        course = nil
        instructor = nil
        
        
    }


}


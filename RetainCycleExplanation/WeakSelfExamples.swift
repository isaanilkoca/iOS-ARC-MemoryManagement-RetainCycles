//
//  WeakSelfExamples.swift
//  RetainCycleExplanation
//
//  Created by İsa Anıl Koca on 5.09.2026.
//

import Foundation

struct LaunchedCourse {
    let title: String
    var isLaunched: Bool = false

    init(title: String) {
        self.title = title
    }
}

class weakInstructor2 {
    let name: String
    var course: weakCourse2?

    init(name: String) {
        self.name = name
    }

    deinit { // hafızadan silindiginde bu kullanılıyor deinitilaize
        print("weak Instructor2 \(name) deinitialized")
    }
}

class weakCourse2 {
    let name: String
    let url: URL
    weak var instructor: weakInstructor2?

    var launchedCourses: [LaunchedCourse] = []

    var onLauched: ((_ launchedCourse: LaunchedCourse) -> Void)?

    func launch(launchedCourse: LaunchedCourse) {
        // bir deadline dan bir saniye sonra bunu isleme alacak !!!!!!!
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [weak self] in
            self?.launchedCourses.append(launchedCourse)

            // bu fonk calıstırdıgımda bir defa  bir yazması gerekiyor
        }
    }

    init(name: String, url: URL) {
        self.name = name
        self.url = url

        onLauched = { [weak self] launchededCourse in
            self?.launchedCourses.append(launchededCourse)
            print("launched course count : \(self?.launchedCourses.count)")
        }
    }

    deinit {
        print("weakCourse2 \(name) deinitialized")
    }
}

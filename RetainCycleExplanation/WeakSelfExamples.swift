//
//  WeakSelfExamples.swift
//  RetainCycleExplanation
//
//  Created by İsa Anıl Koca on 5.09.2026.
//

import Foundation

struct LaunchedCourse {
    let title: String // Kursun başlığını tutar
    var isLaunched: Bool = false // Kursun başlatılıp başlatılmadığını tutar

    init(title: String) { // Kurs başlığı ile nesneyi başlatır
        self.title = title
    }
}

/*
LaunchedCourse Struct Özeti:
- Kurs başlığını ve başlatılma durumunu tutan basit bir model.
*/

class weakInstructor2 {
    let name: String // Eğitmenin adını tutar
    var course: weakCourse2? // Eğitmenin verdiği kursu tutar (opsiyonel referans)

    init(name: String) { // Eğitmen adı ile nesneyi başlatır
        self.name = name
    }

    deinit { // Eğitmen nesnesi hafızadan atılırken tetiklenir, debug için log yazar
        print("weak Instructor2 \(name) deinitialized")
    }
}

/*
weakInstructor2 Sınıfı Özeti:
- Eğitmeni ve ilişkili kursunu tutar.
- İki yönlü referans varsa retain cycle riskini azaltmak için weakCourse2 tarafında weak referans kullanılır.
*/

class weakCourse2 {
    let name: String // Kursun adını tutar
    let url: URL // Kursun bağlantı adresini tutar
    weak var instructor: weakInstructor2? // Eğitmeni tutar, weak ile retain cycle engellenir

    var launchedCourses: [LaunchedCourse] = [] // Başlatılmış kursların listesini tutar

    var onLauched: ((_ launchedCourse: LaunchedCourse) -> Void)? // Kurs başlatıldığında çağrılan closure (callback)

    // Kursu başlatan, 1 saniye gecikmeli çalışan fonksiyon
    func launch(launchedCourse: LaunchedCourse) {
        // Closure içinde [weak self] kullanımı ile retain cycle engelleniyor. Kapanışta self'in hafızadan atılmasına izin verir, memory leak oluşmaz.
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [weak self] in
            self?.launchedCourses.append(launchedCourse) // Kursu başlatılmış kurslar listesine ekler

            // bu fonk calıstırdıgımda bir defa  bir yazması gerekiyor
        }
    }

    // Kurs adı ve url ile kurs nesnesini başlatır
    init(name: String, url: URL) {
        self.name = name
        self.url = url

        // Closure içinde yine [weak self] kullanılarak retain cycle önlenir.
        onLauched = { [weak self] launchededCourse in
            self?.launchedCourses.append(launchededCourse) // Callback ile kursu listeye ekler
            print("launched course count : \(self?.launchedCourses.count)") // O ana kadarki başlatılmış kurs sayısını yazdırır
        }
    }

    deinit { // Kurs nesnesi hafızadan atılırken tetiklenir
        print("weakCourse2 \(name) deinitialized")
    }
}

/*
weakCourse2 Sınıfı Özeti:
- Kursun temel bilgilerini, ilişkili eğitmenini (weak referans ile), başlatılmış kursları ve kurs başlatma fonksiyonunu tutar.
- Özellikle closure içinde [weak self] ile retain cycle oluşumu engellenir.
- [weak self] kullanımı, ARC'nin closure içindeki self referansının hafızadan atılmasına izin verir. Bu sayede memory leak oluşmaz.
- Callback'lerde ve async işlemlerde self'i weak yakalamak, iOS geliştirmede en güvenli yöntemlerden biridir.
*/

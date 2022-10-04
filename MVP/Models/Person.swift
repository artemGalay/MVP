//
//  Crypto.swift
//  MVP
//
//  Created by Артем Галай on 3.10.22.
//

import Foundation

struct Person {
    var name: String?
    var surname: String?
    var age: Int?
}

extension Person {
    static var persons = [
        Person(name: "Artur", surname: "Gorlov", age: 20),
        Person(name: "Nikita", surname: "Kazakov", age: 23),
        Person(name: "Artem", surname: "Galay", age: 25),
        Person(name: "Serg", surname: "Masiuk", age: 30),
        Person(name: "Denis", surname: "Holodkov", age: 27)
    ]
}

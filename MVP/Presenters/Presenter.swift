//
//  Presenter.swift
//  MVP
//
//  Created by Артем Галай on 3.10.22.
//

import Foundation

protocol GreetingPresenterProtocol: AnyObject {
    init(view: GreetingViewProtocol, person: Person)
    func showGreeting()
}

final class GreetingPresenter: GreetingPresenterProtocol {

    private unowned let view: GreetingViewProtocol

    private let person: Person

    private lazy var currentElement = 0
    
    required init(view: GreetingViewProtocol, person: Person) {
        self.view = view
        self.person = person
    }

    func showGreeting() {
        let name = Person.persons[currentElement].name ?? ""
        let surname = Person.persons[currentElement].surname ?? ""
        let age = Person.persons[currentElement].age ?? 0
        view.setGreeting(name: name, surname: surname, age: age)
        currentElement += 1
        if currentElement == Person.persons.count {
            currentElement = 0
        }
    }
}

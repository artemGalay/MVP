//
//  GreatingViewViewController.swift
//  MVP
//
//  Created by Артем Галай on 3.10.22.
//

import UIKit

protocol GreetingViewProtocol: AnyObject {
    func setGreeting(name: String, surname: String, age: Int)
}

final class GreetingViewViewController: UIViewController {

    private var presenter: GreetingPresenterProtocol!

    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .red
        label.font = .systemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var surenameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .red
        label.font = .systemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var ageLabel: UILabel = {
        let label = UILabel()
        label.textColor = .red
        label.font = .systemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var myButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = .red
        button.setTitle("Press", for: .normal)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        let person = Person()
        presenter = GreetingPresenter(view: self, person: person)
        setupHierarchy()
        setupLayout()
    }

    private func setupHierarchy() {
        view.addSubview(nameLabel)
        view.addSubview(surenameLabel)
        view.addSubview(ageLabel)
        view.addSubview(myButton)
    }

    private func setupLayout() {
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 60),
            nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            surenameLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 20),
            surenameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            ageLabel.topAnchor.constraint(equalTo: surenameLabel.bottomAnchor, constant: 20),
            ageLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            myButton.topAnchor.constraint(equalTo: ageLabel.bottomAnchor, constant: 20),
            myButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }

    @objc func buttonTapped() {
        presenter?.showGreeting()
    }
}

extension GreetingViewViewController: GreetingViewProtocol {
    func setGreeting(name: String, surname: String, age: Int) {
        nameLabel.text = name
        surenameLabel.text = surname
        ageLabel.text = String(age)
    }
}

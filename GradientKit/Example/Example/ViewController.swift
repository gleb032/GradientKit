//
//  ViewController.swift
//  Example
//
//  Created by Gleb Fandeev on 27.02.2023.
//

import UIKit
import GradientKit

class ViewController: UIViewController {
    private let gradientView: GradientView = {
        let view = GradientView(
            colors: [.purple, .brown, .cyan],
            direction: .down
        )
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var dissmisButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(dissmisAction), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Dissmis gradient", for: .normal)
        button.backgroundColor = .gray
        button.layer.cornerRadius = 15
        return button
    }()
    
    private lazy var returnButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(returnAction), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Return gradient", for: .normal)
        button.backgroundColor = .gray
        button.layer.cornerRadius = 15
        return button
    }()

    @objc private func dissmisAction() {
        gradientView.dissmisGradient()
        print(gradientView.state)
    }
    
    @objc private func returnAction() {
        gradientView.applyGradient()
        print(gradientView.state)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(gradientView)
        NSLayoutConstraint.activate([
            gradientView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            gradientView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            gradientView.topAnchor.constraint(equalTo: view.topAnchor),
            gradientView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])

        let container: UIStackView = {
            let sv = UIStackView()
            sv.translatesAutoresizingMaskIntoConstraints = false
            sv.axis = .vertical
            sv.spacing = .init(floatLiteral: 5)
            sv.distribution = .fillEqually
            sv.addArrangedSubview(dissmisButton)
            sv.addArrangedSubview(returnButton)
            return sv
        }()
        
        view.addSubview(container)
        NSLayoutConstraint.activate([
            container.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            container.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            container.heightAnchor.constraint(equalToConstant: 110),
            container.widthAnchor.constraint(equalToConstant: 200)
        ])
    }
}


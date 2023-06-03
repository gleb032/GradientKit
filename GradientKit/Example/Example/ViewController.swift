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
        let colors: [UIColor] = [.purple, .orange, .red]
        let view = GradientView(
            colors: colors,
            direction: .diagonal(from: .left, to: .up),
            locations: [0.2, 0.6, 1.0]
        )
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addGestureRecognizer(
            UITapGestureRecognizer(target: self, action:  #selector(clickAction(sender:)))
        )

        view.addSubview(gradientView)
        NSLayoutConstraint.activate([
            gradientView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            gradientView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            gradientView.topAnchor.constraint(equalTo: view.topAnchor),
            gradientView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

    @objc func clickAction(sender : UITapGestureRecognizer) {
        switch gradientView.state {
        case .gradient:
            gradientView.dissmisGradient()
        case .blank:
            gradientView.applyGradient()
        }
    }
}

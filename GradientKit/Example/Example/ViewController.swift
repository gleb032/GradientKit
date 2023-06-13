//
//  ViewController.swift
//  Example
//
//  Created by Gleb Fandeev on 27.02.2023.
//

import UIKit
import GradientKit

class ViewController: UIViewController {
    private let linearGradientView: LinearGradientView = {
        let colors: [UIColor] = [.purple, .orange, .red]
        let view = LinearGradientView(
            colors: colors,
            direction: .diagonal(from: .left, to: .up),
            locations: [0.2, 0.6, 1.0],
            initialState: .gradient
        )
        return view
    }()

    // TODO: refactor
    private lazy var width = view.bounds.size.width
    private lazy var c1 = CGPoint(x: width / 2, y: width / 2)
    private lazy var c2 = CGPoint(x: width / 4, y: width * 3 / 5)
    private lazy var c3 = CGPoint(x: width, y: 0)
    private lazy var c4 = CGPoint(x: width - width / 4, y: width - width * 3 / 5)
    private lazy var points = [
        Point(coordinate: c1, color: ARGB(alpha: 255, red: 255, green: 0, blue: 0)),
        Point(coordinate: c2, color: ARGB(alpha: 255, red: 0, green: 0, blue: 255)),
        Point(coordinate: c3, color: ARGB(alpha: 255, red: 255, green: 0, blue: 0)),
        Point(coordinate: c4, color: ARGB(alpha: 255, red: 0, green: 255, blue: 0))
    ]

    private lazy var bubbleGradientView = BubbleGradientView(
        frame: view.frame,
        points: points
    )

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addGestureRecognizer(
            UITapGestureRecognizer(target: self, action:  #selector(clickAction(sender:)))
        )
    }

    private var isLinearGradient = false

    @objc func clickAction(sender : UITapGestureRecognizer) {
        if isLinearGradient {
            linearGradientView.removeFromSuperview()
            view.addSubview(bubbleGradientView)
            bubbleGradientView.frame = view.bounds
        } else {
            bubbleGradientView.removeFromSuperview()
            view.addSubview(linearGradientView)
            linearGradientView.frame = view.bounds
        }
        print(isLinearGradient)
        isLinearGradient = !isLinearGradient
    }
}

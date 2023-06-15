import UIKit
import GradientKit

// TODO: refactor
class ViewController: UIViewController {
    private let linearGradientView = LinearGradientView()

    private lazy var bubbleGradientView = {
        var width = self.view.bounds.size.width
        var c1 = CGPoint(x: width / 2, y: width / 2)
        var c2 = CGPoint(x: width / 4, y: width * 3 / 5)
        var c3 = CGPoint(x: width, y: 0)
        var c4 = CGPoint(x: width - width / 4, y: width - width * 3 / 5)
        var points = [
            Point(coordinate: c1, color: ARGB(alpha: 255, red: 255, green: 0, blue: 0)),
            Point(coordinate: c2, color: ARGB(alpha: 255, red: 0, green: 0, blue: 255)),
            Point(coordinate: c3, color: ARGB(alpha: 255, red: 255, green: 0, blue: 0)),
            Point(coordinate: c4, color: ARGB(alpha: 255, red: 0, green: 255, blue: 0))
        ]
        return BubbleGradientView(
            frame: self.view.bounds,
            points: points
        )
    }()


    override func viewDidLoad() {
        super.viewDidLoad()

        view.addGestureRecognizer(
            UITapGestureRecognizer(target: self, action:  #selector(clickAction(sender:)))
        )
    }

    private var isLinearGradient = false

    @objc func clickAction(sender: UITapGestureRecognizer) {
        if isLinearGradient {
            linearGradientView.removeFromSuperview()
            view.addSubview(bubbleGradientView)
            bubbleGradientView.frame = view.bounds
        } else {
            bubbleGradientView.removeFromSuperview()
            view.addSubview(linearGradientView)
            linearGradientView.applyGradient(with: .happy)
            linearGradientView.frame = view.bounds
        }
        isLinearGradient = !isLinearGradient
    }
}

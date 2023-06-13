//
//  BubbleGradientView.swift
//  
//
//  Created by Gleb Fandeev on 04.06.2023.
//

import UIKit

// TODO: reformat API, ORIENTATION
open class BubbleGradientView: UIView {

    private let points: [Point]
    private let gradientGenarator: BubbleGradientGenerator
    private lazy var imageView: UIImageView? = UIImageView(frame: frame)

    private(set) public var state: GradientState

    public init(
        frame: CGRect,
        points: [Point],
        initialState: GradientState = .gradient
    ) {
        self.points = points
        self.gradientGenarator = BubbleGradientGenerator(points: points)
        self.state = initialState
        super.init(frame: frame)
    }

    required public init?(coder: NSCoder) {
        preconditionFailure("init(coder:) has not been implemented")
        return nil
    }

    override open func layoutSubviews() {
        super.layoutSubviews()
        updateGradient()
    }

    public func dissmisGradient() {
        state = .blank
        updateGradient()
    }

    public func applyGradient() {
        state = .gradient
        updateGradient()
    }
}

private extension BubbleGradientView {
    func updateGradient() {
        if state == .gradient {
            guard let imageView else {
                return assertionFailure("⚠️ imageView have to be non null")
            }
            guard let cgImage = gradientGenarator.generate(size: bounds.size) else {
                state = .blank
                return assertionFailure("⚠️ Gradient generation failed")
            }
            imageView.image = UIImage(cgImage: cgImage)
            addSubview(imageView)
        } else {
            imageView = nil
        }
    }
}

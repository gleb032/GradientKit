//
//  GradientView.swift
//  
//
//  Created by Gleb Fandeev on 27.02.2023.
//

import UIKit

open class GradientView: UIView {
    private let colors: [UIColor]
    private let startPoint: CGPoint
    private let endPoint: CGPoint
    private let locations: [NSNumber]?

    private(set) public var state: GradientState
    private var initialState: GradientState

    private let gradientLayer = CAGradientLayer()

    public init(
        colors: [UIColor],
        startPoint: CGPoint,
        endPoint: CGPoint,
        locations: [NSNumber]? = nil,
        initialState: GradientState = .gradient
    ) {
        self.colors = colors
        self.startPoint = startPoint
        self.endPoint = endPoint
        self.locations = locations
        self.state = initialState
        self.initialState = initialState
        super.init(frame: .zero)
    }

    public convenience init(
        colors: [UIColor],
        direction: GradientDirection,
        locations: [NSNumber]? = nil,
        initialState: GradientState = .gradient
    ) {
        self.init(
            colors: colors,
            startPoint: direction.startPoint, endPoint: direction.endPoint,
            locations: locations,
            initialState: initialState
        )
    }

    required public init?(coder: NSCoder) {
        preconditionFailure("init(coder:) has not been implemented")
        return nil
    }

    public override func draw(_ rect: CGRect) {
        if initialState == .gradient {
            gradientLayer.frame = bounds
            gradientLayer.colors = colors.map { $0.cgColor }
            gradientLayer.startPoint = startPoint
            gradientLayer.endPoint = endPoint
            gradientLayer.locations = locations

            layer.addSublayer(gradientLayer)
        } else {
            super.draw(rect)
            /// After that, the first branch of the condition will be executed all the time
            initialState = .gradient
        }
    }

    public func dissmisGradient() {
        layer.sublayers?.removeAll {
            $0 == gradientLayer
        }
        state = .blank
    }
    
    public func applyGradient() {
        draw(bounds)
        state = .gradient
    }
}

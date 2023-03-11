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

    private var isInitial: Bool

    private let gradientLayer = CAGradientLayer()

    public init(
        colors: [UIColor],
        startPoint: CGPoint,
        endPoint: CGPoint,
        locations: [NSNumber]? = nil,
        isInitial: Bool = true
    ) {
        self.colors = colors
        self.startPoint = startPoint
        self.endPoint = endPoint
        self.locations = locations
        self.isInitial = isInitial
        super.init(frame: .zero)
    }

    public convenience init(
        colors: [UIColor],
        direction: GradientDirection,
        locations: [NSNumber]? = nil,
        isInitial: Bool = true
    ) {
        self.init(
            colors: colors,
            startPoint: direction.startPoint, endPoint: direction.endPoint,
            locations: locations,
            isInitial: isInitial
        )
    }

    required public init?(coder: NSCoder) {
        preconditionFailure("init(coder:) has not been implemented")
        return nil
    }

    public override func draw(_ rect: CGRect) {
        if isInitial {
            gradientLayer.frame = bounds
            gradientLayer.colors = colors.map { $0.cgColor }
            gradientLayer.startPoint = startPoint
            gradientLayer.endPoint = endPoint
            gradientLayer.locations = locations

            layer.addSublayer(gradientLayer)
        } else {
            super.draw(rect)
            isInitial = true
        }
    }

    public func dissmisGradient() {
        layer.sublayers?.removeAll {
            $0 is CAGradientLayer
        }
    }
    
    public func applyGradient() {
        draw(bounds)
    }
}

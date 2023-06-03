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

    private lazy var gradientLayer = CAGradientLayer()

    private(set) public var state: GradientState {
        didSet {
            switch state {
            case .gradient:
                layer.addSublayer(gradientLayer)
            case .blank:
                self.gradientLayer.removeFromSuperlayer()
            }
        }
    }

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
        super.init(frame: .zero)

        setAndNotifyState(initialState)
    }

    public convenience init(
        colors: [UIColor],
        direction: GradientDirection,
        locations: [NSNumber]? = nil,
        initialState: GradientState = .gradient
    ) {
        self.init(
            colors: colors,
            startPoint: direction.startPoint,
            endPoint: direction.endPoint,
            locations: locations,
            initialState: initialState
        )
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
        setAndNotifyState(.blank)
    }
    
    public func applyGradient() {
        setAndNotifyState(.gradient)
        updateGradient()
    }
}

private extension GradientView {
    func updateGradient() {
        if state == .gradient {
            gradientLayer.frame = bounds
            gradientLayer.colors = colors.map { $0.cgColor }
            gradientLayer.startPoint = startPoint
            gradientLayer.endPoint = endPoint
            gradientLayer.locations = locations
        }
    }

    func setAndNotifyState(_ newState: GradientState) {
        state = newState
    }
}

//
//  GradientView.swift
//  
//
//  Created by Gleb Fandeev on 27.02.2023.
//

import UIKit

public class GradientView: UIView {
    private let colors: [UIColor]
    private let startPoint: CGPoint
    private let endPoint: CGPoint

    private let gradientLayer = CAGradientLayer()

    public init(colors: [UIColor], startPoint: CGPoint, endPoint: CGPoint) {
        self.colors = colors
        self.startPoint = startPoint
        self.endPoint = endPoint
        super.init(frame: .zero)
    }

    required init?(coder: NSCoder) {
        preconditionFailure("init(coder:) has not been implemented")
        return nil
    }

    public override func draw(_ rect: CGRect) {
        gradientLayer.frame = bounds
        gradientLayer.colors = colors.map { $0.cgColor }
        gradientLayer.startPoint = startPoint
        gradientLayer.endPoint = endPoint

        layer.addSublayer(gradientLayer)
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

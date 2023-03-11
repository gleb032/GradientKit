//
//  GradientDirection.swift
//  
//
//  Created by Gleb Fandeev on 11.03.2023.
//

import Foundation

public enum GradientDirection {
    case left
    case right
    case up
    case down

    var startPoint: CGPoint {
        switch self {
        case .left:
            return .init(x: 1.0, y: 0.5)
        case .right:
            return .init(x: 0.0, y: 0.5)
        case .up:
            return .init(x: 0.5, y: 1.0)
        case .down:
            return .init(x: 0.5, y: 0.0)
        }
    }

    var endPoint: CGPoint {
        switch self {
        case .left:
            return .init(x: 0.0, y: 0.5)
        case .right:
            return .init(x: 1.0, y: 0.5)
        case .up:
            return .init(x: 0.5, y: 0.0)
        case .down:
            return .init(x: 0.5, y: 1.0)
        }
    }
}

//
//  LinearGradientDirection.swift
//  
//
//  Created by Gleb Fandeev on 11.03.2023.
//

import Foundation

public indirect enum LinearGradientDirection {
    case left
    case right
    case up
    case down
    case diagonal(from: LinearGradientDirection, to: LinearGradientDirection)

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

        case let .diagonal(from: .left, to: to):
            switch to {
            case .up:
                return .init(x: 0.0, y: 1.0)
            case .down:
                return .init(x: 0.0, y: 0.0)
            default:
                return defaultStartPoint
            }

        case let .diagonal(from: .right, to: to):
            switch to {
            case .up:
                return .init(x: 1.0, y: 1.0)
            case .down:
                return .init(x: 1.0, y: 0.0)
            default:
                return defaultStartPoint
            }

        case let .diagonal(from: .up, to: to):
            switch to {
            case .left:
                return .init(x: 1.0, y: 0.0)
            case .right:
                return .init(x: 0.0, y: 0.0)
            default:
                return defaultStartPoint
            }

        case let .diagonal(from: .down, to: to):
            switch to {
            case .left:
                return .init(x: 1.0, y: 1.0)
            case .right:
                return .init(x: 0.0, y: 1.0)
            default:
                return defaultStartPoint
            }
            
        default:
            return defaultStartPoint
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
            
        case let .diagonal(from: .left, to: to):
            switch to {
            case .up:
                return .init(x: 1.0, y: 0.0)
            case .down:
                return .init(x: 1.0, y: 1.0)
            default:
                return defaultEndPoint
            }
            
        case let .diagonal(from: .right, to: to):
            switch to {
            case .up:
                return .init(x: 0.0, y: 0.0)
            case .down:
                return .init(x: 0.0, y: 1.0)
            default:
                return defaultEndPoint
            }
            
        case let .diagonal(from: .up, to: to):
            switch to {
            case .left:
                return .init(x: 0.0, y: 1.0)
            case .right:
                return .init(x: 1.0, y: 1.0)
            default:
                return defaultEndPoint
            }
            
        case let .diagonal(from: .down, to: to):
            switch to {
            case .left:
                return .init(x: 0.0, y: 0.0)
            case .right:
                return .init(x: 1.0, y: 0.0)
            default:
                return defaultEndPoint
            }
            
        default:
            return defaultEndPoint
        }
    }
}

private extension LinearGradientDirection {

    var defaultStartPoint: CGPoint {
        .init(x: 0.0, y: 1.0)
    }

    var defaultEndPoint: CGPoint {
        .init(x: 1.0, y: 0.0)
    }
}

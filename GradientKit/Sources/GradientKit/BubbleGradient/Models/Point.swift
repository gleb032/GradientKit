//
//  Point.swift
//  
//
//  Created by Gleb Fandeev on 13.06.2023.
//

import Foundation

public struct Point {

    public typealias Coordinate = CGPoint

    public let coordinate: Coordinate
    public let color: ARGB

    public static func distance(_ p1: Coordinate, _ p2: Coordinate) -> CGFloat {
        sqrt((p1.x - p2.x) * (p1.x - p2.x) + (p1.y - p2.y) * (p1.y - p2.y))
    }

    public init(coordinate: Coordinate, color: ARGB) {
        self.coordinate = coordinate
        self.color = color
    }
}

public extension Point.Coordinate {
    init(x: Int, y: Int) {
        self.init(x: CGFloat(x), y: CGFloat(y))
    }
}

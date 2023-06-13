//
//  GradientGenerator.swift
//  
//
//  Created by Gleb Fandeev on 04.06.2023.
//

import CoreGraphics

public final class BubbleGradientGenerator {
    
    private let points: [Point]

    public init(
        points: [Point]
    ) {
        self.points = points
    }

    public func generate(size: CGSize) -> CGImage? {
        let height = Int(size.height)
        let width = Int(size.width)

        let influenceDistance = calculateInfluenceDistance(height: height, width: width)
        var colors: [ARGB] = []

        for y in 0..<height {
            for x in 0..<width {
                let currentPoint = Point.Coordinate(x: x, y: y)

                var summaryInfluence = 0.0
                var red = 0.0
                var green = 0.0
                var blue = 0.0

                points.forEach { point in
                    let influence = influence(
                        point.coordinate,
                        currentPoint,
                        influenceDistance: influenceDistance
                    )
                    summaryInfluence += influence
                    red += CGFloat(point.color.red) * influence
                    green += CGFloat(point.color.green) * influence
                    blue += CGFloat(point.color.blue) * influence
                }

                colors.append(
                    ARGB(
                        alpha: 255,
                        red: UInt8(red / summaryInfluence),
                        green: UInt8(green / summaryInfluence),
                        blue:  UInt8(blue / summaryInfluence)
                    )
                )
            }
        }

        return GradientImageFactory.make(
            from: colors,
            width: width,
            height: height
        )
    }

    private func influence(
        _ p1: Point.Coordinate,
        _ p2: Point.Coordinate,
        influenceDistance: CGFloat
    ) -> CGFloat {
        let distance = Point.distance(p1, p2)
        let factor = max(0.0, 1 - distance / influenceDistance)
        return factor * factor * factor * factor
    }

    private func calculateInfluenceDistance(height: Int, width: Int) -> CGFloat {
        var minDistance = Double.greatestFiniteMagnitude

        let cornerPoints: [Point.Coordinate] = [
            .init(x: 0, y: 0),
            .init(x: 0, y: height),
            .init(x: width, y: 0),
            .init(x: width, y: height)
        ]

        points.forEach { point in
            var maxDistance = 0.0
            cornerPoints.forEach { corner in
                maxDistance = max(
                    maxDistance,
                    Point.distance(corner, point.coordinate)
                )
            }
            minDistance = min(minDistance, maxDistance)
        }

        return minDistance
    }
}

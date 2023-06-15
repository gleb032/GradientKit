import UIKit

public struct LinearGradientViewModel {
    public let colors: [UIColor]
    public let startPoint: CGPoint
    public let endPoint: CGPoint
    public let locations: [NSNumber]?

    public init(
        colors: [UIColor],
        startPoint: CGPoint,
        endPoint: CGPoint,
        locations: [NSNumber]? = nil
    ) {
        self.colors = colors
        self.startPoint = startPoint
        self.endPoint = endPoint
        self.locations = locations
    }

    public init(
        colors: [UIColor],
        direction: LinearGradientDirection,
        locations: [NSNumber]? = nil
    ) {
        self.init(
            colors: colors,
            startPoint: direction.startPoint,
            endPoint: direction.endPoint,
            locations: locations
        )
    }
}

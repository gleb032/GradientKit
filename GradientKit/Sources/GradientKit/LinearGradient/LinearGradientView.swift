import UIKit

open class LinearGradientView: UIView {
    private var colors: [UIColor] = []
    private var startPoint: CGPoint? = nil
    private var endPoint: CGPoint? = nil
    private var locations: [NSNumber]? = nil

    private lazy var gradientLayer = CAGradientLayer()

    private(set) public var state: GradientState = .blank {
        didSet {
            switch state {
            case .gradient:
                layer.addSublayer(gradientLayer)
            case .blank:
                self.gradientLayer.removeFromSuperlayer()
            }
        }
    }

    public init() {
        super.init(frame: .zero)
    }

    public override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required public init?(coder: NSCoder) {
        preconditionFailure("init(coder:) has not been implemented")
    }

    override open func layoutSubviews() {
        super.layoutSubviews()
        updateGradient()
    }

    public func dissmisGradient() {
        setAndNotifyState(.blank)
    }
    
    public func applyGradient(
        colors: [UIColor],
        startPoint: CGPoint,
        endPoint: CGPoint,
        locations: [NSNumber]? = nil
    ) {
        self.colors = colors
        self.startPoint = startPoint
        self.endPoint = endPoint
        self.locations =  locations

        setAndNotifyState(.gradient)
        updateGradient()
    }

    public func applyGradient(
        colors: [UIColor],
        direction: LinearGradientDirection,
        locations: [NSNumber]? = nil
    ) {
        applyGradient(
            colors: colors,
            startPoint: direction.startPoint,
            endPoint: direction.endPoint,
            locations: locations
        )
    }
}

private extension LinearGradientView {
    func updateGradient() {
        if state == .gradient, let startPoint, let endPoint {
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

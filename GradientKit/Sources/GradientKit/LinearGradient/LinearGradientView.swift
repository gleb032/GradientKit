import UIKit

open class LinearGradientView: UIView {

    private var viewModel: LinearGradientViewModel?
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

    public func applyGradient(with viewModel: LinearGradientViewModel) {
        self.viewModel = viewModel
        setAndNotifyState(.gradient)
        updateGradient()
    }
    
    public func applyGradient(
        colors: [UIColor],
        startPoint: CGPoint,
        endPoint: CGPoint,
        locations: [NSNumber]? = nil
    ) {
        let viewModel = LinearGradientViewModel(
            colors: colors,
            startPoint: startPoint,
            endPoint: endPoint,
            locations: locations
        )
        applyGradient(with: viewModel)
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
        if state == .gradient, let viewModel {
            gradientLayer.frame = bounds
            gradientLayer.colors = viewModel.colors.map { $0.cgColor }
            gradientLayer.startPoint = viewModel.startPoint
            gradientLayer.endPoint = viewModel.endPoint
            gradientLayer.locations = viewModel.locations
        }
    }

    func setAndNotifyState(_ newState: GradientState) {
        state = newState
    }
}

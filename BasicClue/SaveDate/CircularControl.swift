import UIKit

class CircularControl: UIControl {
    private let lineWidth: CGFloat = 22
    private var engine: CircularControlLayoutEngine!

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUp()
    }

    private func setUp() {
        layer.masksToBounds = false
        backgroundColor = .clear
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        engine = CircularControlLayoutEngine(
            sideLength: bounds.size.width,
            lineWidth: lineWidth,
            range: 1...4
        )
    }

    override func draw(_ rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()
        setUpContextForCircle(context)
        context?.addArc(
            center: engine.center,
            radius: engine.radius,
            startAngle: 0,
            endAngle: 2 * .pi,
            clockwise: false
        )
        context?.drawPath(using: .stroke)
        drawHandle(in: context)
    }

    private func setUpContextForCircle(_ context: CGContext?) {
        context?.setStrokeColor(UIColor.black.cgColor)
        context?.setLineWidth(lineWidth)
        context?.setLineCap(.butt)
    }

    private func drawHandle(in context: CGContext?) {
        context?.saveGState()
        setUpContextForHandle(context)
        context?.fillEllipse(in: engine.handlePosition)
        context?.restoreGState()
    }

    private func setUpContextForHandle(_ context: CGContext?) {
        context?.setFillColor(UIColor.red.cgColor)
    }

    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        super.continueTracking(touch, with: event)
        engine.updateAngle(for: touch.location(in: self))
        setNeedsDisplay()
        return true
    }
}

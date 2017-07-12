import UIKit

class CircularControl: UIControl {
    
    private let lineWidth: CGFloat = 22
    private let handleSize = CGSize(width: 44, height: 44)
    private var engine: CircularControlLayoutEngine!
    
    var selectedValue: Int {
        return engine.selectedValue
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        isOpaque = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("unimplemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        engine = CircularControlLayoutEngine(
            sideLength: bounds.size.width,
            lineWidth: lineWidth,
            range: 1...31
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
        context?.fillEllipse(in: engine.handleRect)
        context?.restoreGState()
    }
    
    private func setUpContextForHandle(_ context: CGContext?) {
        context?.setShadow(offset: .zero, blur: 3, color: UIColor.black.cgColor)
        context?.setFillColor(UIColor.white.cgColor)
    }
    
    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        super.continueTracking(touch, with: event)
        engine.updateAngle(with: touch.location(in: self))
        setNeedsDisplay()
        print(engine.selectedValue)
        return true
    }
    
}

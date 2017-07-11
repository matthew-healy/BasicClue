import UIKit
import GLKit

class CircularControl: UIControl {
    
    private let π: CGFloat = .pi
    private let lineWidth: CGFloat = 22
    
    private var radius: CGFloat {
        return bounds.size.width / 2 - 2 * lineWidth
    }
    
    private var circleCenter: CGPoint {
        return CGPoint(x: radius + 2 * lineWidth, y: bounds.size.height / 2)
    }
    
    var angle: Int = 0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    private func setup() {
        backgroundColor = .clear
    }
    
    override func draw(_ rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()
        context?.addArc(center: circleCenter, radius: radius, startAngle: 0, endAngle: 2 * π, clockwise: false)
        context?.setStrokeColor(UIColor.black.cgColor)
        context?.setLineWidth(lineWidth)
        context?.setLineCap(.butt)
        context?.drawPath(using: .stroke)
        drawHandle(in: context)
    }
    
    private func drawHandle(in context: CGContext?) {
        context?.saveGState()
        context?.setShadow(offset: .zero, blur: 3, color: UIColor.black.cgColor)
        context?.setFillColor(UIColor.white.cgColor)
        
        let handleCenter = point(fromAngle: angle)
        context?.fillEllipse(in: CGRect(x: handleCenter.x - lineWidth, y: handleCenter.y - lineWidth, width: 44, height: 44))
        
        context?.restoreGState()
    }
    
    private func point(fromAngle angle: Int) -> CGPoint {
        let angleRadians = Double(GLKMathDegreesToRadians(Float(angle - 90)))
        
        let yCoord = round(Double(radius) * sin(angleRadians)) + Double(circleCenter.y)
        let xCoord = round(Double(radius) * cos(angleRadians)) + Double(circleCenter.x)
        let result = CGPoint(x: xCoord, y: yCoord)
        
        return result
    }
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        super.beginTracking(touch, with: event)
        return true
    }
    
    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        super.continueTracking(touch, with: event)
        let point = touch.location(in: self)
        angle = angle(from: point)
        setNeedsDisplay()
        return true
    }
    
    private func angle(from point: CGPoint) -> Int {
        let unitVector = CGPoint(x: 0, y: 1)
        let newPointVector = CGPoint(x: point.x - circleCenter.x, y: point.y - circleCenter.y)
        
        let angleInRadians = atan2(newPointVector.y, newPointVector.x) - atan2(unitVector.y, unitVector.x)
        let angleInDegrees = GLKMathRadiansToDegrees(Float(angleInRadians))
        
        return Int(angleInDegrees + 180)
    }
    
}

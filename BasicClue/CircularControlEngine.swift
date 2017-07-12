import UIKit

struct CircularControlLayoutEngine {
    private let lineWidth: CGFloat
    private let sideLength: CGFloat
    private let range: ClosedRange<Int>
    
    private var angle: CGFloat = 0
    
    var radius: CGFloat {
        return (sideLength / 2) - (2 * lineWidth)
    }
    
    var center: CGPoint {
        return CGPoint(x: sideLength / 2, y: sideLength / 2)
    }
    
    var selectedValue: Int {
        return Int(ceil((angle / (2 * .pi)) * CGFloat(range.upperBound)))
    }
    
    init(sideLength: CGFloat, lineWidth: CGFloat, range: ClosedRange<Int>) {
        self.sideLength = sideLength
        self.lineWidth = lineWidth
        self.range = range
    }
    
    var handleRect: CGRect {
        let angleFromNorth = 3/2 * .pi + angle
        let x = radius * cos(angleFromNorth) + center.x - lineWidth
        let y = radius * sin(angleFromNorth) + center.y - lineWidth
        let origin = CGPoint(x: x, y: y)
        let size = CGSize(width: 44, height: 44)
        return CGRect(origin: origin, size: size)
    }
    
    mutating func updateAngle(with point: CGPoint) {
        let unit = CGPoint(x: 0, y: 1)
        let difference = CGPoint(x: center.x - point.x, y: center.y - point.y)
        let result = atan2(difference.y, difference.x) - atan2(unit.y, unit.x)
        angle = result > 0 ? result : result + 2 * .pi
    }
    
}

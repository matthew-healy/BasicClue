import UIKit

struct CircularControlLayoutEngine {
    private let minimumTouchDimension = 44
    private let viewSideLength: CGFloat
    private let outlineWidth: CGFloat
    private let valueRange: ClosedRange<Int>

    private var angle: CGFloat = 0

    var radius: CGFloat {
        return (viewSideLength / 2) - outlineWidth
    }

    var center: CGPoint {
        return CGPoint(x: viewSideLength / 2, y: viewSideLength / 2)
    }

    var selectedValue: Int {
        let proportionOfRotation = angle / (2 * .pi)
        let stepsInRange = floor(proportionOfRotation * CGFloat(valueRange.count))
        return  valueRange.lowerBound + Int(stepsInRange)
    }

    var handlePosition: CGRect {
        let angleFromNorth = (3/2) * .pi + angle
        let origin = CGPoint(
            x: radius * cos(angleFromNorth) + center.x - outlineWidth,
            y: radius * sin(angleFromNorth) + center.y - outlineWidth
        )
        let size = CGSize(
            width: minimumTouchDimension,
            height: minimumTouchDimension
        )
        return CGRect(origin: origin, size: size)
    }

    init(sideLength: CGFloat, lineWidth: CGFloat, range: ClosedRange<Int>) {
        viewSideLength = sideLength
        outlineWidth = lineWidth
        valueRange = range
    }

    mutating func updateAngle(for point: CGPoint) {
        let unit = CGPoint(x: 0, y: 1)
        let difference = CGPoint(x: center.x - point.x, y: center.y - point.y)
        let result = atan2(difference.y, difference.x) - atan2(unit.y, unit.x)
        angle = result > 0 ? result : result + 2 * .pi
    }
}

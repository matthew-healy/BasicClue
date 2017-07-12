import UIKit

struct CircularControlLayoutEngine {
    private let minimumTouchDimension = 44
    private let viewSideLength: Double
    private let outlineWidth: Double

    var radius: Double {
        return (viewSideLength / 2) - (2 * outlineWidth)
    }

    var center: CGPoint {
        return CGPoint(x: viewSideLength / 2, y: viewSideLength / 2)
    }

    var handlePosition: CGRect {
        let origin = CGPoint(x: 2, y: 0)
        let size = CGSize(
            width: minimumTouchDimension,
            height: minimumTouchDimension
        )
        return CGRect(origin: origin, size: size)
    }

    init(sideLength: Double, lineWidth: Double) {
        viewSideLength = sideLength
        outlineWidth = lineWidth
    }
}

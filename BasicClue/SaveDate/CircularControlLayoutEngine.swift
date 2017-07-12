import UIKit

struct CircularControlLayoutEngine {
    private let viewSideLength: Double
    private let outlineWidth: Double

    var radius: Double {
        return (viewSideLength / 2) - (2 * outlineWidth)
    }

    var center: CGPoint {
        return CGPoint(x: viewSideLength / 2, y: viewSideLength / 2)
    }

    init(sideLength: Double, lineWidth: Double) {
        viewSideLength = sideLength
        outlineWidth = lineWidth
    }
}

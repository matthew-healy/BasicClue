import Foundation

struct CircularControlLayoutEngine {
    private let viewSideLength: Double
    private let outlineWidth: Double

    var radius: Double {
        return (viewSideLength / 2) - (2 * outlineWidth)
    }

    init(sideLength: Double, lineWidth: Double) {
        viewSideLength = sideLength
        outlineWidth = lineWidth
    }
}

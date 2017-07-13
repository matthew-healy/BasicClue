import Foundation

class SaveDateEventController {
    private let presenter: SaveDatePresenting

    init(presenter: SaveDatePresenting) {
        self.presenter = presenter
    }

    func selected(date: Int) {
        presenter.present(day: date)
    }
}

import Foundation

class SaveDateEventController {
    private let presenter: SaveDatePresenting

    init(presenter: SaveDatePresenting) {
        self.presenter = presenter
    }

    func interfaceDidLoad() {
        presenter.setUpScreen()
        let firstDay = 1
        presenter.present(day: firstDay)
    }

    func selected(date: Int) {
        presenter.present(day: date)
    }
}

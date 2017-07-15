import Foundation

class SaveDateEventController {
    private let presenter: SaveDatePresenting
    private let interactor: SaveDateInteracting

    init(presenter: SaveDatePresenting, interactor: SaveDateInteracting) {
        self.presenter = presenter
        self.interactor = interactor
    }

    func interfaceDidLoad() {
        presenter.setUpScreen()
        let firstDay = 1
        presenter.present(day: firstDay)
    }

    func selected(date: Int) {
        presenter.present(day: date)
    }

    func saveDateButtonTapped(date: Int) {
        interactor.saveDate(date)
    }
}

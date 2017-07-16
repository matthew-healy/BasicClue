import Foundation

class SaveDateEventController {
    private let presenter: SaveDatePresenting
    private let interactor: SaveDateInteracting

    private var date = 1

    init(presenter: SaveDatePresenting, interactor: SaveDateInteracting) {
        self.presenter = presenter
        self.interactor = interactor
    }

    func interfaceDidLoad() {
        presenter.setUpScreen()
        presenter.present(day: date, selected: false)
    }

    func selected(date: Int) {
        self.date = date
        presenter.present(day: date, selected: false)
    }

    func saveDateButtonTapped() {
        interactor.saveDate(date)
    }
}

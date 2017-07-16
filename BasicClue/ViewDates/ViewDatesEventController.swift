class ViewDatesEventController {
    private let presenter: ViewDatesPresenting
    private let interactor: ViewDatesInteracting

    init(presenter: ViewDatesPresenting, interactor: ViewDatesInteracting) {
        self.presenter = presenter
        self.interactor = interactor
    }

    func interfaceDidLoad() {
        let dates = interactor.getDates()
        presenter.presentDates(dates)
    }
}

class ViewDatesPresenter {
    private let viewDelegate: ViewDatesViewing

    init(viewDelegate: ViewDatesViewing) {
        self.viewDelegate = viewDelegate
    }

    func presentDates(_ dates: [String]) {
        viewDelegate.displayDates(dates)
    }
}

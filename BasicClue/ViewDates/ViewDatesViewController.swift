import UIKit

class ViewDatesViewController: UIViewController {
    private let cellId = "DateCell"
    private var eventController: ViewDatesEventController? = nil
    private var dates: [String] = []

    @IBOutlet weak var datesTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpWireframe()
        eventController?.interfaceDidLoad()
        datesTableView.dataSource = self
        datesTableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
    }

    private func setUpWireframe() {
        let presenter = ViewDatesPresenter(view: self)
        let dataStore = UserDefaultsDataStore(userDefaults: UserDefaults.standard)
        let interactor = ViewDatesInteractor(dataStore: dataStore)
        eventController = ViewDatesEventController(presenter: presenter, interactor: interactor)
    }

}

extension ViewDatesViewController: ViewDatesViewing {
    func displayDates(_ dates: [String]) {
        self.dates = dates
        datesTableView.reloadData()
    }
}

extension ViewDatesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dates.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        cell.textLabel?.text = dates[indexPath.row]
        return cell
    }
}

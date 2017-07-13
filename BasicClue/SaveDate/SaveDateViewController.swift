import UIKit

class SaveDateViewController: UIViewController {

    private var eventController: SaveDateEventController? = nil

    @IBOutlet weak var saveDateButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpWireframe()
        saveDateButton.layer.masksToBounds = true
    }

    private func setUpWireframe() {
        let presenter = SaveDatePresenter(view: self)
        eventController = SaveDateEventController(presenter: presenter)
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        saveDateButton.layer.cornerRadius = saveDateButton.frame.width / 2
    }

    @IBAction func circularControlValueDidChange(_ sender: CircularControl) {
        eventController?.selected(date: sender.selectedValue)
    }
}

extension SaveDateViewController: SaveDateViewing {
    func display(viewModel: String) {
        saveDateButton.setTitle(viewModel, for: .normal)
    }
}

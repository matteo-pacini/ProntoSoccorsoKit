
import UIKit

final class InstituteListViewController: UIViewController {

    var output: (InstituteListViewOutput & InstituteListDataStore)?
    var router: (InstituteListRouter & InstituteListDataPassing)?

    // MARK: - Views

    @IBOutlet private weak var tableView: UITableView! {
        didSet {
            tableView.register(UINib(nibName: "LabelTableViewCell", bundle: nil),
                               forCellReuseIdentifier: LabelTableViewCell.identifier)
            tableView.delegate = self
        }
    }

    var dataSource: TableViewDataSource<LabelTableViewCell>! {
        didSet {
            tableView.dataSource = dataSource
            tableView.reloadData()
        }
    }

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        output?.viewDidLoad()
    }

}

// MARK: - InstituteListPresenterOutput

extension InstituteListViewController: InstituteListPresenterOutput {

    func presentTitle(viewModel: InstituteList.Title.ViewModel) {
        title = viewModel.title
    }

    func presentData(viewModel: InstituteList.Data.ViewModel) {
        dataSource = TableViewDataSource(viewModels: viewModel.institutes)
    }

    func presentLoading(viewModel: InstituteList.Loading.ViewModel) {
        if viewModel.loading {
            LoadingView.show(on: view)
        } else {
            LoadingView.hide()
        }
    }

}

// MARK: - UITableViewDelegate

extension InstituteListViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }

}

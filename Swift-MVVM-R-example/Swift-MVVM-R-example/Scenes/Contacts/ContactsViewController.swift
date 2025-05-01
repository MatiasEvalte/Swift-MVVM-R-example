import UIKit

// MARK: - ContactsViewController

final class ContactsViewController: UIViewController {
  
  // MARK: - Internal Variables
  
  let viewModel: ContactsViewModelProtocol
  let baseView = ContactsView()
  
  // MARK: - Init
  
  init(viewModel: ContactsViewModelProtocol) {
    self.viewModel = viewModel
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func loadView() {
    view = baseView
  }
  
  // MARK: - Life Cicle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    title = "Contatos"
    
    baseView.tableView.delegate = self
    baseView.tableView.dataSource = self
    viewModel.getcontacts()
    
    viewModel.updateView.addObservation(for: self) { viewController, state in
      switch state {
      case .notRequested:
        break
      case .isLoading:
        viewController.baseView.activityIndicator.startAnimating()
        viewController.baseView.activityIndicator.isHidden = false
      case .loaded:
        viewController.baseView.activityIndicator.stopAnimating()
        viewController.baseView.activityIndicator.isHidden = true
        viewController.baseView.titleLabel.isHidden = true
        viewController.baseView.tableView.reloadData()
      case .failed:
        viewController.baseView.activityIndicator.stopAnimating()
        viewController.baseView.activityIndicator.isHidden = true
        viewController.baseView.titleLabel.isHidden = false
      }
    }
  }
}

// MARK: - UITableViewDataSource

extension ContactsViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return viewModel.contacts.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: ContactsCellView.identifier,
                                                   for: indexPath) as? ContactsCellView else {
      return UITableViewCell()
    }
    
    cell.configure(model: viewModel.contacts[indexPath.row])
    return cell
  }
}

// MARK: - UITableViewDelegate

extension ContactsViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    viewModel.contactProfile(contactDetail: viewModel.contacts[indexPath.row])
  }
}

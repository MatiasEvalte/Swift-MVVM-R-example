import UIKit

// MARK: - ContactsViewController

final class ContactsViewController: UIViewController {
  
  // MARK: - Internal Variables
  
  let viewModel: ContactsViewModelProtocol
  
  // MARK: - Init
  
  init(viewModel: ContactsViewModelProtocol) {
    self.viewModel = viewModel
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func loadView() {
    /// Substitui a view principal pela ContactsView...
    view = ContactsView()
  }
  
  // MARK: - Life Cicle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    title = "Contatos"
    
    viewModel.getcontacts()
  }
}


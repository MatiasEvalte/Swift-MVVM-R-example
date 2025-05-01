import UIKit

// MARK: - ContactProfileViewController

final class ContactProfileViewController: UIViewController {
  
  // MARK: - Internal Variables
  
  let viewModel: ContactProfileViewModelProtocol
  let baseView = ContactProfileView()
  
  // MARK: - Init
  
  init(viewModel: ContactProfileViewModelProtocol) {
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
    title = "Perfil"
  }
}

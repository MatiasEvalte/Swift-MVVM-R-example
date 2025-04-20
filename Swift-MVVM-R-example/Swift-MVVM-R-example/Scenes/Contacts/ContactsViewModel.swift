
// MARK: - ContactsNavigationDelegate

protocol ContactsNavigationDelegate: AnyObject {
  func showDetailScreen()
}

// MARK: - ContactsViewModelProtocol

protocol ContactsViewModelProtocol {
  func getcontacts()
}

// MARK: - ContactsViewModel

final class ContactsViewModel {
  // MARK: - Private Variables
  
  private weak var navigationDelegate: ContactsNavigationDelegate?
  private var service: ContactsWorkerProtocol
  
  // MARK: - Init
  
  init(navigationDelegate: ContactsNavigationDelegate? = nil,
       service: ContactsWorkerProtocol = ContactsWorker()) {
    self.navigationDelegate = navigationDelegate
    self.service = service
  }
}

// MARK: - Internal Methods

extension ContactsViewModel: ContactsViewModelProtocol {
  func getcontacts() {
    service.getContacts { [weak self] result in
      guard let self = self else { return }
      
      switch result {
      case .success(let contacts):
        print("Lista de contatos: \(contacts)")
      case .failure(let error):
        print("Erro: \(error)")
      }
    }
  }
}

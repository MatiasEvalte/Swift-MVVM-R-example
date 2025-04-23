
// MARK: - ContactsNavigationDelegate

protocol ContactsNavigationDelegate: AnyObject {
  func showDetailScreen()
}

// MARK: - ContactsViewModelProtocol

protocol ContactsViewModelProtocol {
  var updateView: Bindable<Loadable<Bool>> { get }
  var contacts: [Contact] { get }
  
  func getcontacts()
}

// MARK: - ContactsViewModel

final class ContactsViewModel {
  // MARK: - Private Variables
  
  private weak var navigationDelegate: ContactsNavigationDelegate?
  private var service: ContactsWorkerProtocol
  
  var contacts: [Contact] = []
  let updateView: Bindable<Loadable<Bool>> = Bindable(.notRequested)
  
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
    updateView.update(with: Loadable.isLoading(last: nil))
    service.getContacts { [weak self] result in
      guard let self = self else { return }
      
      switch result {
      case .success(let contacts):
        self.contacts = contacts
        updateView.update(with: Loadable.loaded(true))
      case .failure(let error):
        updateView.update(with: Loadable.failed(error))
      }
    }
  }
}

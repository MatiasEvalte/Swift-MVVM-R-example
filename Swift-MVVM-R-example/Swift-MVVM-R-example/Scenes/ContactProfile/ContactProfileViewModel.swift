// MARK: - ContactProfileViewModelProtocol

protocol ContactProfileViewModelProtocol {
  
}

// MARK: - ContactProfileViewModel

final class ContactProfileViewModel {
  // MARK: - Private Variables
  
  private weak var navigationDelegate: ContactsNavigationDelegate?
  
  // MARK: - Internal Variables
  
  var contactDetail: Contact
  
  // MARK: - Init
  
  init(navigationDelegate: ContactsNavigationDelegate? = nil,
       contactDetail: Contact) {
    self.navigationDelegate = navigationDelegate
    self.contactDetail = contactDetail
  }
}

// MARK: - Internal Methods

extension ContactProfileViewModel: ContactProfileViewModelProtocol {
  
}

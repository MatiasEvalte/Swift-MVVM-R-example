import UIKit

// MARK: - AppRouter

class AppRouter: AppRouterProtocol {
  // MARK: - Private Variables
  
  private let window: UIWindow
  private let navigationController: UINavigationController = {
    let navigationController = UINavigationController()
    return navigationController
  }()
  
  // MARK: - Init
  
  init(window: UIWindow) {
    self.window = window
    self.window.rootViewController = navigationController
    self.window.makeKeyAndVisible()
  }
  
  func start() {
    let viewModel = ContactsViewModel(navigationDelegate: self)
    let viewController = ContactsViewController(viewModel: viewModel)
    navigationController.pushViewController(viewController, animated: true)
  }
}

// MARK: - ContactsNavigationDelegate

extension AppRouter: ContactsNavigationDelegate {
  func showContactProfileScreen(contactDetail: Contact) {
    let viewModel = ContactProfileViewModel(navigationDelegate: self,
                                            contactDetail: contactDetail)
    let viewController = ContactProfileViewController(viewModel: viewModel)
    navigationController.pushViewController(viewController, animated: true)
  }
}

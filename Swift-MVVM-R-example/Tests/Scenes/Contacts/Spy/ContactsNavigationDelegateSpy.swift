
import XCTest

@testable import Swift_MVVM_R_example

// MARK: - ContactsNavigationDelegateSpy

final class ContactsNavigationDelegateSpy: ContactsNavigationDelegate {
  var showDetailScreenCalled: Bool = false
  
  func showDetailScreen() {
    showDetailScreenCalled = true
  }
}

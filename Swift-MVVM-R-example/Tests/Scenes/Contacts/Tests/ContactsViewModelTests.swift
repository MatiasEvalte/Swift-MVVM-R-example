
import XCTest

@testable import Swift_MVVM_R_example

// MARK: - ContactsViewModelTests

final class ContactsViewModelTests: XCTestCase {
  private var sut: ContactsViewModel!
  private var navigationDelegate: ContactsNavigationDelegateSpy!
  private var service: ContactsWorkerMock!
  
  override func setUp() {
    super.setUp()
    
    navigationDelegate = ContactsNavigationDelegateSpy()
    service = ContactsWorkerMock()
    sut = ContactsViewModel(navigationDelegate: navigationDelegate,
                            service: service)
  }
  
  override func tearDown() {
    super.tearDown()
    
    sut = nil
    navigationDelegate = nil
    service = nil
  }
}

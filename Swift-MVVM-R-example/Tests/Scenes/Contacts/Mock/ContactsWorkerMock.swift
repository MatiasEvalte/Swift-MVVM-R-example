
import XCTest

@testable import Swift_MVVM_R_example

// MARK: - ContactsWorkerMock

final class ContactsWorkerMock: ContactsWorkerProtocol {
  
  var serviceShouldFail: Bool = true
  let error: Error = NSError(domain: "Erro", code: 999)
  
  func getContacts(completion: @escaping (Result<[Contact], any Error>) -> Void) {
    if serviceShouldFail {
      completion(.failure(error))
    } else {
      completion(.success(makeContactList()))
    }
  }
}

extension ContactsWorkerMock {
  func makeContactList() -> [Contact] {
    let contactOne: Contact = Contact(name: "Matias",
                                      lastName: "Evalte",
                                      number: "51 999999999")
    
    let contactTwo: Contact = Contact(name: "Gabi",
                                      lastName: "Fermiano",
                                      number: "51 999999999")
    
    let contactThree: Contact = Contact(name: "Filippo",
                                        lastName: "Evalte",
                                        number: "51 999999999")
    
    return [contactOne, contactTwo, contactThree]
  }
}

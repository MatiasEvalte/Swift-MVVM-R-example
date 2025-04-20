
// MARK: - ContactsWorkerProtocol

protocol ContactsWorkerProtocol {
  func getContacts(completion: @escaping (Result<[Contact], Error>) -> Void)
}

// MARK: - ContactsWorker

final class ContactsWorker {
  init() { }
}

// MARK: - Internal Methods

extension ContactsWorker: ContactsWorkerProtocol {
  func getContacts(completion: @escaping (Result<[Contact], any Error>) -> Void) {
    let contactOne: Contact = Contact(name: "Matias",
                                      lastName: "Evalte",
                                      number: "51 999999999")
    
    let contactTwo: Contact = Contact(name: "Gabi",
                                      lastName: "Fermiano",
                                      number: "51 999999999")
    
    let contactThree: Contact = Contact(name: "Filippo",
                                        lastName: "Evalte",
                                        number: "51 999999999")
    
    completion(.success([contactOne, contactTwo, contactThree]))
  }
}

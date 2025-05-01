import Foundation

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
    
    
    DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [weak self] in
      guard let self = self else { return }
      completion(.success(self.mockContacts()))
    }
  }
}

// MARK: - Mocks

extension ContactsWorker {
  func mockContacts() -> [Contact] {
    let contactOne: Contact = Contact(name: "Matias",
                                      lastName: "Evalte",
                                      number: "51 111111111")
    
    let contactTwo: Contact = Contact(name: "Gabi",
                                      lastName: "Fermiano",
                                      number: "51 222222222")
    
    let contactThree: Contact = Contact(name: "Filippo",
                                        lastName: "Evalte",
                                        number: "51 333333333")
    
    let contactFour: Contact = Contact(name: "Eliane",
                                       lastName: "Evalte",
                                       number: "51 444444444")
    
    let contactFive: Contact = Contact(name: "Graci",
                                       lastName: "Fermiano",
                                       number: "51 555555555")
    
    let contactSix: Contact = Contact(name: "Rodrigo",
                                      lastName: "Evalte",
                                      number: "51 666666666")
    
    let contactSeven: Contact = Contact(name: "Elisa",
                                        lastName: "Evalte",
                                        number: "51 777777777")
    
    let contactEight: Contact = Contact(name: "Danilo",
                                        lastName: "Fermiano",
                                        number: "51 888888888")
    
    let contactNine: Contact = Contact(name: "Davi",
                                       lastName: "Evalte",
                                       number: "51 999999999")
    
    let contacts: [Contact] = [contactOne, contactTwo, contactThree,
                               contactFour, contactFive, contactSix,
                               contactSeven, contactEight, contactNine]
    
    return contacts
  }
}

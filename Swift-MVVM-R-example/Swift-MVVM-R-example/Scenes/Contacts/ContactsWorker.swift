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
    let contactOne = Contact(name: "Matias",
                             nickName: "Mati",
                             followers: 120,
                             buttonTitleFollow: "Seguir",
                             buttonTitleUnfollow: "Deixar de seguir")
    
    let contactTwo = Contact(name: "Gabi",
                             nickName: "Gabz",
                             followers: 95,
                             buttonTitleFollow: "Seguir",
                             buttonTitleUnfollow: "Deixar de seguir")
    
    let contactThree = Contact(name: "Filippo",
                               nickName: "Pipe",
                               followers: 230,
                               buttonTitleFollow: "Seguir",
                               buttonTitleUnfollow: "Deixar de seguir")
    
    let contactFour = Contact(name: "Eliane",
                              nickName: "Nani",
                              followers: 310,
                              buttonTitleFollow: "Seguir",
                              buttonTitleUnfollow: "Deixar de seguir")
    
    let contactFive = Contact(name: "Graci",
                              nickName: "Gra",
                              followers: 78,
                              buttonTitleFollow: "Seguir",
                              buttonTitleUnfollow: "Deixar de seguir")
    
    let contactSix = Contact(name: "Rodrigo",
                             nickName: "Digo",
                             followers: 152,
                             buttonTitleFollow: "Seguir",
                             buttonTitleUnfollow: "Deixar de seguir")
    
    let contactSeven = Contact(name: "Elisa",
                               nickName: "Lili",
                               followers: 87,
                               buttonTitleFollow: "Seguir",
                               buttonTitleUnfollow: "Deixar de seguir")
    
    let contactEight = Contact(name: "Danilo",
                               nickName: "Danilinho",
                               followers: 204,
                               buttonTitleFollow: "Seguir",
                               buttonTitleUnfollow: "Deixar de seguir")
    
    let contactNine = Contact(name: "Davi",
                              nickName: "Davizinho",
                              followers: 135,
                              buttonTitleFollow: "Seguir",
                              buttonTitleUnfollow: "Deixar de seguir")
    
    
    let contacts: [Contact] = [contactOne, contactTwo, contactThree,
                               contactFour, contactFive, contactSix,
                               contactSeven, contactEight, contactNine]
    
    return contacts
  }
}

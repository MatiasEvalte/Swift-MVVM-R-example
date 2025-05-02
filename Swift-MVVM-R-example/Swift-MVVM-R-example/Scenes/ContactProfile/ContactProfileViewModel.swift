import Foundation

// MARK: - ContactProfileViewModelProtocol

protocol ContactProfileViewModelProtocol {
  var contactDetail: Contact { get }
  var userFollowers: String { get }
  
  func countFollowers()
  func configureModelUI() -> ContactProfile
}

// MARK: - ContactProfileViewModel

final class ContactProfileViewModel {
  // MARK: - Private Variables
  
  private weak var navigationDelegate: ContactsNavigationDelegate?
  private var isFollow: Bool = false
  
  // MARK: - Internal Variables
  
  var contactDetail: Contact
  var userFollowers: String = String()
  
  // MARK: - Init
  
  init(navigationDelegate: ContactsNavigationDelegate? = nil,
       contactDetail: Contact) {
    self.navigationDelegate = navigationDelegate
    self.contactDetail = contactDetail
    self.userFollowers = customizeNumber(value: contactDetail.followers ?? 0)
  }
}

// MARK: - Internal Methods

extension ContactProfileViewModel: ContactProfileViewModelProtocol {
  func countFollowers() {
    isFollow.toggle()
    var followersHelper = contactDetail.followers ?? 0
    isFollow ? (followersHelper += 1) : (followersHelper -= 1)
    contactDetail.followers = followersHelper
    
    userFollowers = customizeNumber(value: followersHelper)
  }
  
  func customizeNumber(value: Int) -> String {
    let formatter = NumberFormatter ()
    formatter.numberStyle = .decimal
    formatter.locale = Locale(identifier: "pt_BR")
    let shorten = formatter.string (for: value) ?? "0"
    return "\(shorten) k"
  }
  
  func configureModelUI() -> ContactProfile {
    let followers = customizeNumber(value: contactDetail.followers ?? Int())
    let model = ContactProfile(name: contactDetail.name ?? String(),
                               nickName: contactDetail.nickName ?? String(),
                               followers: followers,
                               buttonTitleFollow: contactDetail.buttonTitleFollow ?? String(),
                               buttonTitleUnfollow: contactDetail.buttonTitleUnfollow ?? String())
    
    return model
  }
}

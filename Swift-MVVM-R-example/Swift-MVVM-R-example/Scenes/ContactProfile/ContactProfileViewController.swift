import UIKit

// MARK: - ContactProfileViewController

final class ContactProfileViewController: UIViewController {
  
  // MARK: - Internal Variables
  
  let viewModel: ContactProfileViewModelProtocol
  let baseView = ContactProfileView()
  
  // MARK: - Init
  
  init(viewModel: ContactProfileViewModelProtocol) {
    self.viewModel = viewModel
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func loadView() {
    view = baseView
  }
  
  // MARK: - Life Cicle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    title = "Perfil"
    
    baseView.configureUI(contactDetail: viewModel.contactDetail,
                         followers: viewModel.userFollowers)
    
    baseView.followButton.addTarget(self,
                                    action: #selector(followTapped),
                                    for: .touchUpInside)
    baseView.unfollowButton.addTarget(self,
                                      action: #selector(unfollowTapped),
                                      for: .touchUpInside)
  }
}

// MARK: - Actions

extension ContactProfileViewController {
  @objc private func followTapped() {
    viewModel.countFollowers()
    baseView.followButtonEnabled(isEnabled: false,
                                 followers: viewModel.userFollowers)
  }
  
  @objc private func unfollowTapped() {
    viewModel.countFollowers()
    baseView.followButtonEnabled(isEnabled: true,
                                 followers: viewModel.userFollowers)
  }
}

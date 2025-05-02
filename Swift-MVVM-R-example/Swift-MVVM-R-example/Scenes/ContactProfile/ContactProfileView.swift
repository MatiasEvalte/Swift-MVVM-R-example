import UIKit

// MARK: - ContactProfileView

final class ContactProfileView: UIView {
  
  private enum Constants {
    static let width: CGFloat = 250
    static let height: CGFloat = 250
    static let cornerRadius: CGFloat = 125
  }
  
  // MARK: - Internal Variables
  
  private let profileImageView: UIImageView = {
    let imageView = UIImageView(image: UIImage(named: "Profile"))
    imageView.translatesAutoresizingMaskIntoConstraints = false
    imageView.layer.cornerRadius = Constants.cornerRadius
    imageView.clipsToBounds = true
    return imageView
  }()
  
  private let nameLabel: UILabel = {
    let label = UILabel()
    label.font = UIFont.boldSystemFont(ofSize: 50)
    label.textAlignment = .center
    return label
  }()
  
  private let nicknameLabel: UILabel = {
    let label = UILabel()
    label.font = UIFont.systemFont(ofSize: 25)
    label.textColor = .gray
    label.textAlignment = .center
    return label
  }()
  
  private let followersLabel: UILabel = {
    let label = UILabel()
    label.font = UIFont.systemFont(ofSize: 80, weight: .light)
    label.textAlignment = .center
    return label
  }()
  
  private let stackView: UIStackView = {
    let stackView = UIStackView()
    stackView.axis = .vertical
    stackView.spacing = 20
    stackView.alignment = .center
    stackView.translatesAutoresizingMaskIntoConstraints = false
    return stackView
  }()
  
  // MARK: - Internal Variables
  
  let followButton: UIButton = {
    let button = UIButton(type: .system)
    button.titleLabel?.font = UIFont.preferredFont(forTextStyle: .title3)
    button.setTitleColor(.white, for: .normal)
    button.backgroundColor = .systemBlue
    button.layer.cornerRadius = 10
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  
  let unfollowButton: UIButton = {
    let button = UIButton(type: .system)
    button.titleLabel?.font = UIFont.preferredFont(forTextStyle: .title3)
    button.setTitleColor(.white, for: .normal)
    button.backgroundColor = .systemGray
    button.layer.cornerRadius = 10
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  
  // MARK: - Init
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupView()
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
    setupView()
  }
  
  private func setupView() {
    backgroundColor = .systemBackground
    
    stackView.addArrangedSubview(profileImageView)
    stackView.addArrangedSubview(nameLabel)
    stackView.addArrangedSubview(nicknameLabel)
    stackView.addArrangedSubview(followersLabel)
    stackView.addArrangedSubview(followButton)
    stackView.addArrangedSubview(unfollowButton)
    
    addSubview(stackView)
    
    NSLayoutConstraint.activate([
      profileImageView.widthAnchor.constraint(equalToConstant: Constants.width),
      profileImageView.heightAnchor.constraint(equalToConstant: Constants.height),
      
      followButton.widthAnchor.constraint(equalToConstant: 200),
      unfollowButton.widthAnchor.constraint(equalToConstant: 200),
      
      stackView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
      stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
      stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
      stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16)
    ])
  }
  
  func configureUI(contactDetail: Contact) {
    
  }
}

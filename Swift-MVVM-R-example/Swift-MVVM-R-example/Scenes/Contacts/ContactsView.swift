import UIKit

// MARK: - ContactsView

final class ContactsView: UIView {
  
  // MARK: - Private Variables
  
  private let titleLabel: UILabel = {
    let label = UILabel()
    label.text = "Bem-vindo!"
    label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
    label.textAlignment = .center
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  // MARK: - Init
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupView()
  }
  
  /// Necessário para suporte a Storyboard/XIB.
  required init?(coder: NSCoder) {
    super.init(coder: coder)
    setupView()
  }
  
  private func setupView() {
    backgroundColor = .white
    addSubview(titleLabel)
    
    NSLayoutConstraint.activate([
      titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
      titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
    ])
  }
}

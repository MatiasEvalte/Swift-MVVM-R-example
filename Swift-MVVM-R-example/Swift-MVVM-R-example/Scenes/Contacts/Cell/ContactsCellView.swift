import UIKit

class ContactsCellView: UITableViewCell {
  
  static let identifier = "ContactsCellView"
  
  private let titleLabel: UILabel = {
    let label = UILabel()
    label.font = UIFont.boldSystemFont(ofSize: 16)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  private let disclosureImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.image = UIImage(systemName: "chevron.right")
    imageView.tintColor = .gray
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()
  
  private let anchorView: UIView = {
    let view = UIView()
    view.backgroundColor = .systemGray6
    view.layer.cornerRadius = 8
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  // MARK: - Initializers
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    setupViews()
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
    setupViews()
  }
  
  private func setupViews() {
    selectionStyle = .none
    
    contentView.addSubview(anchorView)
    
    anchorView.addSubview(titleLabel)
    anchorView.addSubview(disclosureImageView)
    
    NSLayoutConstraint.activate([
      anchorView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
      anchorView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
      anchorView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
      anchorView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
      
      titleLabel.topAnchor.constraint(equalTo: anchorView.topAnchor, constant: 16),
      titleLabel.leadingAnchor.constraint(equalTo: anchorView.leadingAnchor, constant: 16),
      titleLabel.trailingAnchor.constraint(equalTo: disclosureImageView.leadingAnchor, constant: -16),
      titleLabel.bottomAnchor.constraint(equalTo: anchorView.bottomAnchor, constant: -16),
      
      disclosureImageView.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
      disclosureImageView.trailingAnchor.constraint(equalTo: anchorView.trailingAnchor, constant: -16),
      disclosureImageView.widthAnchor.constraint(equalToConstant: 8),
      disclosureImageView.heightAnchor.constraint(equalToConstant: 13)
    ])
  }
}

// MARK: - Internal methods

extension ContactsCellView {
  func configure(model: Contact) {
    titleLabel.text = model.name
  }
}

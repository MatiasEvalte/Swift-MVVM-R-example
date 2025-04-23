import UIKit

// MARK: - ContactsView

final class ContactsView: UIView {
  
  // MARK: - Internal Variables
  
  let activityIndicator: UIActivityIndicatorView = {
    let activity = UIActivityIndicatorView(style: .large)
    activity.translatesAutoresizingMaskIntoConstraints = false
    activity.isHidden = true
    return activity
  }()
  
  let titleLabel: UILabel = {
    let label = UILabel()
    label.text = "Sem contatos adicionados"
    label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
    label.textAlignment = .center
    label.translatesAutoresizingMaskIntoConstraints = false
    label.isHidden = true
    return label
  }()
  
  let tableView: UITableView = {
    let tableView = UITableView(frame: CGRect.zero,
                                style: UITableView.Style.grouped)
    tableView.backgroundColor = UIColor.white
    tableView.separatorInset = UIEdgeInsets.zero
    tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    tableView.showsVerticalScrollIndicator = false
    tableView.layoutMargins = UIEdgeInsets.zero
    tableView.translatesAutoresizingMaskIntoConstraints = false
    return tableView
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
    addSubview(tableView)
    addSubview(titleLabel)
    addSubview(activityIndicator)
    
    NSLayoutConstraint.activate([
      tableView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
      tableView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
      tableView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
      tableView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
      
      titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
      titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
      
      activityIndicator.centerXAnchor.constraint(equalTo: centerXAnchor),
      activityIndicator.centerYAnchor.constraint(equalTo: centerYAnchor)
    ])
  }
}

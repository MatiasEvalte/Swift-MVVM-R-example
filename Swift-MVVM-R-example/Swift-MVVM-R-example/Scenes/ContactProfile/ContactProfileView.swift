import UIKit

// MARK: - ContactProfileView

final class ContactProfileView: UIView {
  
  // MARK: - Internal Variables
  
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
    backgroundColor = .white
    
    NSLayoutConstraint.activate([
      
    ])
  }
}

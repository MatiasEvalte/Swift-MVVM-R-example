import Foundation

// MARK: - Loadable

public enum Loadable<T> {
  case notRequested
  case isLoading(last: T?)
  case loaded(T)
  case failed(Error)
  
  public var value: T? {
    switch self {
    case .loaded(let value): return value
    case .isLoading(let last): return last
    default: return nil
    }
  }
  
  public var error: Error? {
    if case .failed(let error) = self {
      return error
    }
    return nil
  }
  
  public var isLoading: Bool {
    if case .isLoading = self { return true }
    return false
  }
  
  public var hasFailed: Bool {
    if case .failed = self { return true }
    return false
  }
  
  public var isLoaded: Bool {
    if case .loaded = self { return true }
    return false
  }
}

// MARK: - Manipulação de estado

public extension Loadable {
  mutating func setIsLoading() {
    self = .isLoading(last: self.value)
  }
  
  mutating func cancelLoading() {
    guard case .isLoading(let last) = self else { return }
    
    if let last = last {
      self = .loaded(last)
    } else {
      self = .failed(LoadableError.cancelled)
    }
  }
}

// MARK: - Equatable (para T: Equatable)

extension Loadable: Equatable where T: Equatable {
  public static func == (lhs: Loadable<T>, rhs: Loadable<T>) -> Bool {
    switch (lhs, rhs) {
    case (.notRequested, .notRequested): return true
    case (.isLoading(let lhsV), .isLoading(let rhsV)): return lhsV == rhsV
    case (.loaded(let lhsV), .loaded(let rhsV)): return lhsV == rhsV
    case (.failed(let lhsE), .failed(let rhsE)):
      return lhsE.localizedDescription == rhsE.localizedDescription
    default: return false
    }
  }
}

// MARK: - Erros

public enum LoadableError: LocalizedError {
  case cancelled
  
  public var errorDescription: String? {
    switch self {
    case .cancelled:
      return NSLocalizedString("Cancelado pelo usuário", comment: "")
    }
  }
}

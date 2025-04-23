import Foundation

public final class Bindable<Value> {
  private struct Observation {
    weak var object: AnyObject?
    let handler: (Value) -> Void
    
    func notify(with value: Value) -> Bool {
      guard let _ = object else { return false }
      handler(value)
      return true
    }
  }
  
  private var observations: [Observation] = []
  public private(set) var lastValue: Value?
  
  public init(_ value: Value? = nil) {
    lastValue = value
  }
  
  public func update(with value: Value) {
    lastValue = value
    observations = observations.filter { $0.notify(with: value) }
  }
  
  public func addObservation<O: AnyObject>(for object: O,
                                           handler: @escaping (O, Value) -> Void) {
    if let value = lastValue {
      executeOnMain {
        [weak object] in
        guard let object = object else { return }
        handler(object, value)
      }
    }
    
    let wrapped: (Value) -> Void = { [weak object] value in
      guard let object = object else { return }
      self.executeOnMain {
        handler(object, value)
      }
    }
    
    let observation = Observation(object: object, handler: wrapped)
    observations.append(observation)
  }
  
  public func clearObservations() {
    observations.removeAll()
  }
  
  // MARK: - Binds
  
  public func bind<O: AnyObject>(to objectKeyPath: ReferenceWritableKeyPath<O, Value>,
                                 on object: O) {
    addObservation(for: object) { object, value in
      object[keyPath: objectKeyPath] = value
    }
  }
  
  public func bind<O: AnyObject, T>(_ sourceKeyPath: KeyPath<Value, T>,
                                    to object: O,
                                    _ objectKeyPath: ReferenceWritableKeyPath<O, T>) {
    addObservation(for: object) { object, observed in
      object[keyPath: objectKeyPath] = observed[keyPath: sourceKeyPath]
    }
  }
  
  public func bind<O: AnyObject, T>(_ sourceKeyPath: KeyPath<Value, T>,
                                    to object: O,
                                    _ objectKeyPath: ReferenceWritableKeyPath<O, T?>) {
    addObservation(for: object) { object, observed in
      object[keyPath: objectKeyPath] = observed[keyPath: sourceKeyPath]
    }
  }
  
  public func bind<O: AnyObject, T, R>(_ sourceKeyPath: KeyPath<Value, T>,
                                       to object: O,
                                       _ objectKeyPath: ReferenceWritableKeyPath<O, R?>,
                                       transform: @escaping (T) -> R?) {
    addObservation(for: object) { object, observed in
      let transformed = transform(observed[keyPath: sourceKeyPath])
      object[keyPath: objectKeyPath] = transformed
    }
  }
  
  // MARK: - Utilitário
  
  private func executeOnMain(_ block: @escaping () -> Void) {
    if Thread.isMainThread {
      block()
    } else {
      DispatchQueue.main.async(execute: block)
    }
  }
}

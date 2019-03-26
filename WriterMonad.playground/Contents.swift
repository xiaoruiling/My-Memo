import UIKit

infix operator <>: AdditionPrecedence

protocol Semigroup {
  static func <> (lhs: Self, rhs: Self) -> Self
}

protocol Monoid: Semigroup {
  static var empty: Self { get }
}

extension String: Monoid {
  static func <> (lhs: String, rhs: String) -> String {
    return lhs + rhs
  }
  static var empty: String { return "" }
}


// MARK: - Writer
struct Writer<T, W: Monoid> {
  let value: T
  let record: W

  static func `return`(_ value: T) -> Writer {
    return Writer(value: value, record: W.empty)
  }

  func bind<O>(_ tran: (T) -> Writer<O, W>) -> Writer<O, W> {
    let newOne = tran(value)
    return Writer<O, W>(value: newOne.value, record: record <> newOne.record)
  }

  func map<O>(_ tran: (T) -> O) -> Writer<O, W> {
    return bind { Writer<O, W>.return(tran($0)) }
  }
}

// Use it
typealias LogWriter<T> = Writer<T, String>
typealias Operation<T> = (T) -> LogWriter<T>

func add(_ num: Int) -> Operation<Int> {
  return { Writer(value: $0 + num, record: "\($0)加\(num), ") }
}
func subtract(_ num: Int) -> Operation<Int> {
  return { Writer(value: $0 - num, record: "\($0)减\(num), ") }
}
func multiply(_ num: Int) -> Operation<Int> {
  return { Writer(value: $0 * num, record: "\($0)乘\(num), ") }
}
func divide(_ num: Int) -> Operation<Int> {
  return { Writer(value: $0 / num, record: "\($0)除\(num), ") }
}

func test() {

  let original = LogWriter.return(2)
  print(original)

  let result = original.bind(multiply(3)).bind(add(2)).bind(divide(4)).bind(subtract(1))
  // 1
  print(result.value)
  // 2乘3, 6加2, 8除4, 2减1,
  print(result.record)
}

test()


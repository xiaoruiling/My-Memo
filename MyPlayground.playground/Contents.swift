import UIKit

var str = "Hello, playground"
debugPrint(str)

// Semigroup 半群  a + b = b + a
infix operator <>: AdditionPrecedence

protocol Semigroup {
  static func <> (lhs: Self, rhs: Self) -> Self
}

extension Int: Semigroup {
  static func <> (lhs: Int, rhs: Int) -> Int {
    return lhs + rhs
  }
}

extension String: Semigroup {
  static func <> (lhs: String, rhs: String) -> String {
    return lhs + rhs
  }
}

extension Array: Semigroup {
  static func <> (lhs: [Element], rhs: [Element]) -> [Element] {
    return lhs + rhs
  }
}

func testSemigroup() {

  let a = 2
  let b = 5
  let result1 = a <> b
  let result2 = b <> a
  debugPrint("-------------: a = \(result1), b = \(result2)")

  let hello = "Hello "
  let world = "world"
  let helloWorld = hello <> world
  debugPrint("-------------: \(helloWorld)")

  let one = [1,2,3]
  let two = [4,5,6,7]
  let three = one <> two
  debugPrint("-------------: \(three)")
}

testSemigroup()

// Monoid

protocol Monoid: Semigroup {
  static var empty: Self { get }
}

extension String: Monoid {
  static var empty: String { return "" }
}

extension Array: Monoid {
  static var empty: [Element] { return [] }
}

extension Sequence where Element: Monoid {
  func concat() -> Element {
    return reduce(Element.empty, <>)
  }
}

func testMonoid() {
  let str = "Hello world" <> String.empty <> " xiao rui ling"
  let arr = [1,2,3] <> [Int].empty

  let concatStr = ["hello world", " xiaorui" , " ❤️"].concat()

  debugPrint("++++++++++++++: \(str)")
  debugPrint("++++++++++++++: \(arr)")
  debugPrint("++++++++++++++: \(concatStr)")

}

testMonoid()


struct Point {
  var x = 0
  var y = 0

  /// 标记 能够改变变量的值
  mutating func add() {
    x += 10
    y += 10
  }
}

var point = Point(x: 1, y: 2)
point.add()
debugPrint(point)

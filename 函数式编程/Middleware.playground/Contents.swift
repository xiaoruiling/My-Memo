import UIKit

infix operator <>: AdditionPrecedence

protocol Semigroup {
  static func <> (lhs: Self, rhs: Self) -> Self
}

protocol Monoid: Semigroup {
  static var empty: Self { get }
}

extension Monoid {
  func when(_ flag: Bool) -> Self {
    return flag ? self : Self.empty
  }
}

struct Middleware<T> {
  private let _todo: (T) -> ()
  init(_ todo: @escaping (T) -> ()) {
    _todo = todo
  }
  func doIt(_ value: T) {
    _todo(value)
  }
}

extension Middleware: Monoid {
  static func <> (lhs: Middleware, rhs: Middleware) -> Middleware {
    return .init {
      lhs.doIt($0)
      rhs.doIt($0)
    }
  }

  // Do nothing
  static var empty: Middleware { return .init { _ in } }
}

typealias ParserItem = Middleware<NSMutableAttributedString>

func font(size: CGFloat) -> ParserItem {
  return ParserItem { str in
    str.addAttributes([.font: UIFont.systemFont(ofSize: size)], range: .init(location: 0, length: str.length))
  }
}

func backgroundColor(_ color: UIColor) -> ParserItem {
  return ParserItem { str in
    str.addAttributes([.backgroundColor: color], range: .init(location: 0, length: str.length))
  }
}

func foregroundColor(_ color: UIColor) -> ParserItem {
  return ParserItem { str in
    str.addAttributes([.foregroundColor: color], range: .init(location: 0, length: str.length))
  }
}

func title() -> ParserItem {
  return font(size: 20) <> foregroundColor(.green)
}

func standard(withHighlighted: Bool = false) -> ParserItem {
  return font(size: 16) <> foregroundColor(.green) <> backgroundColor(.yellow).when(withHighlighted)
}

extension NSAttributedString {
  func parse(with item: ParserItem) -> NSAttributedString {
    let mutableStr = mutableCopy() as! NSMutableAttributedString
    item.doIt(mutableStr)
    return mutableStr.copy() as! NSAttributedString
  }
}

func parse() {
  let titleStr = NSAttributedString(string: "Monoid").parse(with: title())

  let text = NSAttributedString(string: "I love Monoid!").parse(with: standard(withHighlighted: false))

//  let label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 100))
//  label.attributedText = text

}

parse()


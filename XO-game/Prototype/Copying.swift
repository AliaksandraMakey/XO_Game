

import Foundation

protocol Copying {
    init(_ prototype: Self)
}
extension Copying {
    func copy() -> Self {
        return type(of: self).init(self)
    }
}

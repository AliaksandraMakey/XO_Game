

import Foundation

// add third gamer
public enum Player: CaseIterable {
    case firstUser, secondUser
    
    var markViewPrototype: MarkView {
        switch self {
        case .firstUser:
            return XView()
        case .secondUser:
            return OView()
        }
    }
    var next: Player {
        switch self {
        case .firstUser:
            return .secondUser
        case .secondUser:
            return .firstUser
        }
    }
}

import SwiftUI

extension View {
    func isHidden(_ hide: Bool) -> some View {
        opacity(hide ? 0 : 1)
    }
}


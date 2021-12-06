import SwiftUI

@main
struct ETUDocumentOrderingApp: App {
    
    var body: some Scene {
        WindowGroup {
            ETUDocumentOrderingMenu()
                .preferredColorScheme(.light)
        }
    }
}

import SwiftUI

@main
struct ETUDocumentOrderingApp: App {
    @ObservedObject var viewModel: ETUDocumentOrderinngViewModel = ETUDocumentOrderinngViewModel()
    
    var body: some Scene {
        WindowGroup {
            ETUDocumentOrderingMenu()
                .preferredColorScheme(.light)
                .environmentObject(viewModel)
        }
    }
}

import SwiftUI

struct ETUNavigationLink<Label: View, Destination: View>: View {
    private let destination: Destination
    private let label: Label
    private let title: String
    
    init(title: String, destination: Destination, @ViewBuilder label: () -> Label) {
        self.title = title
        self.destination = destination
        self.label = label()
    }
    
    var body: some View {
        NavigationLink(
            destination: ETUNavigationViewContainer(title: title) {
                destination
            }
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true),
            label: {
                self.label
            })
    }
}

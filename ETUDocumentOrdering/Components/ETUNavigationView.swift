import SwiftUI


struct ETUNavigationView<Content: View>: View {
    let content: Content
    let title: String
    
    init(title: String, @ViewBuilder content: () -> Content) {
        self.title = title
        self.content = content()
    }
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                ETUNavigationViewContainer(title: title) {
                    content
                }
            }
            .navigationBarHidden(true)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}


struct ETUNavigationViewContainer<Content: View> : View {
    private let content: Content
    private let title: String
    
    init(title: String, @ViewBuilder content: () -> Content) {
        self.title = title
        self.content = content()
    }
    
    var body: some View {
        ZStack {
            Color.white
                .ignoresSafeArea()
            VStack(spacing: 0) {
                ETUNavigationBarView(title: title)
                content
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
            .ignoresSafeArea(.keyboard)
        }
        .onTapGesture {
            UIApplication.shared.endEditing()
        }
    }
}

struct ETUNavigationBarView: View {
    @Environment(\.presentationMode) private var presentationMode
    private let title: String
    
    init(title: String) {
        self.title = title
    }
    
    var body: some View {
        ZStack {
            HStack {
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    //
                }
                .buttonStyle(ETUNavigationViewBackButtonStyle())
                .padding(.leading, 10)
                .padding()
                Spacer()
            }
            .overlay(Text(title)
                        .font(.custom(FontsManager.Raleway.medium, size: 18))
                        .foregroundColor(Color.etuColors.lightGray))
            .background(Color.white.shadow(color: Color.etuColors.lightGray.opacity(0.5), radius: 0, x: 0, y: 1))
        }
        .zIndex(1.0)
    }
}


struct ETUNavigationViewBackButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        Image(configuration.isPressed ? "backButtonOnTap" : "backButton")
    }
}

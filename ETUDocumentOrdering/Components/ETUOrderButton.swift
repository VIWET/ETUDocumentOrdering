import SwiftUI


struct ETUOrderButton: ButtonStyle {
    var isDisabled: Bool
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.custom(FontsManager.OpenSansCondensed.bold, size: 12))
            .foregroundColor(Color.white)
            .background(RoundedRectangle(cornerRadius: 5)
            .fill(isDisabled ? Color.etuColors.gray : (configuration.isPressed ? Color.etuColors.darkBlue : Color.etuColors.blue))
            .frame(width: 120, height: 25, alignment: .center))

    }
}

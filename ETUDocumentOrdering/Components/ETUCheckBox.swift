import SwiftUI

struct ETUCheckBox: ButtonStyle {
    @Binding var isChecked: Bool
    
    func makeBody(configuration: Configuration) -> some View {
        RoundedRectangle(cornerRadius: 5)
            .fill(isChecked ? Color.etuColors.blue : Color.white)
            .frame(width: 15, height: 15)
            .overlay(
                ZStack {
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(Color.etuColors.veryLightGray)
                    if isChecked {
                        Image(systemName: "checkmark")
                            .foregroundColor(Color.etuColors.veryLightGray)
                            .font(.custom(FontsManager.OpenSansCondensed.bold, size: 10))
                    }
                }
            )
    }
}

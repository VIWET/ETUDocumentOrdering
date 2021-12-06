import SwiftUI

struct ETUTextEditor: View {
    var title: String
    @Binding var value: String
    @State var isEditing: Bool = false
    
    var body: some View {
        VStack {
            HStack {
                Text(title)
                    .font(.custom(FontsManager.OpenSansCondensed.bold, size: 14))
                    .foregroundColor(Color.etuColors.blue.opacity(0.6))
                    .multilineTextAlignment(.leading)
                Spacer()
            }
            .padding(0)
            TextEditor(text: $value)
                .font(.custom(FontsManager.OpenSansCondensed.light, size: 14))
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 60)
                .colorMultiply(!value.isEmpty ? Color.etuColors.selectedValue : Color.white)
                .overlay(
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(Color.etuColors.veryLightGray)
                )
                .cornerRadius(5)
                .shadow(color: Color.etuColors.textFieldShadow, radius: isEditing ? 10 : 0, x: 0, y: 0)
        }
    }
}

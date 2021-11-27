import SwiftUI

struct ETUTextField: View {
    let title: String
    let isDisabled: Bool
    let validator: ((String) -> Bool)?
    @Binding var value: String
    @State var isEditing: Bool = false
    
    init(title: String,
         isDisabled: Bool,
         value: Binding<String>,
         validator: ((String) -> Bool)? = nil) {
        self.title = title
        self.isDisabled = isDisabled
        self._value = value
        self.validator = validator
    }
    
    
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
            TextField("", text: $value,
                      onEditingChanged: { isEditing in
                            self.isEditing = isEditing
            })
                .disabled(isDisabled)
                .textFieldStyle(ETUTextFieldStyle())
                .background(
                    RoundedRectangle(cornerRadius: 5)
                        .fill(!value.isEmpty ? Color.etuColors.selectedValue : Color.white)
                )
                .shadow(color: Color.etuColors.textFieldShadow, radius: isEditing ? 10 : 0, x: 0, y: 0)
        }
    }
}

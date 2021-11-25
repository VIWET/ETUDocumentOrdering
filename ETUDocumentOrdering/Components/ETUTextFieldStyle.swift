import SwiftUI

struct ETUTextFieldStyle: TextFieldStyle {
    @State var isFilled: Bool  = false
    
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding(10)
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 30, maxHeight: 30)
            .font(.custom(FontsManager.OpenSansCondensed.light, size: 12))
            .foregroundColor(Color.black)
            .overlay(
                RoundedRectangle(cornerRadius: 5)
                    .stroke(Color.etuColors.veryLightGray)
            )
    }
}

struct ETUTextFieldStyle_Previews: PreviewProvider {
    static var previews: some View {
        ETUDocumentOrderingConfirm()
    }
}

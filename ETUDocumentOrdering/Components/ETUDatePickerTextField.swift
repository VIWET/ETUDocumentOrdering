import SwiftUI

struct ETUDatePickerTextField: View {
    let title: String
    let isSpacer: Bool
    @Binding var isEditing: Bool
    @Binding var date: Date?
    
    init(title: String, isSpacer: Bool = true, isEditing: Binding<Bool>, date: Binding<Date?>) {
        self.title = title
        self.isSpacer = isSpacer
        self._isEditing = isEditing
        self._date = date
    }
    
    
    var body: some View {
        VStack {
            HStack {
                Text(title)
                    .font(.custom(FontsManager.OpenSansCondensed.bold, size: 14))
                    .foregroundColor(Color.etuColors.blue.opacity(0.6))
                    .multilineTextAlignment(.leading)
                    .padding(.trailing, isSpacer ? 0 : -10)
            }
            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            .padding(0)
            Group {
                if date != nil {
                    Text(date!, style: .date)
                        .padding(10)
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 30, maxHeight: 30, alignment: .leading)
                        .font(.custom(FontsManager.OpenSansCondensed.light, size: 12))
                        .foregroundColor(Color.black)
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(Color.etuColors.veryLightGray)
                        )
                    .background(
                        RoundedRectangle(cornerRadius: 5)
                            .fill(date != nil ? Color.etuColors.selectedValue : Color.white)
                    )
                    .onTapGesture {
                        isEditing = true
                    }
                    .shadow(color: Color.etuColors.textFieldShadow, radius: isEditing ? 10 : 0, x: 0, y: 0)
                } else {
                    Text("")
                        .padding(10)
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 30, maxHeight: 30, alignment: .leading)
                        .font(.custom(FontsManager.OpenSansCondensed.light, size: 12))
                        .foregroundColor(Color.black)
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(Color.etuColors.veryLightGray)
                        )
                    .background(
                        RoundedRectangle(cornerRadius: 5)
                            .fill(date != nil ? Color.etuColors.selectedValue : Color.white)
                    )
                    .onTapGesture {
                        isEditing = true
                    }
                    .shadow(color: Color.etuColors.textFieldShadow, radius: isEditing ? 10 : 0, x: 0, y: 0)
                }
            }
            
        }
    }
}


struct ETUDatePicker: View {
    let title: String
    var validationDate: Date?
    @Binding var isEditing: Bool
    @Binding var dateSelector: Date?
    @State var temp: Date?
    let warning: String
    let range: (Date?) -> ClosedRange<Date>
    let validator: (Date?, Date?) -> Bool
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.4).ignoresSafeArea()
                .onTapGesture {
                    dateSelector = temp
                    isEditing = false
                }
            VStack {
                Text(title)
                    .padding(.top)
                    .font(.custom(FontsManager.OpenSansCondensed.bold, size: 16))
                    .foregroundColor(Color.etuColors.blue)
                DatePicker(title,
                           selection: Binding<Date>(get: { dateSelector ?? Date() },
                                                    set: { dateSelector = $0 }),
                           in: range(validationDate),
                           displayedComponents: [.date])
                    .padding(5)
                    .datePickerStyle(.graphical)
                    .accentColor(Color.etuColors.blue)
                HStack {
                    if !validator(dateSelector, validationDate) {
                        Text(warning)
                            .foregroundColor(Color.etuColors.warning)
                            .font(.custom(FontsManager.OpenSansCondensed.bold, size: 16))
                    }
                }
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 20, maxHeight: 20)
                .padding(.bottom, 10)
                Button {
                    if validator(dateSelector, validationDate) {
                        isEditing = false
                        temp = dateSelector
                    }
                } label: {
                    Text("Подтвердить")
                }
                .disabled(!validator(dateSelector, validationDate))
                .buttonStyle(ETUOrderButton(isDisabled: !validator(dateSelector, validationDate)))
                .padding(.bottom)               
            }
            .background(Color.white)
            .cornerRadius(10)
            .padding()

        }
        .isHidden(!isEditing)
    }
}

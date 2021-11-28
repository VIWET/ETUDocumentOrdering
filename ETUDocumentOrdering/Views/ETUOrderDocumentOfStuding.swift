import SwiftUI

struct ETUOrderDocumentOfStuding: View {
    
    @StateObject var viewModel: ETUDocumentOfStudingViewModel
    
    init(document: DocumentOfStuding) {
        _viewModel = StateObject(wrappedValue: ETUDocumentOfStudingViewModel(document: document))
    }

    var body: some View {
        VStack(spacing: 15) {
            VStack(spacing: 10) {
                ETUTextField(title: "ФИО",
                             isDisabled: true,
                             value: $viewModel.document.student.fio)
                ETUTextField(title: "Номер студ. билета",
                             isDisabled: true,
                             value: $viewModel.document.student.educations[viewModel.document.selectedEducation].studentCardNumber)
                HStack(spacing: 30) {
                    ETUTextField(title: "Тип справки",
                                 isDisabled: true,
                                 value: $viewModel.document.type)
                    ETUTextField(title: "Количество",
                                 isDisabled: false,
                                 value: $viewModel.document.count) { text in
                                                    return !text.isEmpty && Int(text) != nil
                                                }
                                 .keyboardType(.numberPad)
                }
                ETUTextField(title: "Подтип справки",
                             isDisabled: true,
                             value: Binding(get: { viewModel.document.selectedSubtype!.title },
                                            set: { viewModel.document.selectedSubtype!.title = $0 }))
                ETUTextEditor(title: "Комментарий", value: $viewModel.document.comment)
            }
            .padding(.horizontal, 25)
            Divider()
                .padding(.horizontal, 10)
            HStack(spacing: 15) {
                Button {
                    viewModel.document.heraldicStamp.toggle()
                } label: {}
                .buttonStyle(ETUCheckBox(isChecked: $viewModel.document.heraldicStamp))
                Text("Нужна гербовая печать (справка делается дольше)")
                    .foregroundColor(Color.etuColors.lightBlue)
                    .font(.custom(FontsManager.OpenSansCondensed.light, size: 14))
                Spacer()

            }
            .padding(.horizontal, 25)
            .padding(.bottom, 25)
            Button {
//                    Сделать!!! POST DATA
            } label: {
                Text("Заказать")
            }
            .disabled(!viewModel.canBeConfirmed())
            .buttonStyle(ETUOrderButton(isDisabled: !viewModel.canBeConfirmed()))
            
            if viewModel.raiseValidateError() {
                Text("Количество должно быть выражено числом")
                    .font(.custom(FontsManager.OpenSansCondensed.light, size: 10))
                    .foregroundColor(Color.etuColors.warning)
            }
            Spacer()
            Text("В случае возникновения вопросов по справкам просьба писать личное сообщение в Личном Кабинете ответственному лицу: Олишаускайте М. А.")
                .foregroundColor(Color.etuColors.lightBlue)
                .font(.custom(FontsManager.OpenSansCondensed.light, size: 14))
                .padding(.leading, 25)
                .padding(.trailing, 50)
        }
        .padding(.top, 10)
    }
}


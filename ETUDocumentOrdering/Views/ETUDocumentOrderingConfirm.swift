import SwiftUI

struct ETUDocumentOrderingConfirm: View {
    @EnvironmentObject var viewModel: ETUDocumentOrderinngViewModel
    @State var count: String = ""
    
    var body: some View {
//        VStack {
//            Text(viewModel.document.student.getFullName())
//            Text(viewModel.document.education)
//            Text(viewModel.document.documentType!)
//            Text(viewModel.document.documentSubtype!)
//        }
        Group {
            VStack(spacing: 15) {
                VStack(spacing: 10) {
                    ETUTextField(title: "ФИО",
                                 isDisabled: true,
                                 text: $viewModel.student.fio)
                    HStack(spacing: 30){
                        VStack(spacing: 10) {
                            ETUTextField(title: "Номер студ. билета",
                                         isDisabled: true,
                                         text: $viewModel.student.educations[(viewModel.document?.selectedEducation)!].studentCardNumber)
                            ETUTextField(title: "Тип справки", isDisabled: true, text: $count)
                        }
                        VStack(spacing: 10) {
                            ETUTextField(title: "Количество", isDisabled: false, text: $count)
                            ETUTextField(title: "Подтип справки", isDisabled: true, text: $count)
                        }
                    }
                }
                .padding(.horizontal, 25)
                Divider()
                    .padding(.horizontal, 10)
                Text("Пожалуйста, укажите период времени, за который Вы хотите получить справку")
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color.etuColors.blue)
                    .font(.custom(FontsManager.OpenSansCondensed.bold, size: 14))
                    .padding(.horizontal, 65)
                HStack(spacing: 30) {
                    ETUTextField(title: "Дата начала периода", isDisabled: false, text: $count)
                    ETUTextField(title: "Дата окончания периода", isDisabled: false, text: $count)
                }
                .padding(.vertical, 10)
                .padding(.horizontal, 25)
                Button {
                    //
                } label: {
                    Text("Заказать")
                }
                .buttonStyle(ETUOrderButton(isDisabled: false))
                Spacer()
                Text("В случае возникновения вопросов по справкам просьба писать личное сообщение в Личном Кабинете ответственному лицу: Зимина А. В.")
                    .foregroundColor(Color.etuColors.lightBlue)
                    .font(.custom(FontsManager.OpenSansCondensed.light, size: 14))
                    .padding(.leading, 25)
                    .padding(.trailing, 50)
            }
        }
    }
}

struct ETUDocumentOrderingConfirm_Previews: PreviewProvider {
    static var previews: some View {
        ETUDocumentOrderingConfirm()
    }
}


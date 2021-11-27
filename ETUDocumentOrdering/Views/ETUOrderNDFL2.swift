import SwiftUI

struct ETUOrderNDFL2: View {
    @StateObject var viewModel: ETUDocument2NDFLViewModel
    
    @State var startDateEdit: Bool = false
    @State var endDateEdit: Bool = false
    @State var bining: String = ""
    
    init(document: Document2NDFL) {
        _viewModel = StateObject(wrappedValue: ETUDocument2NDFLViewModel(document: document))
    }
    
    var body: some View {
        ZStack {
            ETUDatePicker(title: "Дата начала периода",
                          validationDate: viewModel.document.endDate,
                          isEditing: $startDateEdit,
                          dateSelector: $viewModel.document.startDate,
                          warning: "Дата начала периода больше даты окончания",
                          range: { date in
                                if let date = date {
                                    return Date.distantPast...date
                                }
                                return Date.distantPast...Date()
                          }) { date, validationDate in
                                if let validationDate = validationDate {
                                    if let date = date {
                                        if date > validationDate {
                                            return false
                                        }
                                    }
                                }
                                return true
                          }
                .zIndex(10)
            ETUDatePicker(title: "Дата окончания периода",
                          validationDate: viewModel.document.startDate,
                          isEditing: $endDateEdit,
                          dateSelector: $viewModel.document.endDate,
                          warning: "Дата окончания периода меньше даты начала",
                          range: { date in
                                if let date = date {
                                    return date...Date()
                                }
                                return Date.distantPast...Date()
                          }) { date, validationDate in
                                if let validationDate = validationDate {
                                    if let date = date {
                                        if date < validationDate {
                                            return false
                                        }
                                    }
                                }
                                return true
                          }
                .zIndex(10)
            VStack(spacing: 15) {
                VStack(spacing: 10) {
                    ETUTextField(title: "ФИО",
                                 isDisabled: true,
                                 value: $viewModel.document.student.fio)
                    HStack(spacing: 30){
                        VStack(spacing: 10) {
                            ETUTextField(title: "Номер студ. билета",
                                         isDisabled: true,
                                         value: $viewModel.document.student.educations[viewModel.document.selectedEducation].studentCardNumber)
                            ETUTextField(title: "Тип справки",
                                         isDisabled: true,
                                         value: $viewModel.document.type)
                        }
                        VStack(spacing: 10) {
                            ETUTextField(title: "Количество",
                                         isDisabled: false,
                                         value: $viewModel.document.count) { text in
                                                            return !text.isEmpty && Int(text) != nil
                                                        }
                            ETUTextField(title: "Подтип справки",
                                         isDisabled: true,
                                         value: Binding(get: { viewModel.document.selectedSubtype!.title },
                                                        set: { viewModel.document.selectedSubtype!.title = $0 }))
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
                    ETUDatePickerTextField(title: "Дата начала периода",
                                           isEditing: $startDateEdit,
                                           date: $viewModel.document.startDate)
                    ETUDatePickerTextField(title: "Дата окончания периода",
                                           isEditing: $endDateEdit,
                                           date: $viewModel.document.endDate)
                }
                .padding(.vertical, 10)
                .padding(.horizontal, 25)

                Button {
//                    Сделать!!!
                    print(viewModel.document.count, viewModel.document.startDate, viewModel.document.endDate)
                } label: {
                    Text("Заказать")
                }
                .disabled(!viewModel.canBeConfirmed())
                .buttonStyle(ETUOrderButton(isDisabled: !viewModel.canBeConfirmed()))
                Spacer()
                Text("В случае возникновения вопросов по справкам просьба писать личное сообщение в Личном Кабинете ответственному лицу: Зимина А. В.")
                    .foregroundColor(Color.etuColors.lightBlue)
                    .font(.custom(FontsManager.OpenSansCondensed.light, size: 14))
                    .padding(.leading, 25)
                    .padding(.trailing, 50)
            }
            .padding(.top, 10)
        }
    }
}

import SwiftUI

struct ETUDocumentOrdering: View {
    @StateObject var viewModel: ETUDocumentOrderinngViewModel
    
    init(student: Student?) {
        _viewModel = StateObject(wrappedValue: ETUDocumentOrderinngViewModel(student: student!))
    }
    
    var body: some View {
        VStack(spacing: 10) {
            ETUDropdown(title: "Обучение",
                        values: viewModel.getEducationList(),
                        setValue:  { i in
                            viewModel.setEducation(index: i)
                        },
                        selectedValue: viewModel.selectedEducation)
                .padding(.horizontal, 30)
                .padding(.top, 10)
            
            ETUDropdown(title: "Тип справки",
                        values: viewModel.getDocumentTypes(),
                        setValue:  { i in
                            viewModel.setDocumentType(index: i)
                        },
                        selectedValue: viewModel.document?.id)
                .padding(.horizontal, 30)
            
            ETUDropdown(title: "Подтип справки",
                        values: viewModel.getDocumentSubtypes(),
                        setValue:  { i in
                            viewModel.setDocumentSubtype(index: i)
                        },
                        selectedValue: viewModel.document?.selectedSubtype?.id)
                .padding(.horizontal, 30)
                .disabled(!(viewModel.document?.hasSubTypes ?? false))
            
            Text("Обратите внимание! Если вы хотите заказать\n справку по двум обучениям, вам нужно \n заказать две справки!")
                .multilineTextAlignment(.center)
                .font(.custom(FontsManager.OpenSansCondensed.bold, size: 14))
                .foregroundColor(Color.etuColors.blue)
                .padding(.horizontal, 40)
                .padding(.top, 20)
                .padding(.bottom, 30)
            ETUNavigationLink(title: "Заказ справок", destination: Self.destination(document: viewModel.document)) {Text("Заказать")}
            .buttonStyle(ETUOrderButton(isDisabled: !viewModel.canBeConfirmed()))
            .disabled(!viewModel.canBeConfirmed())
            Spacer()
            Text("Забрать готовые справки можно только в приемные часы работы (информацию о графике работы уточняйте на сайте).\n\nВопросы по заказу справок о стипендии и иных доходах можно задать Зиминой Анастасии Витальевне по телефону +7 (921) 365-80-25 или по электронной почте avzimina@etu.ru")
                .font(.custom(FontsManager.OpenSansCondensed.light, size: 14))
                .foregroundColor(Color.etuColors.lightBlue)
                .padding(.horizontal, 30)
        }

    }
    
    @ViewBuilder static func destination(document: BaseDocument?) -> some View {
        if let document = document {
            if let document = document as? Document2NDFL {
                ETUOrderNDFL2(document: document)
            }
            if let document = document as? DocumentOfStuding {
                ETUOrderDocumentOfStuding(document: document)
            }
            if let document = document as? DocumentOfIncomes {
                ETUOrderDocumentOfIncomes(document: document)
            }
        } else {
            EmptyView()
        }
    }
}

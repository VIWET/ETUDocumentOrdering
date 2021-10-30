import SwiftUI

struct ETUDocumentOrdering: View {
    @EnvironmentObject var viewModel: ETUDocumentOrderinngViewModel
    
    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                ETUDropdown(title: "Обучение",
                            values: viewModel.getEducationList(),
                            selectedValue: $viewModel.selectedEducation)
                    .padding(.horizontal, 30)
                    .padding(.top, 10)
                
                ETUDropdown(title: "Тип справки",
                            values: viewModel.getDocumentTypes(),
                            selectedValue: $viewModel.selectedType)
                    .padding(.horizontal, 30)
                
                ETUDropdown(title: "Подтип справки",
                            values: viewModel.getDocumentSubtypes(),
                            selectedValue: $viewModel.selectedSubtype)
                    .padding(.horizontal, 30)
                    .disabled(!viewModel.hasSubtypes())
                
                Text("Обратите внимание! Если вы хотите заказать\n справку по двум обучениям, вам нужно \n заказать две справки!")
                    .multilineTextAlignment(.center)
                    .font(.custom(FontsManager.OpenSansCondensed.bold, size: 14))
                    .foregroundColor(Color.etuColors.blue)
                    .padding(.horizontal, 40)
                    .padding(.top, 20)
                    .padding(.bottom, 30)
                
                ETUNavigationLink(title: "Заказ справок", destination: ETUDocumentOrderingConfirm()) {Text("Заказать")}
                .buttonStyle(ETUOrderButton(isDisabled: !viewModel.canBeConfirmed()))
                .disabled(!viewModel.canBeConfirmed())
                
                Text("Забрать готовые справки можно только в приемные часы работы (информацию о графике работы уточняйте на сайте).\n\nВопросы по заказу справок о стипендии и иных доходах можно задать Зиминой Анастасии Витальевне по телефону +7 (921) 365-80-25 или по электронной почте avzimina@etu.ru")
                    .font(.custom(FontsManager.OpenSansCondensed.light, size: 14))
                    .foregroundColor(Color.etuColors.lightBlue)
                    .padding(.horizontal, 30)
                    .padding(.top, 200)
            }
        }
    }
}


struct ETUDocumentOrdering_Previews: PreviewProvider {
    static var previews: some View {
        ETUDocumentOrdering()
    }
}

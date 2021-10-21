import SwiftUI

struct ETUDocumentOrdering: View {
    let educationList = ["дд.мм.гггг - дд.мм.гггг | ФКТИ: 10.05.01 - Компьютерная безопасность", "дд.мм.гггг - дд.мм.гггг | ФКТИ: 10.05.01 - Компьютерная безопасность"]
    let typeList = ["Справка об обучении", "Справка о доходах", "Справка 2-НДФЛ"]
    let subTypeList = ["На работу родиелям/на работу себе", "Социальный отдел/собес", "Налоговая инспекция", "Другое/по требованию", "Пенсионный фонд/военкомат для иностранных граждан"]
    @State private var education: Int? = 0
    @State private var docType: Int?
    @State private var docSubType: Int?
    @State private var orderButtonTap = false
    
    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                ETUDropdown(title: "Обучение", values: educationList, selectedValue: $education)
                    .padding(.horizontal, 30)
                    .padding(.top, 10)
                
                ETUDropdown(title: "Тип справки", values: typeList, selectedValue: $docType)
                    .padding(.horizontal, 30)
                
                let haveSubTypes = (docType ?? -1 == 0)
                
                ETUDropdown(title: "Подтип справки", values: haveSubTypes ? subTypeList : typeList, selectedValue: haveSubTypes ? $docSubType : $docType)
                    .padding(.horizontal, 30)
                    .disabled(!haveSubTypes)
                
                Text("Обратите внимание! Если вы хотите заказать\n справку по двум обучениям, вам нужно \n заказать две справки!")
                    .multilineTextAlignment(.center)
                    .font(.custom(FontsManager.OpenSansCondensed.bold, size: 14))
                    .foregroundColor(Color.etuColors.blue)
                    .padding(.horizontal, 40)
                    .padding(.top, 20)
                    .padding(.bottom, 30)
                RoundedRectangle(cornerRadius: 5)
                    .fill(Color.etuColors.blue)
                    .frame(width: 120, height: 25, alignment: .center)
                    
                
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

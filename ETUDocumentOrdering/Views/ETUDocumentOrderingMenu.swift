import SwiftUI

struct ETUDocumentOrderingMenu: View {
    var body: some View {
        ETUNavigationView(title: "Заказ справок") {
            ScrollView {
                ETUNavigationLink(
                    title: "Заказ справок",
                    destination: ETUDocumentOrdering()) {}
                .buttonStyle(ETUMenuButtonStyle(
                    iconName: "orderButton",
                    iconOnTapName: "orderButtonOnTap",
                    title: "Заказать справку",
                    subTitle: "Заказ необходимых документов по месту востребования")
                )
                
                ETUNavigationLink(
                    title: "История зказов",
                    destination: Text("Здесь будет история заказов...")){}
                .buttonStyle(ETUMenuButtonStyle(
                    iconName: "historyButton",
                    iconOnTapName: "historyButtonOnTap",
                    title: "История заказов",
                    subTitle: "Список всех заказанных Вами документов")
                )
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ETUDocumentOrderingMenu()
    }
}

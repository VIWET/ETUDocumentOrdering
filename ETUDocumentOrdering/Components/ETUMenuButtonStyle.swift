import SwiftUI


struct ETUMenuButtonStyle: ButtonStyle {
    let iconName: String
    let iconOnTapName: String
    let title: String
    let subTitle: String
    
    func makeBody(configuration: Configuration) -> some View {
        HStack(spacing: 25){
            Image(configuration.isPressed ? iconOnTapName : iconName)
                .resizable()
                .frame(width: 50, height: 50)
                .padding(.bottom, 40)
                .padding(.leading, 30)
                .padding(.top, 20)
            
            
            VStack(alignment: .leading, spacing: 10) {
                Text(title)
                    .font(.custom(FontsManager.Raleway.medium, size: 16))
                    .foregroundColor(configuration.isPressed ? Color.white : Color.etuColors.blue)
                
                Text(subTitle)
                    .multilineTextAlignment(.leading)
                    .font(.custom(FontsManager.Raleway.regular, size: 12))
                    .foregroundColor(configuration.isPressed ? .white : Color.etuColors.lightBlue)
            }
            
            
        }
        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
        .background(RoundedRectangle(cornerRadius: 15).stroke(Color.etuColors.blue)
                .background(configuration.isPressed ? Color.etuColors.blue.cornerRadius(15) : Color.white.cornerRadius(15))
        )
        .padding(.horizontal, 30)
        .padding(.top, 15)
    }
}

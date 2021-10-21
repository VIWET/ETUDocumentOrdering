import SwiftUI

struct ETUDropdown: View {
    var title: String
    var values: [String]
    @Binding var selectedValue: Int?
    @State private var frameHeight: CGFloat = 30
    @State private var isExpand: Bool = false
    
    var body: some View {
        let value = self.selectedValue ?? -1
        
        VStack(spacing: 10) {
            HStack{
                Text(title)
                    .font(.custom(FontsManager.OpenSansCondensed.bold, size: 14))
                    .foregroundColor(Color.etuColors.blue.opacity(0.6))
                Spacer()
            }
            VStack(spacing: 0) {
                HStack {
                    Text(value > -1 ? values[value] : "Выберите значение")
                        .font(.custom(FontsManager.OpenSansCondensed.light, size: 12))
                        .foregroundColor(Color.etuColors.lightGray.opacity(0.8))
                        .padding(.leading, 10)
                        .padding(.trailing, 40)
                        .padding(.vertical, 5)
                    Spacer()
                    Image("dropDownButton")
                        .rotationEffect(Angle.degrees(self.isExpand ? 180 : 0))
                        .padding(.trailing, 10)
                }
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 30)
                .background(value > -1 ? Color.etuColors.selectedValue : Color.white)
                if self.isExpand {
                    Divider()
                        .opacity(0)
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 1, maxHeight: 1)
                        .background(Color.etuColors.veryLightGray)
                    ForEach(0..<values.count) { i in
                        let isSelected = (i == value)
                        HStack {
                            Text(self.values[i])
                                .font(.custom(isSelected ? FontsManager.OpenSansCondensed.bold : FontsManager.OpenSansCondensed.light, size: 12))
                                .foregroundColor(isSelected ? Color(.white) : Color.etuColors.lightGray.opacity(0.8))
                                .padding(.leading, 10)
                            Spacer()
                        }
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 30)
                        .background(isSelected ? Color.etuColors.blue : Color.white)
                        .onTapGesture {
                            withAnimation {
                                self.selectedValue = i
                                self.isExpand.toggle()
                                setHeight()
                            }
                        }
                    }
                }
            }
            .clipShape(RoundedRectangle(cornerRadius: 5))
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: frameHeight)
            .background(RoundedRectangle(cornerRadius: 5)
                            .stroke(Color.etuColors.veryLightGray))
            
            
        }
        .onTapGesture {
            withAnimation(.easeOut) {
                self.isExpand.toggle()
                setHeight()
            }
        }
    }
    
    private func setHeight() {
        if self.isExpand {
            self.frameHeight = CGFloat(30*(values.count))
        } else {
            self.frameHeight = 30
        }
    }
}

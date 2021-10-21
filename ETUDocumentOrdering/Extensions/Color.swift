import Foundation
import SwiftUI

extension Color {
    static let etuColors = ETUColor()
}

struct ETUColor {
    let blue = Color("ETUBlue")
    let lightBlue = Color("ETULightBlue")
    let darkBlue = Color("ETUDarkBlue")
    
    let gray = Color("ETUGray")
    let lightGray = Color("ETULightGray")
    let veryLightGray = Color("ETUVeryLightGray")
    
    let selectedValue = Color("ETUSelectedValue")
}

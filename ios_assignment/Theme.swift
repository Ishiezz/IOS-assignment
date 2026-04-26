import SwiftUI

enum Theme {
    enum Color {
        static let background     = SwiftUI.Color(hex: "F7FCFA")
        static let blush          = SwiftUI.Color(hex: "FFF1F1")
        static let topBlurPink    = SwiftUI.Color(hex: "E99597")
        static let cardBackground = SwiftUI.Color.white

        static let primaryText   = SwiftUI.Color(hex: "111111")
        static let secondaryText = SwiftUI.Color(hex: "696969")
        static let mutedText     = SwiftUI.Color(hex: "9A9A9A")
        static let gridLine      = SwiftUI.Color(hex: "ECECEC")

        static let lavender     = SwiftUI.Color(hex: "D4C7EF")
        static let lavenderDark = SwiftUI.Color(hex: "9E91D6")

        static let sage     = SwiftUI.Color(hex: "DCEBE4")
        static let sageDark = SwiftUI.Color(hex: "6F8E81")
        static let mint     = SwiftUI.Color(hex: "B2DFDB")
        static let mintDark = SwiftUI.Color(hex: "7FB1A0")

        static let coral     = SwiftUI.Color(hex: "E99597")
        static let coralDark = SwiftUI.Color(hex: "DF8588")

        static let chartPurple = SwiftUI.Color(hex: "BAADE7")
        static let chartPink   = SwiftUI.Color(hex: "EBC6C8")
        static let chartTeal   = SwiftUI.Color(hex: "8EA99C")
        static let chartBlue   = SwiftUI.Color(hex: "53B1FD")
        static let chartCoral  = SwiftUI.Color(hex: "E99597")
    }

    enum Layout {
        static let cornerRadius: CGFloat  = 10
        static let cardPadding: CGFloat   = 14
        static let screenPadding: CGFloat = 16
        static let sectionSpacing: CGFloat = 26
    }
}

extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3:
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6:
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8:
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }
        self.init(.sRGB,
                  red:     Double(r) / 255,
                  green:   Double(g) / 255,
                  blue:    Double(b) / 255,
                  opacity: Double(a) / 255)
    }
}

import SwiftUI

/// Unique visual identity for Eye Drop Timer: fresh mint green with clear-eye blue.
enum Theme {
    static let accent = Color(hex: "#2F7D5B")
    static let accentSecondary = Color(hex: "#5AA9E8")
    static let background = Color(hex: "#EFF8F3")
    static let ink = Color(hex: "#0D1F17")

    static var titleFont: Font {
        Font.system(.largeTitle, design: .default).weight(.bold)
    }

    static var bodyFont: Font {
        Font.system(.body, design: .default)
    }

    static var cardCornerRadius: CGFloat { 18 }
}

extension Color {
    init(hex: String) {
        let s = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var v: UInt64 = 0
        Scanner(string: s).scanHexInt64(&v)
        let r = Double((v >> 16) & 0xFF) / 255.0
        let g = Double((v >> 8) & 0xFF) / 255.0
        let b = Double(v & 0xFF) / 255.0
        self.init(red: r, green: g, blue: b)
    }
}

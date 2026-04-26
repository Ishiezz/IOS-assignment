import SwiftUI

struct LifestyleImpactCard: View {
    struct Row {
        let name: String
        let colors: [Color]
    }

    private let columns = 10
    private let rows: [Row] = [
        Row(name: "Sleep", colors: [
            Theme.Color.lavender.opacity(0.20), Theme.Color.lavender.opacity(0.36),
            Theme.Color.lavender.opacity(0.55), Theme.Color.lavender.opacity(0.72),
            Theme.Color.lavender.opacity(0.88), Theme.Color.lavender.opacity(0.68),
            Theme.Color.background, Theme.Color.background, Theme.Color.background, Theme.Color.background
        ]),
        Row(name: "Hydrate", colors: [
            Theme.Color.chartCoral.opacity(0.50), Theme.Color.chartCoral.opacity(0.72),
            Theme.Color.chartCoral.opacity(0.60), Theme.Color.chartCoral.opacity(0.42),
            Theme.Color.background, Theme.Color.background, Theme.Color.background,
            Theme.Color.background, Theme.Color.background, Theme.Color.background
        ]),
        Row(name: "Caffeine", colors: [
            Theme.Color.sageDark.opacity(0.42), Theme.Color.sageDark.opacity(0.70),
            Theme.Color.sageDark.opacity(0.82), Theme.Color.sageDark.opacity(0.70),
            Theme.Color.sageDark.opacity(0.48), Theme.Color.background,
            Theme.Color.background, Theme.Color.background, Theme.Color.background, Theme.Color.background
        ]),
        Row(name: "Exercise", colors: [
            Theme.Color.chartPink.opacity(0.42), Theme.Color.chartPink.opacity(0.52),
            Theme.Color.chartPink.opacity(0.44), Theme.Color.chartPink.opacity(0.32),
            Theme.Color.background, Theme.Color.background, Theme.Color.background,
            Theme.Color.background, Theme.Color.background, Theme.Color.background
        ])
    ]

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Lifestyle Impact")
                .font(.system(size: 18, weight: .bold))
                .foregroundColor(Theme.Color.primaryText)

            VStack(alignment: .leading, spacing: 22) {
                HStack {
                    Text("Correlation Strength")
                        .font(.system(size: 15, weight: .semibold))
                        .foregroundColor(Theme.Color.primaryText)
                    Spacer()
                    HStack(spacing: 4) {
                        Text("4 months")
                            .font(.system(size: 11, weight: .medium))
                        Image(systemName: "chevron.down")
                            .font(.system(size: 8, weight: .bold))
                    }
                    .foregroundColor(Theme.Color.secondaryText)
                    .padding(.horizontal, 10)
                    .padding(.vertical, 6)
                    .background(Color(hex: "F5F8F7"))
                    .cornerRadius(8)
                }

                VStack(spacing: 14) {
                    ForEach(rows, id: \.name) { row in
                        HStack(spacing: 12) {
                            Text(row.name)
                                .font(.system(size: 11))
                                .foregroundColor(Theme.Color.secondaryText)
                                .frame(width: 52, alignment: .leading)

                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 5) {
                                    ForEach(0..<columns, id: \.self) { col in
                                        let isActive = col < row.colors.filter { $0 != Theme.Color.background }.count
                                        
                                        RoundedRectangle(cornerRadius: 4)
                                            .fill(
                                                isActive ? 
                                                AnyShapeStyle(gradient(for: row.name)) : 
                                                AnyShapeStyle(Color(hex: "EDEBEB"))
                                            )
                                            .frame(width: 28, height: 22)
                                    }
                                }
                            }
                        }
                    }
                }
            }
            .padding(20)
            .background(Color.white)
            .cornerRadius(26)
            .shadow(color: Color.black.opacity(0.03), radius: 20, x: 0, y: 10)
        }
    }

    private func gradient(for name: String) -> LinearGradient {
        let colors: [Color]
        let opacities: [Double]
        
        switch name {
        case "Sleep":
            colors = [Color(hex: "B4A8DA"), Color(hex: "B4A8DA")]
            opacities = [1.0, 0.34]
        case "Hydrate":
            colors = [Color(hex: "E99597"), Color(hex: "E99597")]
            opacities = [1.0, 0.56]
        case "Caffeine":
            colors = [Color(hex: "6E8C82"), Color(hex: "6E8C82")]
            opacities = [1.0, 0.38]
        case "Exercise":
            colors = [Color(hex: "F5C3C4"), Color(hex: "F5C3C4")]
            opacities = [1.0, 0.52]
        default:
            return LinearGradient(colors: [.clear], startPoint: .leading, endPoint: .trailing)
        }
        
        return LinearGradient(
            stops: [
                .init(color: colors[0].opacity(opacities[0]), location: 0),
                .init(color: colors[1].opacity(opacities[1]), location: 0.95)
            ],
            startPoint: .leading,
            endPoint: .trailing
        )
    }
}

import SwiftUI

struct BodySignalsCard: View {
    
    var body: some View {
        VStack(alignment: .leading, spacing: 18) {
            
            // Title
            Text("Body Signals")
                .font(.system(size: 18, weight: .bold))
                .foregroundColor(Theme.Color.primaryText)
            
            // Card
            VStack(alignment: .leading, spacing: 14) {
                
                VStack(alignment: .leading, spacing: 3) {
                    Text("Symptom Trends")
                        .font(.system(size: 15, weight: .semibold))
                        .foregroundColor(Theme.Color.primaryText)
                    
                    Text("Compared to last cycle")
                        .font(.system(size: 12))
                        .foregroundColor(Theme.Color.secondaryText)
                }
                
                ZStack {
                    
                    // Donut Chart
                    DonutChart(data: [
                        (31, Theme.Color.chartPurple), // Bloating
                        (21, Theme.Color.chartCoral),  // Fatigue
                        (17, Theme.Color.sage),        // Acne
                        (30, Theme.Color.chartPink)    // Mood
                    ])
                    .frame(width: 250, height: 250)
                    
                    // Labels
                    DonutLabel(percent: "30%", name: "Mood")
                        .offset(x: -92, y: -72)
                    
                    DonutLabel(percent: "31%", name: "Bloating")
                        .offset(x: 105, y: -55)
                    
                    DonutLabel(percent: "17%", name: "Acne")
                        .offset(x: -105, y: 85)
                    
                    DonutLabel(percent: "21%", name: "Fatigue")
                        .offset(x: 70, y: 105)
                }
                .frame(maxWidth: .infinity)
                .frame(height: 285)
            }
            .padding(20)
            .background(Color.white.opacity(0.96))
            .cornerRadius(26)
            .shadow(color: Color.black.opacity(0.05), radius: 12, x: 0, y: 6)
        }
    }
}

// MARK: - Donut Chart

struct DonutChart: View {
    
    let data: [(Double, Color)]
    
    var body: some View {
        ZStack {
            ForEach(0..<data.count, id: \.self) { index in
                DonutSegment(
                    startAngle: angle(for: index),
                    endAngle: angle(for: index + 1),
                    innerRatio: 0.66
                )
                .fill(data[index].1)
            }
        }
        .rotationEffect(.degrees(-90))
    }
    
    private func angle(for index: Int) -> Angle {
        let total = data.map { $0.0 }.reduce(0, +)
        let value = data.prefix(index).map { $0.0 }.reduce(0, +)
        return .degrees(value / total * 360)
    }
}

// MARK: - Donut Segment Shape

struct DonutSegment: Shape {
    
    var startAngle: Angle
    var endAngle: Angle
    var innerRatio: CGFloat
    
    func path(in rect: CGRect) -> Path {
        
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let outerRadius = min(rect.width, rect.height) / 2
        let innerRadius = outerRadius * innerRatio
        
        var path = Path()
        
        path.addArc(
            center: center,
            radius: outerRadius,
            startAngle: startAngle,
            endAngle: endAngle,
            clockwise: false
        )
        
        path.addArc(
            center: center,
            radius: innerRadius,
            startAngle: endAngle,
            endAngle: startAngle,
            clockwise: true
        )
        
        path.closeSubpath()
        return path
    }
}

// MARK: - Floating Labels

struct DonutLabel: View {
    
    let percent: String
    let name: String
    
    var body: some View {
        VStack(spacing: 2) {
            
            Text(percent)
                .font(.system(size: 11, weight: .medium))
                .foregroundColor(.black)
            
            Text(name)
                .font(.system(size: 9))
                .foregroundColor(.black.opacity(0.72))
        }
        .frame(width: 60, height: 60)
        .background(
            Circle()
                .fill(Color.white)
                .shadow(
                    color: Color.black.opacity(0.14),
                    radius: 14,
                    x: 0,
                    y: 5
                )
        )
    }
}

// MARK: - Preview

#Preview {
    BodySignalsCard()
        .padding()
        .background(Color(.systemGray6))
}

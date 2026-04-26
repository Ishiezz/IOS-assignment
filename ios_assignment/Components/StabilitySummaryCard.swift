import SwiftUI

struct StabilitySummaryCard: View {
    
    var body: some View {
        VStack(alignment: .leading, spacing: 14) {
            
            // Title
            Text("Stability Summary")
                .font(.system(size: 18, weight: .bold))
                .foregroundColor(.black)
            
            VStack(alignment: .leading, spacing: 18) {
                
                // Description
                Text("Based on your recent logs and symptom\npatterns.")
                    .font(.system(size: 14))
                    .foregroundColor(Color(hex: "696770"))
                    .lineSpacing(2)
                
                // Score
                VStack(alignment: .leading, spacing: 2) {
                    Text("Stability Score")
                        .font(.system(size: 16, weight: .medium))
                    
                    Text("78%")
                        .font(.system(size: 24, weight: .bold))
                }
                
                // Graph Area
                HStack(alignment: .bottom, spacing: 10) {
                    
                    // Y Labels
                    VStack(spacing: 34) {
                        Text("32d")
                        Text("28d")
                        Text("24d")
                    }
                    .font(.system(size: 11))
                    .foregroundColor(Color(hex: "696770"))
                    .padding(.bottom, 24)
                    
                    VStack(spacing: 0) {
                        
                        ZStack(alignment: .bottomLeading) {
                            
                            // Grid
                            VStack(spacing: 44) {
                                DashedGrid()
                                DashedGrid()
                                DashedGrid()
                            }
                            
                            GeometryReader { geo in
                                
                                let w = geo.size.width
                                let h = geo.size.height
                                
                                let marX = w * 0.64
                                let marY = h * 0.42
                                
                                ZStack {
                                    
                                    // soft glow
                                    Circle()
                                        .fill(Color(hex: "6E8C82").opacity(0.08))
                                        .frame(width: 150, height: 150)
                                        .blur(radius: 35)
                                        .position(x: w * 0.75, y: h * 0.28)
                                    
                                    // back area
                                    Path { path in
                                        path.move(to: CGPoint(x: 0, y: h))
                                        path.addLine(to: CGPoint(x: 0, y: h * 0.96))
                                        
                                        path.addCurve(
                                            to: CGPoint(x: w * 0.52, y: h * 0.72),
                                            control1: CGPoint(x: w * 0.18, y: h * 0.93),
                                            control2: CGPoint(x: w * 0.36, y: h * 0.82)
                                        )
                                        
                                        path.addCurve(
                                            to: CGPoint(x: w, y: h * 0.18),
                                            control1: CGPoint(x: w * 0.72, y: h * 0.58),
                                            control2: CGPoint(x: w * 0.90, y: h * 0.32)
                                        )
                                        
                                        path.addLine(to: CGPoint(x: w, y: h))
                                        path.closeSubpath()
                                    }
                                    .fill(Color(hex: "D8CCFE"))
                                    
                                    // front area
                                    Path { path in
                                        path.move(to: CGPoint(x: 0, y: h))
                                        path.addLine(to: CGPoint(x: 0, y: h * 0.99))
                                        
                                        path.addCurve(
                                            to: CGPoint(x: w * 0.55, y: h * 0.84),
                                            control1: CGPoint(x: w * 0.20, y: h * 0.97),
                                            control2: CGPoint(x: w * 0.38, y: h * 0.90)
                                        )
                                        
                                        path.addCurve(
                                            to: CGPoint(x: w, y: h * 0.54),
                                            control1: CGPoint(x: w * 0.74, y: h * 0.75),
                                            control2: CGPoint(x: w * 0.90, y: h * 0.62)
                                        )
                                        
                                        path.addLine(to: CGPoint(x: w, y: h))
                                        path.closeSubpath()
                                    }
                                    .fill(Color(hex: "BCA7FD").opacity(0.82))
                                    
                                    // dashed line
                                    Path { path in
                                        path.move(to: CGPoint(x: marX, y: h))
                                        path.addLine(to: CGPoint(x: marX, y: marY))
                                    }
                                    .stroke(
                                        Color(hex: "6E8C82"),
                                        style: StrokeStyle(lineWidth: 1.4, dash: [4,4])
                                    )
                                    
                                    // dot
                                    Circle()
                                        .fill(Color(hex: "6E8C82"))
                                        .frame(width: 14, height: 14)
                                        .overlay(
                                            Circle()
                                                .stroke(Color.white, lineWidth: 2)
                                        )
                                        .position(x: marX, y: marY)
                                    
                                    // tooltip
                                    VStack(spacing: 0) {
                                        
                                        Text("Stability\nImproving")
                                            .font(.system(size: 12, weight: .medium))
                                            .foregroundColor(.white)
                                            .multilineTextAlignment(.center)
                                            .padding(.horizontal, 12)
                                            .padding(.vertical, 8)
                                            .background(Color.black)
                                            .cornerRadius(10)
                                        
                                        Triangle()
                                            .fill(Color.black)
                                            .frame(width: 12, height: 6)
                                            .offset(y: -1)
                                    }
                                    .position(x: marX, y: marY - 44)
                                }
                            }
                        }
                        .frame(height: 138)
                        
                        // X labels
                        HStack {
                            ForEach(["Jan","Feb","Mar","Apr"], id: \.self) { month in
                                Text(month)
                                    .font(.system(size: 12, weight: month == "Mar" ? .bold : .regular))
                                    .foregroundColor(month == "Mar" ? .black : Color(hex: "696770"))
                                    .frame(maxWidth: .infinity)
                            }
                        }
                        .padding(.top, 12)
                    }
                }
            }
            .padding(18)
            .background(
                ZStack(alignment: .topTrailing) {
                    Color.white
                    
                    Circle()
                        .fill(Color(hex: "6E8C82").opacity(0.07))
                        .frame(width: 160, height: 160)
                        .blur(radius: 40)
                        .offset(x: 35, y: -35)
                }
            )
            .cornerRadius(24)
            .shadow(color: .black.opacity(0.04), radius: 10, x: 0, y: 4)
        }
    }
}

// MARK: Grid

struct DashedGrid: View {
    var body: some View {
        Rectangle()
            .fill(Color.clear)
            .frame(height: 1)
            .overlay(
                Rectangle()
                    .stroke(style: StrokeStyle(lineWidth: 1, dash: [4,4]))
                    .foregroundColor(Color(hex: "ECECEC"))
            )
    }
}

// MARK: Triangle

struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.midX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
        path.closeSubpath()
        return path
    }
}

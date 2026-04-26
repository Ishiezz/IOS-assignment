import SwiftUI


struct BodyMetabolicTrendsCard: View {
    
    var body: some View {
        VStack(alignment: .leading, spacing: 14) {
            
            Text("Body & Metabolic Trends")
                .font(.system(size: 18, weight: .bold))
            
            VStack(alignment: .leading, spacing: 18) {
                
                HStack(alignment: .top) {
                    
                    VStack(alignment: .leading, spacing: 2) {
                        Text("Your weight")
                            .font(.system(size: 16, weight: .medium))
                        
                        Text("in kg")
                            .font(.system(size: 12))
                            .foregroundColor(.gray)
                    }
                    
                    Spacer()
                    
                    HStack(spacing: 0) {
                        
                        Text("Monthly")
                            .font(.system(size: 10, weight: .medium))
                            .foregroundColor(.white)
                            .padding(.horizontal, 12)
                            .padding(.vertical, 8)
                            .background(Color.black)
                            .cornerRadius(14)
                        
                        Text("Weekly")
                            .font(.system(size: 10))
                            .foregroundColor(.gray)
                            .padding(.horizontal, 12)
                    }
                    .background(Color(.systemGray6))
                    .cornerRadius(14)
                }
                
                WeightGraph()
                    .frame(height: 220)
            }
            .padding(16)
            .background(Color.white)
            .cornerRadius(22)
            .shadow(color: .black.opacity(0.04), radius: 10, x: 0, y: 4)
        }
        .padding(.horizontal, 16)
    }
}


struct WeightGraph: View {
    
    let labels = ["75","50","25"]
    let months = ["Jan","Feb","Mar","Apr","May"]
    
    let points: [CGPoint] = [
        CGPoint(x: 0.00, y: 0.78),
        CGPoint(x: 0.22, y: 0.55),
        CGPoint(x: 0.48, y: 0.70),
        CGPoint(x: 0.70, y: 0.10),
        CGPoint(x: 0.92, y: 0.45),
        CGPoint(x: 1.00, y: 0.50)
    ]
    
    var body: some View {
        VStack(spacing: 0) {
            
            ZStack {
                
                VStack(spacing: 47) {
                    ForEach(labels, id: \.self) { item in
                        HStack(spacing: 8) {
                            Text(item)
                                .font(.system(size: 10))
                                .foregroundColor(.gray)
                                .frame(width: 24, alignment: .trailing)
                            
                            DashedLine()
                        }
                    }
                }
                
                GeometryReader { geo in
                    
                    let w = geo.size.width
                    let h = geo.size.height
                    let startX: CGFloat = 32
                    let chartW = w - startX
                    
                    let translated = points.map {
                        CGPoint(
                            x: startX + ($0.x * chartW),
                            y: $0.y * h
                        )
                    }
                    
                    Path { path in
                        path.move(to: CGPoint(x: startX, y: h))
                        path.addLine(to: translated[0])
                        
                        for i in 0..<translated.count - 1 {
                            let p1 = translated[i]
                            let p2 = translated[i+1]
                            let mid = (p1.x + p2.x) / 2
                            
                            path.addCurve(
                                to: p2,
                                control1: CGPoint(x: mid, y: p1.y),
                                control2: CGPoint(x: mid, y: p2.y)
                            )
                        }
                        
                        path.addLine(to: CGPoint(x: w, y: h))
                        path.closeSubpath()
                    }
                    .fill(
                        LinearGradient(
                            colors: [
                                Color(red: 233/255, green: 149/255, blue: 151/255).opacity(0.35),
                                Color.white.opacity(0)
                            ],
                            startPoint: .top,
                            endPoint: .bottom
                        )
                    )
                    
                    Path { path in
                        path.move(to: translated[0])
                        
                        for i in 0..<translated.count - 1 {
                            let p1 = translated[i]
                            let p2 = translated[i+1]
                            let mid = (p1.x + p2.x) / 2
                            
                            path.addCurve(
                                to: p2,
                                control1: CGPoint(x: mid, y: p1.y),
                                control2: CGPoint(x: mid, y: p2.y)
                            )
                        }
                    }
                    .stroke(
                        Color(red: 233/255, green: 149/255, blue: 151/255),
                        lineWidth: 2
                    )
                    
                    ForEach(0..<translated.count, id: \.self) { i in
                        Circle()
                            .fill(Color.white)
                            .frame(width: 10, height: 10)
                            .overlay(
                                Circle()
                                    .stroke(
                                        Color(red: 233/255, green: 149/255, blue: 151/255),
                                        lineWidth: 2
                                    )
                            )
                            .position(translated[i])
                    }
                }
            }
            
            HStack(spacing: 0) {
                Spacer().frame(width: 32)
                
                ForEach(months, id: \.self) { month in
                    Text(month)
                        .font(.system(size: 10))
                        .foregroundColor(.gray)
                        .frame(maxWidth: .infinity)
                }
            }
            .padding(.top, 10)
        }
    }
}

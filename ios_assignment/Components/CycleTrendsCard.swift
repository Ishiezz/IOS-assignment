import SwiftUI



struct CycleTrendsCard: View {
    
    private let months = ["Jan","Feb","Mar","Apr","May","Jun"]
    private let values = ["28","30","28","32","28","28"]
    
    private let bars: [CycleBarData] = [
        .init(total: 122, red: 28, greenY: 70),
        .init(total: 138, red: 42, greenY: 88),
        .init(total: 122, red: 42, greenY: 84),
        .init(total: 146, red: 42, greenY: 92),
        .init(total: 122, red: 42, greenY: 84),
        .init(total: 122, red: 28, greenY: 70)
    ]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 14) {
            
            Text("Cycle Trends")
                .font(.system(size: 18, weight: .bold))
                .foregroundColor(.black)
            
            VStack {
                
                ZStack {
                    
                    VStack(spacing: 48) {
                        DashedLine()
                        DashedLine()
                    }
                    .padding(.horizontal, 24)
                    .offset(y: -4)
                    
                    HStack(spacing: 0) {
                        
                        ArrowCircle(icon: "chevron.left")
                        
                        Spacer()
                        
                        ForEach(0..<6, id: \.self) { i in
                            VStack(spacing: 8) {
                                
                                Text(values[i])
                                    .font(.system(size: 12, weight: .bold))
                                
                                CycleBar(data: bars[i])
                                
                                Text(months[i])
                                    .font(.system(size: 10))
                                    .foregroundColor(.gray)
                            }
                            .frame(maxWidth: .infinity)
                        }
                        
                        Spacer()
                        
                        ArrowCircle(icon: "chevron.right")
                    }
                }
                .padding(.horizontal, 14)
                .padding(.vertical, 18)
            }
            .background(Color.white)
            .cornerRadius(22)
            .shadow(color: .black.opacity(0.04), radius: 10, x: 0, y: 4)
        }
        .padding(.horizontal, 16)
    }
}

struct CycleBarData {
    let total: CGFloat
    let red: CGFloat
    let greenY: CGFloat
}

struct CycleBar: View {
    
    let data: CycleBarData
    
    var body: some View {
        ZStack(alignment: .bottom) {
            
            Capsule()
                .fill(Color(red: 212/255, green: 199/255, blue: 239/255))
                .frame(width: 14, height: data.total)
            
            Capsule()
                .fill(Color(red: 233/255, green: 149/255, blue: 151/255))
                .frame(width: 14, height: data.red)
                .overlay(
                    Image(systemName: "drop.fill")
                        .font(.system(size: 6))
                        .foregroundColor(.white)
                        .offset(y: 5)
                )
            
            Capsule()
                .fill(Color(red: 111/255, green: 142/255, blue: 129/255))
                .frame(width: 14, height: 38)
                .overlay(
                    Image(systemName: "sun.max.fill")
                        .font(.system(size: 7))
                        .foregroundColor(.white)
                )
                .offset(y: -data.greenY)
        }
        .frame(height: 150)
    }
}

struct ArrowCircle: View {
    
    let icon: String
    
    var body: some View {
        Circle()
            .stroke(Color(red: 158/255, green: 145/255, blue: 214/255).opacity(0.35), lineWidth: 1)
            .frame(width: 22, height: 22)
            .overlay(
                Image(systemName: icon)
                    .font(.system(size: 10, weight: .bold))
                    .foregroundColor(Color(red: 158/255, green: 145/255, blue: 214/255))
            )
    }
}

struct DashedLine: View {
    var body: some View {
        Rectangle()
            .fill(Color.clear)
            .frame(height: 1)
            .overlay(
                Rectangle()
                    .stroke(style: StrokeStyle(lineWidth: 1, dash: [4,4]))
                    .foregroundColor(Color(.systemGray5))
            )
    }
}


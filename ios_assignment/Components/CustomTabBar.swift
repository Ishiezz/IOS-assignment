import SwiftUI

struct CustomTabBar: View {
    
    var body: some View {
        VStack(spacing: 14) {
            
            HStack(spacing: 14) {
                
                // Left Main Capsule
                HStack(spacing: 0) {
                    
                    TabItem(
                        icon: "house.fill",
                        label: "Home",
                        isActive: false
                    )
                    
                    TabItem(
                        icon: "clock.fill",
                        label: "Track",
                        isActive: false
                    )
                    
                    TabItem(
                        icon: "chart.bar.fill",
                        label: "Insights",
                        isActive: true
                    )
                }
                .frame(width: 226, height: 58)
                .background(
                    Capsule()
                        .fill(Color.white)
                        .shadow(
                            color: .black.opacity(0.13),
                            radius: 18,
                            x: 0,
                            y: 8
                        )
                )
                
                // Plus Button
                Button(action: {}) {
                    Image(systemName: "plus")
                        .font(.system(size: 30, weight: .ultraLight))
                        .foregroundColor(Color(hex: "696770"))
                        .frame(width: 58, height: 58)
                        .background(Color.white)
                        .clipShape(Circle())
                        .shadow(
                            color: .black.opacity(0.13),
                            radius: 18,
                            x: 0,
                            y: 8
                        )
                }
                .buttonStyle(.plain)
            }
            
            // Home Indicator
            Capsule()
                .fill(Color.black)
                .frame(width: 135, height: 5)
        }
        .padding(.bottom, 8)
    }
}


struct TabItem: View {
    
    let icon: String
    let label: String
    let isActive: Bool
    
    var body: some View {
        VStack(spacing: 2) {
            
            Image(systemName: icon)
                .font(.system(size: 18, weight: .semibold))
            
            Text(label)
                .font(.system(size: 10, weight: .medium))
        }
        .foregroundColor(
            isActive ? .black : Color(hex: "B3B3B3")
        )
        .frame(maxWidth: .infinity)
    }
}

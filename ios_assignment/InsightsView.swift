import SwiftUI

struct InsightsView: View {
    var body: some View {
        ZStack(alignment: .bottom) {
            InsightsBackground()

            ScrollView(showsIndicators: false) {
                VStack(spacing: 22) {
                    HeaderView()
                    StabilitySummaryCard()
                    CycleTrendsCard()
                    BodyMetabolicTrendsCard()
                    BodySignalsCard()
                    LifestyleImpactCard()

                    Spacer()
                        .frame(height: 125)
                }
                .padding(.horizontal, Theme.Layout.screenPadding)
                .padding(.top, 20)
            }

            CustomTabBar()
        }
    }
}

struct InsightsBackground: View {
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .top) {
                Theme.Color.background

                // Soft pink top-right glow
                Circle()
                    .fill(Theme.Color.topBlurPink.opacity(0.34))
                    .frame(
                        width: geometry.size.width * 1.45,
                        height: geometry.size.width * 1.45
                    )
                    .blur(radius: 115)
                    .position(
                        x: geometry.size.width * 1.02,
                        y: -25
                    )

                LinearGradient(
                    colors: [
                        Color.white.opacity(0),
                        Theme.Color.background.opacity(0.55)
                    ],
                    startPoint: .top,
                    endPoint: .bottom
                )
            }
        }
        .ignoresSafeArea()
    }
}

struct HeaderView: View {
    var body: some View {
        VStack(spacing: 10) {
            
            // Status Bar
            HStack {
                Text("9:41")
                    .font(.system(size: 17, weight: .semibold))
                    .foregroundColor(Theme.Color.primaryText)

                Spacer()

                HStack(spacing: 6) {
                    Image(systemName: "cellularbars")
                    Image(systemName: "wifi")
                    Image(systemName: "battery.100")
                }
                .font(.system(size: 15, weight: .bold))
                .foregroundColor(Theme.Color.primaryText)
            }
            .padding(.horizontal, 16)
            .frame(height: 44)
            .padding(.top, 8)

            // Header Row
            HStack {
                
                VStack(spacing: 4) {
                    HStack(spacing: 4) {
                        Circle()
                            .fill(Theme.Color.lavender)
                            .frame(width: 10, height: 10)

                        Circle()
                            .fill(Theme.Color.lavender.opacity(0.55))
                            .frame(width: 10, height: 10)
                    }

                    HStack(spacing: 4) {
                        Circle()
                            .fill(Theme.Color.lavender.opacity(0.55))
                            .frame(width: 10, height: 10)

                        Circle()
                            .fill(Theme.Color.lavender)
                            .frame(width: 10, height: 10)
                    }
                }
                .frame(width: 30, height: 30)

                Spacer()

                Text("Insights")
                    .font(.custom("DM Sans", size: 16).weight(.semibold))
                    .foregroundColor(.black)

                Spacer()

                Color.clear
                    .frame(width: 30, height: 30)
            }
            .padding(.top, 6)
        }
    }
}

struct InsightsView_Previews: PreviewProvider {
    static var previews: some View {
        InsightsView()
            .preferredColorScheme(.light)
    }
}

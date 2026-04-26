# iOS Health Insights Application

A premium iOS health tracking interface built with SwiftUI, focusing on high-fidelity visualisations, ambient depth effects, and precise design implementation.

## 📱 Features

### 1. Insights Dashboard
A comprehensive overview of health data, featuring:
- **Stability Summary**: Interactive line graphs tracking stability scores and patterns over time.
- **Body Signals**: A sophisticated donut chart with ambient "blurry" glow effects, displaying symptom trends like Bloating, Fatigue, Acne, and Mood.
- **Cycle Trends**: Sleek, skinny cylindrical bar charts for tracking cycle-related metrics.
- **Lifestyle Impact**: A high-precision correlation strength grid that uses exact hex-based gradients to visualize the relationship between lifestyle habits (Sleep, Hydrate, Caffeine, Exercise) and symptoms.
- **Body & Metabolic Trends**: Weight and metabolic tracking with smooth, curved line graphs.

### 2. High-Fidelity UI/UX
- **Ambient Glows**: Custom-built shaders and layered blurs to create a modern, "glassy" aesthetic.
- **Precise Data Visualization**: Charts implemented with exact design specifications, including hex codes, opacities, and specific block dimensions (e.g., 28x22 correlation blocks).
- **Responsive Layout**: Designed to look stunning on all modern iPhone displays, with attention to safe areas and status bar positioning.

## 🛠 Technical Stack

- **Framework**: SwiftUI
- **Architecture**: Modular Component-based architecture
- **Styling**: Theme-based design system with custom hex-based color palettes.
- **Visuals**: Advanced SwiftUI effects including `LinearGradient`, `AngularGradient`, `blur()`, and `trim()`.

## 📂 Project Structure

- `ios_assignment/`: Main application directory.
    - `InsightsView.swift`: The primary dashboard view.
    - `Components/`: Modular UI building blocks.
        - `BodySignalsCard.swift`: Donut chart implementation.
        - `LifestyleImpactCard.swift`: Correlation strength grid.
        - `CycleTrendsCard.swift`: Bar chart implementation.
        - `StabilitySummaryCard.swift`: Line graph implementation.
    - `Theme.swift`: Centralized color and layout constants.

## 🚀 Getting Started

1. **Clone the repository**:
   ```bash
   git clone https://github.com/Ishiezz/IOS-assignment.git
   ```
2. **Open in Xcode**:
   Open `ios_assignment.xcodeproj` in Xcode 15 or later.
3. **Run**:
   Select an iPhone simulator (e.g., iPhone 15 Pro) and press `Cmd + R` to run the app.

## 🎨 Design Specifications

The application follows strict design guidelines:
- **Inactive States**: `#EDEBEB`
- **Gradients**: Custom linear gradients for health categories (e.g., Sleep: `#B4A8DA` 100% -> 34%).
- **Radius**: Consistent 26px card corner radius and 4px-6px component radius.

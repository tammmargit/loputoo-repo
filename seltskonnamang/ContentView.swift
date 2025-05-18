import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color.orange, Color.pink]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    .ignoresSafeArea()
                
                // Küsimärgid taustal
                ZStack {
                    // Essa küsiumärk, suur
                    Text("?")
                        .font(.system(size: 160))
                        .bold()
                        .foregroundColor(.white.opacity(0.4))
                        .offset(x: 60, y: -100)
                        .rotationEffect(.degrees(-15))
                    
                    // Väiksem küsimärk vasakul
                    Text("?")
                        .font(.system(size: 100))
                        .bold()
                        .foregroundColor(.white.opacity(0.25))
                        .offset(x: -80, y: 50)
                        .rotationEffect(.degrees(10))
                    
                    // Küsimärk paremal
                    Text("?")
                        .font(.system(size: 80))
                        .bold()
                        .foregroundColor(.white.opacity(0.15))
                        .offset(x: 100, y: 90)
                        .rotationEffect(.degrees(5))
                }

                VStack(spacing: 0) {
                    // Pealkiri
                    Image("GameLogo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 350, height: 350)
                        .shadow(radius: 50)

                    // Nupp
                    NavigationLink(destination: CategorySelectionView()) {
                        Text("Jätka mänguga")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: 250)
                            .background(Color.purple)
                            .cornerRadius(15)
                            .shadow(radius: 5)
                    }
                }
                .padding()
            }
        }
    }
}

#Preview {
    ContentView()
}

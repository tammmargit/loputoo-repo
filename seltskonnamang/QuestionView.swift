import SwiftUI

// Struct TruthQuestion
struct TruthQuestion {
    let statement: String
    let isTrue: Bool
    let explanation: String
}

struct QuestionView: View {
    let category: String
    let questions: [Any]
    @State private var currentQuestionIndex = 0
    @State private var showAnswer = false
    @State private var animateQuestion = false
    @Environment(\.presentationMode) var presentationMode
    
    // State muutujad
    @State private var remainingQuestions: [Any] = []
    @State private var currentQuestion: Any?

    var body: some View {
        ZStack {
            // Tausta värv
            LinearGradient(gradient: Gradient(colors: [Color.orange, Color.pink]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            VStack(spacing: 10) {
                // Kategooria pealkiri
                VStack(spacing: 5) {
                    Text(category)
                        .font(.title)
                        .bold()
                        .foregroundColor(.white)
                    
                    Text("Küsimus \(questions.count - remainingQuestions.count) / \(questions.count)")
                        .font(.subheadline)
                        .foregroundColor(.white.opacity(0.8))
                }
                .frame(maxWidth: .infinity, alignment: .top)
                .padding(.top, 20)
                
                Spacer()
                
                if let currentQuestion = currentQuestion {
                    if category == "Tõde või vale?" {
                        if let truthQuestion = currentQuestion as? TruthQuestion {
                            VStack(spacing: 20) {
                                Button(action: {
                                    withAnimation(.spring()) {
                                        showAnswer.toggle()
                                    }
                                }) {
                                    Text(truthQuestion.statement)
                                        .font(.title2)
                                        .bold()
                                        .multilineTextAlignment(.center)
                                        .padding(20)
                                        .frame(maxWidth: .infinity)
                                        .frame(maxWidth: 300)
                                        .background(Color.white)
                                        .cornerRadius(20)
                                        .shadow(radius: 10)
                                        .foregroundColor(.black)
                                }
                                
                                if showAnswer {
                                    VStack(spacing: 10) {
                                        Text("\(truthQuestion.isTrue ? "TÕDE" : "VALE")\n\n\(truthQuestion.explanation)")
                                            .font(.body)
                                            .bold()
                                            .multilineTextAlignment(.center)
                                            .padding(20)
                                            .frame(maxWidth: .infinity)
                                            .frame(maxWidth: 300)
                                            .background(truthQuestion.isTrue ? Color(red: 0.9, green: 1.0, blue: 0.9) : Color(red: 1.0, green: 0.9, blue: 0.9))
                                            .cornerRadius(20)
                                            .foregroundColor(.black)
                                    }
                                    .transition(.opacity)
                                }
                            }
                        }
                    } else {
                        if let question = currentQuestion as? String {
                            Text(question)
                                .font(.title2)
                                .bold()
                                .foregroundColor(.black)
                                .multilineTextAlignment(.center)
                                .padding(30)  
                                .frame(maxWidth: .infinity, minHeight: 250)
                                .background(Color.white)
                                .cornerRadius(20)
                                .shadow(radius: 10)
                                .padding(.horizontal)
                        }
                    }
                }
                
                Spacer()
                
                // Nupud
                HStack(spacing: 20) {
                    Button("Tagasi kategooriatesse") {
                        presentationMode.wrappedValue.dismiss()
                    }
                    .font(.headline)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.orange)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    
                    Button("Järgmine küsimus") {
                        withAnimation(.easeInOut(duration: 0.3)) {
                            showAnswer = false
                            getNextRandomQuestion()
                        }
                    }
                    .font(.headline)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(remainingQuestions.isEmpty ? Color.gray : Color.purple)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .disabled(remainingQuestions.isEmpty)
                }
                .padding(.horizontal)
            }
            .padding(.bottom, 60.0)
        }
        .onAppear {
            // Nulli küsimused
            remainingQuestions = questions
            getNextRandomQuestion()
        }
    }
    
    // Funktsioon juhusliku küsimuse valimiseks
    private func getNextRandomQuestion() {
        guard !remainingQuestions.isEmpty else {
            // Kui kõik küsimused on kasutatud, alusta otsast peale
            remainingQuestions = questions
            // Vali juhuslik küsimus uuesti täidetud listist
            let randomIndex = Int.random(in: 0..<remainingQuestions.count)
            currentQuestion = remainingQuestions[randomIndex]
            remainingQuestions.remove(at: randomIndex)
            return
        }
        
        // Vali juhuslik küsimus allesjäänud küsimuste hulgast
        let randomIndex = Int.random(in: 0..<remainingQuestions.count)
        currentQuestion = remainingQuestions[randomIndex]
        // Eemalda valitud küsimus allesjäänud küsimuste hulgast
        remainingQuestions.remove(at: randomIndex)
    }
}

#Preview {
    QuestionView(category: "Tõde või vale?", questions: [
        TruthQuestion(
            statement: "Inimese süda peatub aevastamise ajaks",
            isTrue: false,
            explanation: "See on müüt. Süda töötab normaalselt edasi."
        )
    ])
}

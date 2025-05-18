import SwiftUI

struct CategorySelectionView: View {
    @State private var isAnimating = false
    
    var body: some View {
        ZStack {
            // Taust
            LinearGradient(gradient: Gradient(colors: [Color.pink, Color.orange]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            // Animeeritud taustaringid
            ZStack {
                ForEach(0..<3) { index in
                    Circle()
                        .stroke(Color.white.opacity(0.2), lineWidth: 2)
                        .frame(width: CGFloat(index + 1) * 100)
                        .offset(x: [-50, 50, -30][index], y: [30, -50, 60][index])
                        .blur(radius: 1)
                }
            }

            VStack(spacing: 25) {
                Text("Vali kategooria")
                    .font(.system(size: 40, weight: .bold))
                    .foregroundColor(.white)
                    .shadow(radius: 5)
                    .padding(.top, 50)
                
                // Kategooria nupud
                Group {
                    NavigationLink(destination: QuestionView(category: "Noorte eri", questions: noorteEriQuestions)) {
                        CategoryCardView(
                            title: "Noorte eri",
                            icon: "flame.fill",
                            color: .orange
                        )
                    }
                    
                    NavigationLink(destination: QuestionView(category: "Tõde või vale?", questions: truthQuestions)) {
                        CategoryCardView(
                            title: "Tõde või vale?",
                            icon: "questionmark.circle.fill",
                            color: .green
                        )
                    }
                    
                    NavigationLink(destination: QuestionView(category: "Täiskasvanute eri", questions: adultQuestions)) {
                        CategoryCardView(
                            title: "Täiskasvanute eri",
                            icon: "person.2.fill",
                            color: .red
                        )
                    }
                    
                    NavigationLink(destination: QuestionView(category: "Jäälõhkujad", questions: icebreakerQuestions)) {
                        CategoryCardView(
                            title: "Jäälõhkujad",
                            icon: "snowflake",
                            color: .blue
                        )
                    }
                }
                .frame(maxWidth: 280)
                .scaleEffect(isAnimating ? 1 : 0.8)
            }
            .padding()
        }
        .onAppear {
            withAnimation(.spring(response: 0.6, dampingFraction: 0.8)) {
                isAnimating = true
            }
        }
    }
}

// Kaardi disain
struct CategoryCardView: View {
    let title: String
    let icon: String
    let color: Color
    
    var body: some View {
        HStack {
            // Ikoon valge ringiga
            ZStack {
                Circle()
                    .fill(.white)
                    .frame(width: 28, height: 28)
                
                Image(systemName: icon)
                    .font(.system(size: 14))
                    .foregroundColor(color)
            }
            
            Text(title)
                .font(.headline)
                .fontWeight(.bold)
                .foregroundColor(.white)
            
            Spacer()
            
            // Nool
            Image(systemName: "chevron.right")
                .foregroundColor(.white)
                .font(.system(size: 14, weight: .bold))
        }
        .padding(.horizontal, 14)
        .padding(.vertical, 12)
        .background(
            RoundedRectangle(cornerRadius: 14)
                .fill(color)
                .overlay(
                    RoundedRectangle(cornerRadius: 14)
                        .stroke(Color.white.opacity(0.3), lineWidth: 1)
                )
        )
        .shadow(color: color.opacity(0.3), radius: 8, x: 0, y: 4)
    }
}

// Custom värvi extension, tumedamaks mby
extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3:
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6:
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8:
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }
        self.init(.sRGB,
                 red: Double(r) / 255,
                 green: Double(g) / 255,
                 blue: Double(b) / 255,
                 opacity: Double(a) / 255)
    }
}

// Küsimuste näited erinevate kategooriate jaoks
let noorteEriQuestions = [
    "Kes su sõpradest saaks kõige tõenäolisemalt TikToki staariks?",
    "Kui sa saaksid ühe inimesega elud üheks päevaks ära vahetada, kes see oleks ja miks?",
    "Kas oled kunagi stalkinud kedagi nii põhjalikult, et jõudsid aastate taguste piltideni?",
    "Kui sa saaksid klassi uuesti nullist kokku panna, kellega sa kindlasti ei tahaks koos olla?",
    "Kes kõige tõenäolisemalt paneks enda parooliks 'parool123'?",
    "Millal sa viimati spikerdasid tunnis?",
    "Kui kõik su sõbrad oleksid koomiksikangelased, kes milline oleks?",
    "Mis on kõige veidram TikTok trend, mida oled proovinud või lihtsalt näinud?",
    "Kui keegi vaataks praegu su YouTube'i või TikToki otsingut, kas sul oleks piinlik?",
    "Kes on su parim sõber?",
    "Näita enda viimast google otsingut",
    "Mida ja kellele sa viimati valetasid?",
    "Kes su sõpradest jääks kõige tõenäolisemalt üksinda saarel ellu?",
    "Kui peaksid terve elu ainult ühe sõbraga hängima, kes see oleks?",
    "Mis on kõige imelikum asi, mida oled Google'ist otsinud?",
    "Kui sa saaksid ühe inimese Instagrami 24 tunniks üle võtta, kelle valiksid?",
    "Mis on kõige naljakam asi, mis sul koolis juhtunud on?",
    "Kas sa oled teeselnud haige olemist, et mitte kooli minna?",
    "Kui sa saaksid ühe aine koolist ära kaotada, mis see oleks?",
    "Kas oled kunagi kogemata sõnumi valesse vestlusesse saatnud? Mis see oli?",
    "Kes on kõige naljakam inimene sinu sõpruskonnas?",
    "Kui peaksid terve aasta ühte ja sama kodutööd tegema, siis mis see oleks?",
    "Räägi oma kõige piinlikumast mälestusest",
    "Kas sa jälgid oma sõprade Snapchati skoori?",
    "Keda sa viimati Instagramis stalkisid?",
    "Mis on viimane asi, mida sa Tiktokist otsisid?",
    "Kes sinu sõpradest postitab kõige cringe'maid asju sotsiaalmeediasse?",
    "Mis on viimane sõnum su parimale sõbrale?",
    "Kellele saatsid viimati südame emoji ja miks?",
    "Mis on su praegune screen time ja mis app võtab kõige rohkem aega?",
    "Kes sinu sõpradest on kõige dramaatilisem?",
    "Kellega oma klassist tahaksid YouTube kanalit teha?",
    "Mis on kõige veidram unenägu, mida oled näinud?",
    "Mis on su secret talent, mida keegi ei tea?",
    "Kes sinu sõpradest on kõige suurem wannabe?"
]

let adultQuestions = [
    "Mis on sinu finantsiline eesmärk järgmiseks viieks aastaks?",
    "Kui sa saaksid oma minevikus ühe otsuse muuta, mis see oleks?",
    "Mis on sinu jaoks ideaalne puhkus?",
    "Kui sa peaksid praegu valima ükskõik mida õppida, mis see oleks?",
    "Kes on olnud kõige ebameeldivam töökaaslane, kellega sa oled pidanud koos töötama?",
    "Kas sul on töökaaslasi, keda sa silma otsast ei salli?",
    "Mis on sinu lemmik viis end hellitada?",
    "Kui sa saaksid elada ükskõik kus maailmas ja raha poleks probleem, kus sa elaksid?",
    "Mis on kõige parem nõuanne, mida sa oled kunagi saanud?",
    "Mis on sinu suurim hirm tuleviku ees?",
    "Mis on parim viis stressi maandamiseks?",
    "Kui sa peaksid oma karjääri homme muutma, mis valdkonna sa valiksid?",
    "Mis on sinu unistuste reisisihtkoht?",
    "Mis on kõige raskem osa lapsevanemaks olemise juures (juhul kui oled lapsevanem)?",
    "Kuidas sa defineerid edu?",
    "Mis on sinu suurim saavutus täiskasvanuna?",
    "Kui sa peaksid homme alustama oma äri, mis see oleks?",
    "Milline on sinu ideaalne nädalavahetus?",
    "Mis on sinu lemmik nõuanne või viis, kuidas töö ja eraelu tasakaalus hoida?",
    "Kui sa saaksid oma praegusele 20-aastasele minale ühe nõuande anda, mis see oleks?",
    "Mis on kõige parem osa täiskasvanuks olemise juures?",
    "Mis on olnud su kõige kallim impulssost, mida oled teinud?",
    "Kui kaua sa saaksid ära elatud oma praegu kontol oleva summaga?",
    "Mis on kõige parem investeering, mille oled teinud?",
    "Millise halva harjumuse tahaksid maha jätta?",
    "Mis on sinu suurim eesmärk elus?",
    "Millise oskuse tahaksid oma lastele edasi anda?",
    "Mis on kõige parem kingitus, mida oled oma partnerilt saanud?",
    "Kuidas sa hoiad oma sõprussuhteid värskena?",
    "Mis on sinu lemmik peretraditsioon?",
    "Millise uue hobiga tahaksid sel aastal alustada?",
    "Mis on kõige hullem tööintervjuu kogemus?",
    "Kas sa oled oma partneri tagant nuhkinud?",
    "Mis on sinu parim säästunipp?",
    "Millise raamatu lugemine on sinu elu muutnud?",
    "Mis on kõige parem ost, mida oled oma kodule teinud?",
    "Kuidas sa hoiad end kursis maailmas toimuvaga?",
    "Mis on sinu lemmik viis perega aega veeta?",
    "Millise halva investeeringu oled teinud?",
    "Kuidas sa valid, milliseid projekte tööl võtta?",
    "Mis on sinu hommikurutiin?",
    "Millise oskuse õppimine on end kõige rohkem ära tasunud?",
    "Kuidas sa valid, kellega koos töötada?",
    "Mis on sinu parim nipp produktiivsuse hoidmiseks?",
    "Millise elustiilinõuande järgimine on end enim ära tasunud?",
    "Kuidas sa valid, kuhu reisida?",
    "Mis on sinu lemmik viis uusi inimesi kohata?",
    "Millise finantsotsuse üle oled kõige uhkem?",
    "Kuidas sa valid, millesse investeerida?",
    "Mis on sinu parim nipp lastega toimetulekuks?",
    "Millise elukogemuse jagaksid noorema põlvkonnaga?",
    "Kuidas sa hoiad oma tervist?",
    "Mis on sinu lemmik viis nädalavahetust veeta?",
    "Millise oskuse tahaksid järgmisena omandada?",
    "Kuidas sa valid, milliseid digitaalseid tööriistu kasutada?",
    "Mis on sinu parim nipp koosolekute pidamiseks?",
    "Millise elustiilimuutuse oled hiljuti teinud?",
    "Kuidas sa valid, milliseid uudiseid jälgida?",
    "Mis on sinu lemmik viis end motiveerida?",
    "Millise vea oled teinud, millest teised võiksid õppida?"
]

let icebreakerQuestions = [
    "Mis on üks asi sinu bucket list'is, mida sa tahaksid teha?",
    "Mis oli sinu esimene töökoht?",
    "Kas sul on ebapopulaarne arvamus (unpopular opinion) millegi kohta?",
    "Mis on sinu jaburam hirm?",
    "Kui sa peaksid aasta aega elama mõnes teises riigis, siis millise sa valiksid?",
    "Mis on mingi fakt, mida keegi siit seltskonnast sinu kohta ei tea?",
    "Kas sa tahaksid teada, kui palju sul on elada jäänud?",
    "Mis on parim kompliment, mida sa oled kunagi saanud?",
    "Milliseid iseloomuomadusi sa oma sõprade juures imetled?",
    "Milline iseloomuomadus sinus endas sulle kõige rohkem meeldib?",
    "Kui sa saaksid olla ekspert ükskõik millises valdkonnas, mis see oleks?",
    "Kas sa pigem reisiksid ajast tagasi või ajast edasi?",
    "Kui sa saaksid valida ükskõik millise fantaasia tegelase oma parimaks sõbraks, kes see oleks?",
    "Mis on kõige veidram unenägu, mida oled näinud?",
    "Kui sa saaksid ajas tagasi reisida kindlasse hetke, siis mis see oleks?",
    "Kas sa pigem oskaksid kõiki muusikainstrumente mängida või räägiksid soravalt kõiki maailma keeli?",
    "Kui sa peaksid oma telefonist kustutama kõik peale 3 äpi, millised sa alles jätaksid?",
    "Mis on sinu lemmik lapsepõlve mälestus?",
    "Kui sa saaksid minna õhtusöögile ükskõik kellega (elus või surnud), kes see oleks?",
    "Mis on kõige ekstreemsem asi, mida sa tahaksid proovida?",
    "Kui sa saaksid elada ükskõik millises filmis, mis see oleks?",
    "Mis on kõige huvitavam koht, kus sa oled käinud?",
    "Mis on kõige naljakam asi, mis sinuga kunagi juhtunud on?",
    "Mis on sinu salajane supertalent?",
    "Kui sa peaksid valima ühe toidu, mida süüa terve aasta, mis see oleks?",
    "Mis on kõige julgem asi, mida sa oled kunagi teinud?",
    "Mis on sinu lemmik vabaaja veetmise viis?",
    "Kui sa oleksid kuulus, siis mille poolest?",
    "Mis on kõige huvitavam fakt, mida sa tead?",
    "Mis on sinu lemmik hommikusöök?",
    "Milline oleks sinu perfektne päev?",
    "Kui sa saaksid luua uue traditsiooni, mis see oleks?",
    "Mis on kõige parem kingitus, mida sa oled kunagi saanud?",
    "Pärast inimesi ja lemmikloomi, mis oleks esimene asi, mida sa päästaksid, kui (jumal hoidku!) sinu kodu põleks?",
    "Kas sa pigem hüpleksid kogu aeg ühel jalal või kõnniksid terve elu tagurpidi?",
    "Kas sa pigem saaksid ainult sosistada või ainult karjuda?"
]

#Preview {
    CategorySelectionView()
}


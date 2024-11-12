import SwiftUI

struct CardView: View {
    @State private var isFaceUp: Bool = false
    var card: MemoGameModel<String>.Card
    var cardColor: Color

    var body: some View {
        let backgroundColor = isFaceUp ? Color.white : cardColor

        ZStack {
            RoundedRectangle(cornerRadius: 12)
                .stroke(lineWidth: 2)
                .foregroundColor(cardColor)
                .background(backgroundColor)
                .cornerRadius(12)
                .opacity(isFaceUp ? 1 : 0.5)
                .aspectRatio(2/3, contentMode: .fit)
                .onTapGesture {
                    withAnimation {
                        isFaceUp.toggle()
                    }
                }

            if isFaceUp {
                Text(card.content)
                    .font(.system(size: 200))
                    .minimumScaleFactor(0.01)
                    .aspectRatio(contentMode: .fit)
            }
        }
        .frame(width: 100, height: 150)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(card: MemoGameModel<String>.Card(id: "1", content: "😀"), cardColor: Color.red)
    }
}

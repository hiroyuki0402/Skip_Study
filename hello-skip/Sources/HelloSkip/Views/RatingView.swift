import SwiftUI

struct RatingView: View {
    
    var rating: Double
    var imageSize: Double = 40

    var body: some View {
        HStack {
            ForEach(0..<5, id: \.self) { index in
                Image(systemName: self.startType(index))
                    .resizable()
                    .frame(width: self.imageSize, height: self.imageSize)
                    .foregroundStyle(.yellow)
                    .font(.largeTitle)
            }
        }
    }

    private func startType(_ index: Int) -> String {
        if index <= Int(rating) {

            if index <= Int(rating) {
                return "star.fill"
            } else {
                return "star.leadinghalf.fill"
            }

        }

        return "star"
    }
}


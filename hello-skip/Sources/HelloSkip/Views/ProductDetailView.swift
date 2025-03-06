import SwiftUI

struct ProductDetailView: View {

    var productData: ProductData
    @Environment(\.dismiss) var dismiss

    var body: some View {
        ScrollView {
            AsyncImage(url: productData.image) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)

            } placeholder: {
                ProductView()
            }

            Text(productData.title)
                .font(.title)

            Text(productData.description)
                .font(.body)

            RatingView(rating: productData.rating?.rate ?? 0.0)

        }
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button("Back") {
                    dismiss()
                }
            }
        }
    }

}

//
//  ProductView.swift
//  hello-skip
//
//  Created by SHIRAISHI HIROYUKI on 2025/03/03.
//
import SwiftUI

struct ProductView: View {

    @Environment(ProductViewModel.self) var viewModel
    @State var isPresented: Bool = false
    @State var selectedProduct: ProductData?

    var body: some View {
        VStack {
            ScrollView {
                LazyVStack {
                    ForEach(viewModel.products, id: \.self) { product in
                        ProductsRowItem(product: product) {
                            selectedProduct = $0
                        }
                    }
                }
            }
        }
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button("AddProduct") {
                    isPresented = true
                }
            }
        }
        .fullScreenCover(item: $selectedProduct) { product in
            NavigationStack {
                ProductDetailView(productData: product)
            }
        }
        .sheet(isPresented: $isPresented) {
            NavigationStack {
                AddProductView()
            }
        }
        .navigationTitle("Products")

    }
}


struct ProductsRowItem: View {

    var product: ProductData

    var didTap: ((ProductData) -> Void)?

    var body: some View {
        VStack {
            Divider()
            HStack {

                AsyncImage(url: product.image) { image in
                    image
                        .resizable()
                        .frame(width: 80, height: 80)
                } placeholder: {
                    ProgressView()
                }

                Text(product.title)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(4)
            .padding(.horizontal)
            .onTapGesture {
                didTap?(product)
            }

        }
    }
}

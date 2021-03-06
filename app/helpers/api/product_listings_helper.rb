module Api::ProductListingsHelper
    def seedProductListings 
        users = User.all
        products = Product.all
        conditions = ['new', 'used', 'excellent', 'worn', 'like new']
        apparel_sizes = ['XS', 'S', 'M', 'L', 'XL']
        sneaker_sizes = ['4', '4.5', '5', '5.5', '6', '6.5', '7', '7.5', '8', '8.5', '9', '9.5', '10', '10.5', '11', '11.5', '12', '12.5', '13', '14', '15', '16', '16', '18']

        100.times do 
            product = products[rand(products.length)]
                if product.product_category === 'sneakers'
                    size = sneaker_sizes
                elsif 
                    product.product_category === 'streetwear'
                    size = apparel_sizes
                else
                    size = 'NA'
                end
                
            ProductListing.create!(product_id: product.id, seller_id: users[rand(users.length)].id, price: product.lowest_ask + rand(-10...10), condition: conditions[rand(conditions.length)], size: size[rand(size.length)]) 
        end
    end
end

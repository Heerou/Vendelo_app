require 'test_helper'

class ProductsControllerCest < ActionDispatch::IntegrationTest
    test 'render a list of products' do
        get products_path

        assert_response :success
        assert_select '.product', 2
    end

    test 'render a detailed product page' do
        get product_path(products(:PS2))

        assert_response :success
        assert_select '.title', 'PS2'
        assert_select '.description', 'Joder una ps2 chipeada'
        assert_select '.price', '50$'
    end

    test 'render a new product form' do
        get new_product_path

        assert_response :success
        assert_select 'form'
    end

    test 'allow to create a new product' do
        post products_path, params: {
            product: {
                tittle: 'Vitual boy',
                description: 'No hay cables',
                price: 200
            }
        }

        assert_redirected_to products_path
    end
end
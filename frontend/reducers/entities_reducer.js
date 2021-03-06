import { combineReducers } from "redux";
import productsReducer from './products_reducer';
import usersReducer from './users_reducer';
import productListingsReducer from './product_listings_reducer';

export default combineReducers({
    users: usersReducer,
    products: productsReducer,
    productListings: productListingsReducer
});
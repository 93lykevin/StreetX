import React from 'react';
import { connect } from 'react-redux';
import { requestProducts } from '../../actions/product_actions';
import ProductIndex from './product_index';

const mapStateToProps = (state, ownProps) => {
  return({
    products: Object.keys(state.entities.products).map(
      id => state.entities.products[id]
    )
  })
};

const mapDispatchToProps = dispatch => ({
  requestProducts: () => dispatch(requestProducts())
});

export default connect(mapStateToProps, mapDispatchToProps)(ProductIndex);
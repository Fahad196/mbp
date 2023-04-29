import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mybigplate/Blocs/CartViewBloc/cart_view_state.dart';
import 'package:mybigplate/Repositories/cart_view_repository.dart';
import 'package:mybigplate/Repositories/update_quantity_cart_repository.dart';
import 'cart_view_event.dart';

class CartViewBloc extends Bloc<CartViewEvent, CartViewState> {
  CartViewRespository respository;
  UpadteQuantityCartRepository repository1;
  CartViewBloc(this.respository,this.repository1) : super(CartViewLoadingState()) {
    on<CartViewLoadingEvent>((event, emit) => emit(CartViewLoadingState()));
    on<CartViewLoadedEvent>((event, emit) async{
      try {
        var data =await respository.getCartList(event.token,event.resId);
      log("Data ::::::::::$data");
        emit(CartViewLoadedState(data));
      } catch (e) {
        emit(CartViewErrorState(e.toString()));
      }
    });




//  on<InitailQuantityEvent>(
//         (event, emit) => emit(InitialQuantityState()));
//     on<IncreaseItemQuantityCartEvent>((event, emit) async {
//       emit(UpdateQuantityCartLoadingState());
//       try {
//         final data = await repository1.updateQuantity(
//             event.cartId,
//             event.itemPrice,
//             event.itemQuantity,
//             event.resturantId,
//             event.portion,event.token);
       
//           emit(IncreaseItemQuantityCartState(quantityCartModel: data));
       
//       } catch (e) {
//         log(e.toString());
//         emit(UpdateQuantityCartErrorState(e.toString()));
//       }
//     });
//    on<DecreaseItemQuantityCartEvent>((event, emit) async {
//       emit(UpdateQuantityCartLoadingState());
//       try {
//         final data = await repository1.updateQuantity(
//             event.cartId,
//             event.itemPrice,
//             event.itemQuantity,
//             event.resturantId,
//             event.portion,event.token);
       
//           emit(DecreaseItemQuantityCartState(quantityCartModel: data));
       
//       } catch (e) {
//         log(e.toString());
//         emit(UpdateQuantityCartErrorState(e.toString()));
//       }
//     });
on<RefreshCartViewEvent>((event, emit) => emit(RefreshCartViewState()));
  }
}

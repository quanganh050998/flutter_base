// import 'package:components/load_image/load_image.dart';
// import 'package:components/style/style.dart';
// import 'package:configuration/l10n/l10n.dart';
// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import 'package:position_exchange/domain/manager/wallet_manager.dart';
// import 'package:position_exchange/generated/assets.dart';
// import 'package:position_exchange/presentation/commons/select_wallet/widgets/select_wallet_bottom_sheet.dart';
// import 'package:position_exchange/presentation/pin_code/pin_code_route.dart';
// import 'package:position_exchange/presentation/pin_code/ui/pin_code_screen.dart';
// import 'package:position_exchange/presentation/wallet/wallet_init/initial_wallet_route.dart';
//
// class WalletAction extends StatelessWidget {
//   final WalletState walletState;
//
//   const WalletAction({Key? key, required this.walletState}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return _buildWalletAction(context, walletState);
//   }
//
//   _buildWalletAction(BuildContext context, WalletState walletState) {
//     String actionText = '';
//     switch (walletState) {
//       case WalletState.noWallet:
//         actionText = S.current.connectWallet;
//         break;
//       case WalletState.noneSelected:
//         actionText = S.current.selectWallet;
//         break;
//       case WalletState.posiSelectedNotLoggedIn:
//         actionText = S.current.login;
//         break;
//       default:
//         return '';
//     }
//
//     return Column(
//       mainAxisSize: MainAxisSize.max,
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         const LoadImage(
//           url: Assets.imagesMyLiquidityEmptyNoWalletDark,
//           width: 166,
//           height: 166,
//         ),
//         const SizedBox(height: 20),
//         Container(
//           alignment: Alignment.center,
//           margin: const EdgeInsets.symmetric(horizontal: 20),
//           child: RichText(
//             textAlign: TextAlign.center,
//             text: TextSpan(
//               style: theme.font.t16RBody,
//               children: <TextSpan>[
//                 TextSpan(
//                   recognizer: TapGestureRecognizer()
//                     ..onTap = () {
//                       _handleWalletAction(context, walletState);
//                     },
//                   text: actionText,
//                   style: theme.font.t16MButton.copyWith(
//                     color: theme.color.primary3,
//                   ),
//                 ),
//                 TextSpan(
//                   text: ' ${S.current.toVieYourRewards}',
//                   style: theme.font.t16RBody.copyWith(
//                     color: theme.color.gray500,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ],
//     );
//   }
//
//   _handleWalletAction(BuildContext context, WalletState state) {
//     switch (state) {
//       case WalletState.noWallet:
//         InitialWalletRoute.pushNamed();
//         break;
//       case WalletState.noneSelected:
//         showSelectWalletBottomSheet(context);
//         break;
//       case WalletState.posiSelectedNotLoggedIn:
//         PinCodeRoute.pushNamed(typePin: TypePin.logIn);
//         break;
//       default:
//       // Ignore
//     }
//   }
// }

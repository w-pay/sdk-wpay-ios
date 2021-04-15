import UIKit

public protocol DigitalPayRepository {
	var androidPay: AndroidPayApiRepository { get }
	var applePay: ApplePayApiRepository { get }
	var cards: CardsApiRepository { get }
	var giftcards: GiftcardsApiRepository { get }
	var googlePay: GooglePayApiRepository { get }
	var instruments: InstrumentsApiRepository { get }
	var merchants: MerchantsApiRepository { get }
	var openPay: OpenPayApiRepository { get }
	var paymentAgreements: PaymentAgreementApiRepository { get }
	var payments: PaymentApiRepository { get }
	var paypal: PayPalApiRepository { get }
	var transactions: TransactionsApiRepository { get }
	var wallet: WalletApiRepository { get }
}
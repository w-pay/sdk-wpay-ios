import UIKit

/**
	The details of the payment to be created.
 */
public protocol NewPaymentRequest {
	/** The unique reference for the payment */
	var merchantReferenceId: String { get }

	/** The gross amount to be paid. Must be positive */
	var grossAmount: Decimal { get }

	/** Whether a `QRCode` should be created and returned in the response */
	var generateQR: Bool { get }

	/**
		The number of times that the payment request can be used to create a payment.

		If absent, the API will default value to 1.

		If set to 0 then the request can be used an unlimited number of times.
	*/
	var maxUses: Int? { get }

	/**
		The time in seconds that the payment request should remain valid.

		After this time any use of the request to create a payment will fail.

		If absent, the API will default value to 0 which indicates that the payment request will not expire until it is deleted
	 */
	var timeToLivePayment: Int? { get }

	/**
		The time in seconds that the QR code should remain valid.

		After this time any use of the request to create a payment will fail.

		If absent, the API will default value to 0 which indicates that the code will not expire until it is deleted
	 */
	var timeToLiveQR: Int? { get }

	/**
		The ID of a specific wallet for which the payment is intended.

		Can be used in scenarios where a customer has previously requested that their wallet ID is retained for repeat purchase.

		If supplied the payment can only be used by the intended wallet.

		If absent then any wallet can create a payment against the Payment Request
	 */
	var specificWalletId: String? { get }

	/** The `Basket` associated to the transaction. */
	var basket: Basket? { get }

	/** Optional extra details from the POS. */
	var posPayload: PosPayload? { get }

	/** Optional extra details from the merchant. */
	var merchantPayload: MerchantPayload? { get }
}

import UIKit

/**
 :nodoc:
*/
public protocol MerchantPayments {

}

/**
	List of payments made involving a merchant.
 */
public protocol MerchantPaymentSummaries: MerchantPayments {
	/** The resulting list of payments. */
	var payments: [MerchantPaymentSummary] { get }
}

/**
	Summary information for a single Payment Request
 */
public protocol MerchantPaymentSummary: Payment {
	/**
		The number of times that the payment request can be used to create a payment.

		If absent then request can be used an unlimited number of times.
	 */
	var usesRemaining: Int? { get }

	/**
		The Timestamp for when the payment request will expire and become unusable for payments.

		If absent then the payment request will not expire until it is deleted
	 */
	var expiryTime: Date? { get }

	/**
		The ID of a specific wallet for which the payment is intended.

		If present then the payment can only be used by the intended wallet.
		If absent then any wallet can create a payment against the Payment Request.
	 */
	var specificWalletId: String? { get }
}

/**
	Detailed information for a single Payment Request
 */
public protocol MerchantPaymentDetails: MerchantPaymentSummary {
	/** The `Basket` associated to the transaction. */
	var basket: Basket? { get }

	/** Optional extra details from the POS. */
	var posPayload: PosPayload? { get }

	/** Optional extra details from the merchant. */
	var merchantPayload: MerchantPayload? { get }
}
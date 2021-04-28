import UIKit

/**
 Data required to charge against a `PaymentAgreement`
 */
public protocol ChargePaymentAgreementRequest {
	/**
	 The payment token of the payment agreement.

	 The payment token is a unique identifier for the payment agreement.
	 */
	var paymentToken: String { get }

	/**
	 The amount that will be charged against the payment instrument linked to the payment agreement.
	 */
	var amount: Decimal { get }

	/**
	 A merchant application specific reference number for the transaction.
	 */
	var clientReference: String { get }

	/**
	 A merchant order number for the transaction.
	 */
	var orderNumber: String { get }

	/**
	 Transaction type containers to use for all instruments.
	 */
	var transactionType: TransactionType { get }

	/**
	 A merchant application specific reference number for the customer.
	 */
	var customerRef: String? { get }
}

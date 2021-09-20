import UIKit

/**
 The JSON request structure of the Charge Payment Agreement endpoint.
 */
public protocol DigitalPayChargePaymentAgreementRequest {
	/** Transaction type containers to use for all instruments. */
	var transactionType: PaymentTransactionType { get }

	/**
	 A merchant application specific reference number.

	 This number should uniquely identify the transaction in the merchant’s system.
	 */
	var clientReference: String { get }

	/**
	 A merchant application specific reference number.

	 This number should uniquely identify the customer in the merchant’s system.
	 */
	var customerRef: String? { get }

	/** The merchant order number of the transaction. */
	var orderNumber: String { get }

	/**
	 The payment token of the payment agreement.

	 The payment token is a unique identifier for the payment agreement.
	 */
	var paymentToken: String { get }

	/** The amount that will be charged against the payment instrument linked to the payment agreement. */
	var amount: Decimal { get }

	/** Digital Pay fraud payload */
	var fraudPayload: DigitalPayFraudPayload? { get }
}
